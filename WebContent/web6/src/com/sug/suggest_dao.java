package com.sug;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class suggest_dao {
	
	
	private Connection conn;
	
	public suggest_dao() {
		try {
			conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:wjdtp999");
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("sug 커넥션 실패");
		}
	}
	public void insert(String kind, String content, String writer, int num,String who) {
		String sql="insert into suggestion(num,name,content,accept,kind,select_num)";
		sql +=" values(?,?,?,?,?,?)";
		try(PreparedStatement ptmt=conn.prepareStatement(sql)){
			int n=mytag.db_lib.get_num("suggestion",conn);
			ptmt.setInt(1, n);
			ptmt.setString(2, writer);
			ptmt.setString(3, content);
			ptmt.setInt(4, 0);
			ptmt.setString(5, kind);
			ptmt.setInt(6,num);
			ptmt.executeUpdate();
			new com.member.member_dao.sug_update(who, n);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(kind+"제안 글등록 오류");
		}
	}

}
