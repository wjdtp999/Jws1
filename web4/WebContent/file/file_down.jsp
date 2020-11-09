<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.* , javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
     <%
     Connection conn=null;
 	
 	Context init = new InitialContext();
 	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
 	conn = ds.getConnection();
 	
 	int num =Integer.parseInt(request.getParameter("num"));
 	           //           업로드파일에서 전체를가져오는게아니라 where num 어떤파일을가져오는지 알림
 	String sql="select * from uploadfile where num="+num;
 	Statement stmt=conn.createStatement();
 	ResultSet rs=stmt.executeQuery(sql);
 	//데이터베이스를 열어줌
 	String filename="";
 	if(rs.next()){
 		filename=rs.getString("fname");
 		}
 	
 	String path="C:/Users/USER506-15/eclipse-workspace/web4/WebContent/img/";
 	byte b[]= new byte[4096];
 	FileInputStream in=new FileInputStream(path+filename);
 	String mtype=getServletContext().getMimeType(path+filename);
 	response.setContentType(mtype);
 	
 	// 파일을 클라이언트측에서 다운할떄 한글같은게 깨지지않게 인코딩하는작업
 	filename=new String(filename.getBytes("UTF-8"),"iso-8859-1");
 	response.setHeader("Content-Disposition","attachement; filename="+filename);
 	//클라이언트에게창을띄워주는작ㄱ업
 	
 	
 	//전달하는기능
 	ServletOutputStream ot= response.getOutputStream();
 	int read;
 	
 	while((read=in.read(b, 0,b.length)) != -1){
 		ot.write(b,0,read);
 	}
 	
 	//사용후 데이터베이스를 닫기 메모리가 계속남아있음
 	ot.flush();
 	ot.close();
 	in.close();
 	rs.close();
 	stmt.close();
 	conn.close();
     %>