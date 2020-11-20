package com.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class member_dao {
		
	private Connection conn;
	 
	
	public member_dao() {
		try {
			conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:wjdtp999");
		}catch(SQLException e) {
			System.out.println("member_dao 커넥션 오류");
		}
	}
	
	//member_service 클래스의 login 메서드와연결
	public member member_select(String id,String pw) {
		String sql="select * from member where email='"+id+"' and pword='"+pw+"'";
		try {
		Statement stmt= conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()) {
			member user=new member(
					rs.getString("email"),
					rs.getString("tel"),
					rs.getString("name"),
					rs.getString("addr"),
					rs.getString("field"),
					rs.getInt("trust")
					);
			rs.close();
			stmt.close();
			conn.close();
			return user;
			}
		}catch(SQLException e) {
		e.printStackTrace();
		System.out.println("로그인 db실패");
		}
		return null;
	}

	//member_service 클래스의 join 메서드와연결
	public void member_insert(String email,String pword,String tel,String name,String addr,String field) {
				String sql="insert into member(num,email,pword,name,tel,trust,addr,field)";
				sql +=" values(?,?,?,?,?,?,?,?)";
				
				try {
				PreparedStatement ptmt=conn.prepareStatement(sql);
				ptmt.setInt(1,mytag.db_lib.get_num("member", conn));
				ptmt.setString(2, email);
				ptmt.setString(3, pword);
				ptmt.setString(4,name);
				ptmt.setString(5,tel);
				ptmt.setInt(6, -1);
				ptmt.setString(7,addr);
				ptmt.setString(8,field);
				ptmt.executeUpdate();
				ptmt.close();
				conn.close();
				} catch(SQLException e) {
					System.out.println("member_insert오류");
				} 
	}
	
	public void sug_update(String name,int sug_num) {
		String my_sug = get_sug(name);
		if(my_sug.equals("0"))
			my_sug=Integer.toString(sug_num);
		else
			my_sug += ("-"+sug_num);
			
			String sql="update member set sug ='"+my_sug+"' where name='"+name+"'";
			try(Statement st=conn.createStatement()){
				
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("sug_update 오류");
			}
	}
	private String get_sug(String name) {
		 	String sql = "select sug_num from member where name='"+name+"'";
		 	try(Statement st=conn.createStatement(); ResultSet rs=st.executeQuery(sql)){
		 		if(rs.next())
		 			return rs.getString(1);
		 	}catch(SQLException e) {
		 		e.printStackTrace();
		 		System.out.println("sug_num 조회 오류 ");
		 	}
		 	return null;
	}
	
	public member member_update(String id,String pword, String tel, String addr, String field) {
		if(pword=="") {		
			String sql="select pword from member where email='"+id+"'";
			try(Statement stmt=conn.createStatement(); ResultSet rs= stmt.executeQuery(sql)){
				if(rs.next()) {
					pword=rs.getString("pword");
				}
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("업데이트중 암호 조회 실패");
			}
		}
		String sql="update member set pword='"+pword+"', tel='"+tel+"', addr='"+addr+"', field='"+field+"' where email='"+id+"'";
			try (Statement stmt=conn.createStatement()){
				 stmt.executeUpdate(sql);
				 
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("회원 정보 수정 실패");
			}
			return member_select(id,pword);
	}
}
