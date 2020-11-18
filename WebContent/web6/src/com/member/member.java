package com.member;

public class member {
	private String email;
	private String tel;
	private String name;
	private String addr;
	private String interest;
	private int trust;
	
	public member() {}
	public member(String email,String t, String n, String a,
			String i, int trust) {
		this.email=email;
		this.tel=t;
		this.name=n;
		this.addr=a;
		this.interest=i;
		this.trust=trust;
	}
	public int getAddr_num() {
		String[] adr=this.addr.split(":");
		return Integer.parseInt(adr[0]);
	}
	public String getAddr_full() {
		String[] adr=this.addr.split(":");
		return adr[1];
	}
	public String[] getChecked() {
		String[] field=this.interest.split("-");
		return field;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public int getTrust() {
		return trust;
	}
	public void setTrust(int trust) {
		this.trust = trust;
	}
	
}
