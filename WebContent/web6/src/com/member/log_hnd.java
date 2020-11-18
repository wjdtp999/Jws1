package com.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.main_able;

public class log_hnd implements main_able{

	public String active(HttpServletRequest request,
			HttpServletResponse response) {
		
		String part=request.getParameter("part");
		
		if(part==null){
			if(request.getSession().getAttribute("user")!=null) {
				request.getSession().removeAttribute("user");
				return null;
			}
			return "member/login.jsp";
		}else {
			member_service ms=new member_service(request);
			if(ms.login()==null)
				return "../index.jsp";
			else{	
				request.getSession().setAttribute("fail", true);
				return "login.jsp";
			}
		}
	}
}