package com.member;

import javax.servlet.http.HttpServletRequest;

public class member_service {
		private HttpServletRequest request;
		
		public member_service() { } 
		public member_service(HttpServletRequest request) {
			this.request=request;
		}
		public String login() {
			String id=request.getParameter("login_id");
			String pw=request.getParameter("login_pw");
			member_dao md=new member_dao();
			member user=md.member_select(id,pw);
			
			request.getSession().setAttribute("user", user);
			if(user==null) 
				return "fail";
			 
			return null;
				
		}
			public void update() {
				String pword=request.getParameter("pword");
				String tel=request.getParameter("tel");
				String addr_num=request.getParameter("addr_num");
				String addr1=request.getParameter("addr1");
				String addr2=request.getParameter("addr2");
				String[] temp=request.getParameterValues("field");
				
				String id=((member)request.getSession().getAttribute("user")).getEmail();
						
				String addr=addr_num+":"+addr1+":"+addr2;
				
				String field="";
				if(temp!=null) {
				for(int i=0;i<temp.length-1;i++) 
					field += temp[i]+"-";
					field += temp[temp.length-1];
				}
				member_dao md=new member_dao();
				member user=md.member_update(id,pword, tel,addr, field);
				request.getSession().setAttribute("user", user);
			}
			public void bag() {
				
			}
			public void join() {
			String email=request.getParameter("email");
			String pword=request.getParameter("pword");
			String tel=request.getParameter("tel");
			String name=request.getParameter("name");
			String addr_num=request.getParameter("addr_num");
			String addr1=request.getParameter("addr1");
			String addr2=request.getParameter("addr2");
			String[] temp=request.getParameterValues("field");
			
			String addr=addr_num+":"+addr1+":"+addr2;
			
			String field="";
			if(temp!=null) {
			for(int i=0;i<temp.length-1;i++) 
				field += temp[i]+"-";
				field += temp[temp.length-1];
			}
			member_dao md=new member_dao();
			md.member_insert(email, pword, tel, name, addr, field);
		}
}
