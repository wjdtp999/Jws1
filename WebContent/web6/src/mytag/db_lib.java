package mytag;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

import com.exchange.exchange;

public class db_lib {
	

	
	public ArrayList<exchange> item(){
		ArrayList<exchange> data = new ArrayList<exchange>();
		try {
			Connection conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:wjdtp999");
			String[] table = {"ability","buty","digital","fashion",
				"furniture"};
			
			for(int i=0; i<table.length; i++) {
				String sql="select * from "+table[i]+" where type='item' order by dt desc";
				Statement stmt = conn.createStatement();
			
				ResultSet rs = stmt.executeQuery(sql);
				for(int k=1; k<=2 && rs.next(); k++) {
					exchange temp=new exchange(
		rs.getInt("num"),rs.getString("name"),rs.getString("title"),
		rs.getString("content"),rs.getString("img").split("-"),
		rs.getDate("dt"), get_sugnum(rs.getString("sug"))
					);
					data.add(temp);
				}
			}
			return data;
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("물물교환 db 읽기 실패");
		}
		return null;
	}
	public ArrayList<exchange> labor(){
		ArrayList<exchange> data = new ArrayList<exchange>();
		try {
			Connection conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:wjdtp999");
			String[] table = {"ability","buty","digital","fashion",
				"furniture"};
			
			for(int i=0; i<table.length; i++) {
				String sql="select * from "+table[i]+" where type='labor' order by dt desc";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				for(int k=1; k<=2 && rs.next(); k++) {
					exchange temp=new exchange(
		rs.getInt("num"),rs.getString("name"),rs.getString("title"),
		rs.getString("content"),rs.getString("img").split("-"),
		rs.getDate("dt"), get_sugnum(rs.getString("sug"))
					);
					data.add(temp);
				}
			}
			return data;
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("품앗이 db 읽기 실패");
		}
		return null;
	}
	public ArrayList<Integer> get_sugnum(String sug){
		String[] temp = sug.split("-");
		ArrayList<Integer> num = new ArrayList<Integer>();
		for(int i=0; i<temp.length; i++) {
			num.add(Integer.parseInt(temp[i]));
		}
		return num;
	}
	public static int get_num(String table, Connection conn) throws SQLException {
		int num=1;
		
		String sql = "select Max(num) as m from "+table;
		Statement stmt=null;
		ResultSet rs =null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				num = rs.getInt("m") + 1;
			}
			return num;
		}catch(SQLException e) {
			System.out.println("num값 증가 DB 오류");
		}
		rs.close();
		stmt.close();
		return num;
	}
}
