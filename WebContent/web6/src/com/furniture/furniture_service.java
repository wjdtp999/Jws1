package com.furniture;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.exchange.exchange;
import com.exchange.exchange_dao;
import com.exchange.exchange_page;
import com.member.member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class furniture_service {

	public void select_view(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		exchange_dao ed=new exchange_dao();
		exchange data=ed.view("furniture", num);
		request.setAttribute("data", data);
	}
	public void all_data(HttpServletRequest request) {
		int page_num=1;
		String num=request.getParameter("pnum");
		if(num!=null)
			page_num=Integer.parseInt(num);
		
		exchange_dao ed=new exchange_dao();
		int total=ed.select_count("furniture");
		
		ArrayList<exchange> list= ed.all_select("furniture",page_num==1? 1:(page_num-1)*10,10);
		exchange_page board_page=new exchange_page(total,page_num,10,list);
		request.setAttribute("list", board_page);
	}
	
	public void save(HttpServletRequest request) {
		
		String writer = ((member)request.getSession().getAttribute("user")).getName();
		
		String path="C:/Users/USER506-15/eclipse-workspace/web6/WebContent/img";
		int size=10*1024*1024;
		String title=null,cont=null;
		String[] fname = new String[3];
		try {
			MultipartRequest multi = new MultipartRequest(
					request, path, size, "UTF-8",new DefaultFileRenamePolicy()
				);
			
			title =multi.getParameter("title");
			cont = multi.getParameter("content");
			Enumeration em =multi.getFileNames();
			int i=0;
			while(em.hasMoreElements()) {
				String file = (String)em.nextElement();
				fname[i++] = multi.getFilesystemName(file);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("패션 이미지 오류");
		}
		String filename = fname[0]+"-"+fname[1]+"-"+fname[2];
		exchange_dao ed = new exchange_dao();
		ed.board_save("furniture",writer,title,cont,filename);
	}
}
