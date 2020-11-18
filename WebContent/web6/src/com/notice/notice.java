package com.notice;

import java.util.Calendar;
import java.util.Date;

public class notice {
	private int num;
	private String title;
	private String content;
	private Calendar n_date;
	
	public notice() {}
	public notice(int num, String title,Date date) {
		this.num=num;
		this.title=title;
		this.n_date = Calendar.getInstance();
		this.n_date.setTime(date);
	}
	public notice(int num, String title, String content,
			Date date) {
		this.num=num;
		this.title=title;
		this.content=content;
		this.n_date = Calendar.getInstance();
		this.n_date.setTime(date);
	}
	public String getDate() {
		String day ="";
		day += n_date.get(Calendar.YEAR)+".";
		day += (n_date.get(Calendar.MONTH)+1)+".";
		day += n_date.get(Calendar.DATE) ;
		return day;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Calendar getN_date() {
		return n_date;
	}
	public void setN_date(Calendar n_date) {
		this.n_date = n_date;
	}
	
}
