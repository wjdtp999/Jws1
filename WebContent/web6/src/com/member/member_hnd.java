package com.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.main_able;

public class member_hnd implements main_able{

	public String active(HttpServletRequest request,
			HttpServletResponse response) {
		
		String part= request.getParameter("part");
		
		member_service ms=new member_service(request);
		String view=null;
		
		if(part==null)
			view="member/join.jsp";
		else{
			switch(part) {
		case "join":
			ms.join();
			view= "../index.jsp"; break;
		case "info":
			request.setAttribute("pg", "member/info.jsp");break;
		case "bag":
			ms.bag();
			view = "member/mybag.jsp"; break;
		case "update":
			ms.update(); view="../index.jsp";break;
		}
	}
		return view;
	}
}
