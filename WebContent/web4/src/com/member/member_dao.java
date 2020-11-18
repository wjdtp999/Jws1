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
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:jkr");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public member login(String id, String pw) {
		String sql="select * from member where id='"+id+"' and pw='"+pw+"'";
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				member user = new member(
				rs.getString("id"),rs.getString("name"),
				rs.getString("tel"),rs.getString("email")
						);
				
				return user;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("로그인 데이터베이스 실패");
		}
		return null;
	}
	public void join(member data) throws SQLException {
		String sql = "insert into member(num,id,pw,name,tel,email)";
		sql += " values(?,?,?,?,?,?)";
		PreparedStatement pt=null;
		try {
			pt = conn.prepareStatement(sql);
			pt.setInt(1, get_num("member"));
			pt.setString(2, data.getJoin_id());
			pt.setString(3, data.getJoin_pw());
			pt.setString(4, data.getJoin_name());
			pt.setString(5, data.getJoin_tel());
			pt.setString(6, data.getJoin_email());
			pt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			pt.close();
			conn.close();
		}
	}
	public int get_num(String table) throws SQLException {
		String sql="select Max(num) as m from "+table;
		int num=1;
		Statement st=null;
		ResultSet rs=null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				num= rs.getInt("m")+1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			rs.close();
			st.close();
		}
		return num;
		
	}
}



