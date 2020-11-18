package com.furniture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exchange.ex_able;
import com.fashion.fashion_service;

public class furniture_hnd implements ex_able{

	public String active(HttpServletRequest request,
			HttpServletResponse response) {
		String view=null;
		String part = request.getParameter("part");
	
		request.setAttribute("m", "furniture");
		if(part==null) {
			request.setAttribute("pg", "board/board_list.jsp");
			view ="index.jsp";
		}else if(part.equals("write")) {
			view = "board/write.jsp";
		}else if(part.equals("board_save")) {
			furniture_service fs = new furniture_service();
			fs.save(request);
			request.setAttribute("pg", "board/board_list.jsp");
			view ="index.jsp";
		}
		
		return view;
	}
}