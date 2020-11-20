package com.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.main_able;

public class bag_hnd implements main_able{
	
		public String active(HttpServletRequest request,HttpServletResponse response) {
					
			
				String view=null;
				String part=request.getParameter("part");
				if(part==null) {
					view="member/my.jsp";
				}else if(part.equals("sug")) {
					request.setAttribute("pg", "my_sug.jsp");
					view="my.jsp";
				}else if()
			return view;
		}
	
}
