package com.exchange;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class exchange_dao {
	private Connection conn;
	
	public exchange_dao(){
		try {
			conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:wjdtp999");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("exchange_dao 커넥션 오류");
		}
	}
	private ArrayList<Integer> get_sugnum(String sug){
		if(sug.equals("0")) return null; // 제안자가 없다면  null 리턴
		ArrayList<Integer> num = new ArrayList<Integer>();
		String[] temp = sug.split("-");
		for(int i=0; i<temp.length; i++)
			num.add(Integer.parseInt(temp[i]));
		return num;
	}
	public int select_count(String table) {
		String sql="select count(*) from "+table;
		try(Statement stmt=conn.createStatement(); ResultSet rs=stmt.executeQuery(sql)){
				if(rs.next()) {
					return rs.getInt(1);
				}
				
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(table+"총 갯수 DB조회 오류");
		}
		return 0;
	}
	public exchange view(String table, int num) {
		String sql = "select * from "+table+" where num="+num;
		try ( Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				exchange temp = new exchange(
rs.getInt("num"),rs.getString("name"),rs.getString("title"),
rs.getString("content"),rs.getString("img").split("-"),
rs.getDate("dt"),get_sugnum(rs.getString("sug"))						
				);
				return temp;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(table+" 글보기 오류");
		}
		return null;
	}
	public ArrayList<exchange> all_select(String table,int startRow,int size){
		String sql="select * from (select row_number()";
		sql +=" over(order by num desc) n, A.* from "+table+" A order by num desc)";
		sql +=" where n between "+startRow+" and "+(startRow+9);
		ArrayList<exchange> data = new ArrayList<exchange>();
		
		try(Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				exchange temp = new exchange(
rs.getInt("num"),rs.getString("name"),rs.getString("title"),
rs.getString("content"),rs.getString("img").split("-"),
rs.getDate("dt"),get_sugnum(rs.getString("sug"))
				);
				data.add(temp);
			}
			return data;
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(table+" 데이터 불러오기 실패");
		}
		return null;
	}
	
	public void board_save(String table,String writer, String title,
			String content, String filename) {
		try {
			int num=mytag.db_lib.get_num(table, conn);
			String sql ="insert into "+table+"(num,name,title,content,"
					+ "img,dt,sug,type) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ptmt  = conn.prepareStatement(sql);
			ptmt.setInt(1, num);
			ptmt.setString(2, writer);
			ptmt.setString(3, title);
			ptmt.setString(4, content);
			ptmt.setString(5, filename);
			ptmt.setTimestamp(6, new Timestamp(new Date().getTime()));
			ptmt.setString(7, "0");
			ptmt.setString(8, "0");
			ptmt.executeUpdate();
			
			ptmt.close();
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("글 등록 실패 dao");
		}
		
	}
	
}
