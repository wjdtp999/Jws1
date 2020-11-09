package com.member;

public class member {
	private String join_id;
	private String join_pw;
	private String join_name;
	private String join_tel;
	private String join_email;
	
	public member(String id , String pw, String name, String tel,
			String email) {
		this.join_id=id;
		this.join_pw=pw;
		this.join_name=name;
		this.join_tel=tel;
		this.join_email=email;
	}
	public member(String id,String name, String tel,String email) {
		this.join_id=id;
		this.join_name=name;
		this.join_tel=tel;
		this.join_email=email;
	}
	
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	public String getJoin_pw() {
		return join_pw;
	}
	public void setJoin_pw(String join_pw) {
		this.join_pw = join_pw;
	}
	public String getJoin_name() {
		return join_name;
	}
	public void setJoin_name(String join_name) {
		this.join_name = join_name;
	}
	public String getJoin_tel() {
		return join_tel;
	}
	public void setJoin_tel(String join_tel) {
		this.join_tel = join_tel;
	}
	public String getJoin_email() {
		return join_email;
	}
	public void setJoin_email(String join_email) {
		this.join_email = join_email;
	}
	
	
}
