package com.member;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class member_service {
	private HttpServletRequest request;
	public member_service(HttpServletRequest request) {
		this.request=request;
	}
	public String login() {
		System.out.println("sss");
		String id = get("login_id");
		String pw = get("login_pw");
		member_dao md = new member_dao();
		member user = md.login(id,pw);
		if(user!=null) {
			request.getSession().setAttribute("login", user);
			return null;
		}
		return "fail";
	}
	public String join() {
		member m = new member(get("join_id"),
		get("join_pw"),get("join_name"),get("join_tel"),
		get("join_name"));
		
		member_dao md = new member_dao();
		try {
			md.join(m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	public String in() {
		request.setAttribute("part", "member");
		request.setAttribute("page_path", "member/login");
		return null;
	}
	public String write() {
		request.setAttribute("part", "member");
		request.setAttribute("page_path", "member/join");
		return null;
	}
	public String get(String param) {
		return request.getParameter(param);
	}
}
