<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.* , javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	Connection conn=null;
	
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	conn = ds.getConnection();
	
%>
<%             
                      // getreadlpath는 웹에서 사용하는 경로가아닌 진짜경로를 사용하겠다라는메소드 
	//String path= request.getRealPath("/img"); //실제 저장ㄱ경로
	     // 10m
	 String path="C:/Users/USER506-15/eclipse-workspace/web4/WebContent/img"; 
	//이클립스 프로젝트 경로 
 int size=10*1024*1024; //10메가바이트 업로드 파일크기 제한
 String filename="";
 String original="";
 
 try{
	 MultipartRequest multi= new MultipartRequest(
			 request,path,size,"UTF-8",new DefaultFileRenamePolicy()
			 );
	                          
      Enumeration files=multi.getFileNames();
      while(files.hasMoreElements()){ //hasmoreElements는 파일이 세개 다하면 첫번째파일이름을 뺴오고 두번쨰로이동  
      String file=(String)files.nextElement();

      filename=multi.getFilesystemName(file); //서버 저장이름  
      
      original= multi.getOriginalFileName(file); //업로드 파일 이름
      }
 }catch(Exception e){
	 e.printStackTrace();
 }
      int num=1;
      String incre="select Max(num) as m from uploadfile";
      Statement st=conn.createStatement();
      ResultSet rs=st.executeQuery(incre);
      if(rs.next()){
    	  num= rs.getInt("m")+1;
      }
      
      String enc= filename.substring(filename.indexOf(".")+1);
      
      // uploadfile 이라는 데이터베이스의 테이블에
 	String sql="insert into uploadfile(num,fname,enc)";
 	sql +="values("+num+",'"+filename+"','"+enc+"')";
 	             // num fname enc 저장
 	  
 	Statement stmt=conn.createStatement();
 	stmt.executeUpdate(sql);
	
%>
파일 이름 : <%=original %> <br>
파일 저장 이름 : <%=filename %> <br>
<a href='filelist.jsp'>업로드 파일 리스트 </a>
<a href="reup.jsp">파일업로드</a>
<%=path%>