<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

                <%  //        java 파일 임폴트 %>
<%@ page import="java.util.*, com.pc.product, java.util.Date"  %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%

	Connection conn=null;

	Context init =new InitialContext();
	DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	conn =ds.getConnection();
	
	String path="C:/Users/USER506-15/eclipse-workspace/web4/WebContent/img";  //이클립스 프로젝트 경로

	int size=10*1024*1024;  // 파일 사이즈 제한

	String[] filename=new String[]{null,null,null}; //File 의 이름을 담은 객체 생성
	   // pc_product의 내가 쓴 정보들을 담는 product.java의 객체생성
	product pd= null;
	String cmd="";
	try{
		MultipartRequest multi = new MultipartRequest(
		request , path, size,"UTF-8",new DefaultFileRenamePolicy()
				);
		cmd=multi.getParameter("cmd");
		           //java 객체안의 데이터를 가져오기
		pd.setPd_name(multi.getParameter("pd_name"));
		pd.setPd_price(Integer.parseInt(multi.getParameter("pd_price")));
		pd.setAm(Integer.parseInt(multi.getParameter("am")));
		pd.setCpu(Float.parseFloat(multi.getParameter("cpu")));
		pd.setDetail_img(multi.getParameter("detail_img"));
		pd.setMb(multi.getParameter("mb"));
		pd.setPd_img(multi.getParameter("pd_img"));
		pd.setPd_soft(multi.getParameter("pd_soft"));
		pd.setRam(Integer.parseInt(multi.getParameter("ram")));
		pd.setSsd(Integer.parseInt(multi.getParameter("ssd")));
		
		Enumeration files = multi.getFileNames();  //파일 이름 가져오기
		int i=0;
		while(files.hasMoreElements()){ // 첫번쨰파일가져오고 다음파일이 있으면 가져오는 while문 생성
			
			String file = (String)files.nextElement();
			filename[i++] = multi.getFilesystemName(file);			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	String sql="";
	Date now=new Date();
	int num;
	int hit=0;
	if(cmd!=null){
		product prd=(product)session.getAttribute("pd");
		 filename[2] = filename[2]==null ? prd.getDetail_img() : filename[2];
		 filename[1] = filename[1]==null ? prd.getPd_img() :filename[1];
		 filename[0] = filename[0]==null ? prd.getPd_soft() : filename[0];
		 num = prd.getNum();
		 hit=prd.getHit();
		  sql="update pc set num=? ,pc_name=?,pc_price=?,cpu=?,ram=?,ssd=?,maindoard=?,pc_ea=?,detail=?,pc_img=?,soft=?,pc_date=?,hit=? where num="+prd.getNum();
	}else{
	num=1;   
	String incre="select Max(num) as m from pc";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(incre);
	if(rs.next()){
		num = rs.getInt("m")+1;
	}
	
	
	                         // 데이터베이스의 PC테이블에 저장
	                         //sql 문생성해서 insert into pc (데이터1,데이터2) 넣고
	                         //sql+= "values("+데이터1",'"+데이터2')"; 
	sql="insert into pc(num, pc_name,pc_price,cpu,ram,ssd,mainboard,pc_ea,detail,pc_img,soft,pc_date,hit) ";
	sql += "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	}
	System.out.println(sql);
	PreparedStatement ptmt = conn.prepareStatement(sql);
   // sql문에 저장된 데이터를 Db에 저장해줌
	ptmt.setInt(1, num);
    ptmt.setString(2, pd.getPd_name());
    ptmt.setInt(3,pd.getPd_price());
    ptmt.setFloat(4,pd.getCpu());
    ptmt.setInt(5,pd.getRam());
    ptmt.setInt(6,pd.getSsd());
    ptmt.setString(7, pd.getMb());
    ptmt.setInt(8, pd.getAm());
    ptmt.setString(9, filename[0]);
    ptmt.setString(10, filename[1]);
    ptmt.setString(11, filename[2]);
    ptmt.setTimestamp(12, new Timestamp(now.getTime()));
    ptmt.setInt(13, hit);
    
    ptmt.executeUpdate();
	// connection과 createStatement 닫아줌
	ptmt.close();
	conn.close();
	
	response.sendRedirect("index.jsp?page=product_list");
%>