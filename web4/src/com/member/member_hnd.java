package com.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.main_hnd;

public class member_hnd implements main_hnd{

	public String action(HttpServletRequest request, 
			HttpServletResponse response) {
		member_service ms = new member_service(request);

		String part = request.getParameter("part");
		if(part.equals("join")) ms.join();
		else if(part.equals("login")) ms.login();
		else {
			request.setAttribute("part", "member");
request.setAttribute("page_path", "member/"+
			(part.equals("login_in") ? "login":"join"));
		}
		return null;
	}
}




