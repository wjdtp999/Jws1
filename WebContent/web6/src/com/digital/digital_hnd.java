package com.digital;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exchange.ex_able;
import com.digital.digital_service;

public class digital_hnd implements ex_able{

	public String active(HttpServletRequest request,
			HttpServletResponse response) {
		String view=null;
		String part = request.getParameter("part");
	
		request.setAttribute("m", "digital");
		if(part==null) {
			digital_service ds=new digital_service();
			ds.all_data(request);
			request.setAttribute("pg", "board/board_list.jsp");
			view ="index.jsp";
		}else if(part.equals("write")) {
			view = "board/write.jsp";
		}else if(part.equals("board_save")) {
			digital_service ds = new digital_service();
			ds.save(request);
			ds.all_data(request);
			request.setAttribute("pg", "board/board_list.jsp");
			view ="index.jsp";
		}else if(part.equals("view")) {
			digital_service ds=new digital_service();
			ds.select_view(request);
			request.setAttribute("pg","board/board_view.jsp");
			view="index.jsp";
		}
		
		return view;
	}
}