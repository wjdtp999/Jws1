package com.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class notice_service {
	private HttpServletRequest request;
	
	public notice_service(HttpServletRequest request) {
		this.request=request;
	}
	public String list() {
		notice_dao nd = new notice_dao();
		
		ArrayList<notice> data = nd.all_data();
		request.setAttribute("notice_list",data);
		return null;
	}
	
	public void view(int num) {
		notice_dao nd = new notice_dao();
		
		notice data = nd.select(num);
		request.setAttribute("notice_view", data);
	}
}
