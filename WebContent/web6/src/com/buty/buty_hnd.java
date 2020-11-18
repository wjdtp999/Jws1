package com.buty;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exchange.ex_able;
import com.fashion.fashion_service;

public class buty_hnd implements ex_able{

	public String active(HttpServletRequest request,
			HttpServletResponse response) {
		String view=null;
		String part = request.getParameter("part");
	
		request.setAttribute("m", "buty");
		if(part==null) {
			request.setAttribute("pg", "board/board_list.jsp");
			view ="index.jsp";
		}else if(part.equals("write")) {
			view = "board/write.jsp";
		}else if(part.equals("board_save")) {
			buty_service bs = new buty_service();
			bs.save(request);
			request.setAttribute("pg", "board/board_list.jsp");
			view ="index.jsp";
		}
		
		return view;
	}
}