package com.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.main_able;

public class notice_hnd implements main_able{

	public String active(HttpServletRequest request,
			HttpServletResponse response) {
		notice_service ns = new notice_service(request);
		
		String num = request.getParameter("num");
		if(num==null) // 공지사항 목록 보기
			ns.list();
		else  //공지글 보기
			ns.view(Integer.parseInt(num));
		
		return null;
	}
}