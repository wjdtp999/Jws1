package com.fashion;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exchange.ex_able;

public class fashion_hnd implements ex_able{

	public String active(HttpServletRequest request,
			HttpServletResponse response) {
		String view=null;
		String part = request.getParameter("part");
	
		request.setAttribute("m", "fashion");
		if(part==null) {
			fashion_service fs=new fashion_service();
			fs.all_data(request);
			request.setAttribute("pg", "board/board_list.jsp");
			view ="index.jsp";
		}else if(part.equals("write")) {
			view = "board/write.jsp";
		}else if(part.equals("board_save")) {
			fashion_service fs = new fashion_service();
			fs.save(request);
			fs.all_data(request);
			request.setAttribute("pg", "board/board_list.jsp");
			view ="index.jsp";
		}else if(part.equals("view")) {
			fashion_service fs=new fashion_service();
			fs.select_view(request);
			request.setAttribute("pg","board/board_view.jsp");
			view="index.jsp";
		}
		
		return view;
	}
}