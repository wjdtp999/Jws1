package com.notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class notice_dao {
	private Connection conn;
	public notice_dao(){
		try {
			conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:wjdtp999");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("notice DB 커넥션 실패");
		}
	}
	
	public ArrayList<notice> all_data(){
		ArrayList<notice> data = new ArrayList<notice>();
		String sql="select * from notice order by num desc";
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				notice temp = new notice(
		rs.getInt("num"),rs.getString("title"),
		rs.getDate("notice_date")	
				);
				data.add(temp);
			}
			rs.close();
			st.close();
			conn.close();
			return data;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public notice select(int num) {
		String sql ="select * from notice where num="+num;
		
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				notice temp = new notice(
		rs.getInt("num"),rs.getString("title"),
		rs.getString("content"),rs.getDate("notice_date")
				);
				return temp;
			}
		}catch(SQLException e) {
			System.out.println("notice 글 하나 db 실패");
		}
		return null;
	}
}



