package com.sug;

import javax.servlet.http.HttpServletRequest;

public class sug_service implements sug_able{
		public String service(HttpServletRequest request) {
		String cont= request.getParameter("sug_content");
		String writer=request.getParameter("writer");
		String num=request.getParameter("num");
		String kind= request.getParameter("kind");
		String who=request.getParameter("who");
		
		suggest_dao sd=new suggest_dao();
		sd.insert(kind,cont,writer,Integer.parseInt(num),who);
		
		request.setAttribute("kind", kind);
		return null;
	}
}
