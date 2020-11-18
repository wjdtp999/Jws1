package com.exchange;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class exchange {
	private int num;
	private String name;
	private String title;
	private String content;
	private String[] img;
	private Calendar date;
	private ArrayList<Integer> sug;
	
	public exchange(){
		this.img=new String[3];
		this.sug=new ArrayList<Integer>();
	}
	public exchange(int num,String name, String title,
			String cont, String[] img,Date date,
			ArrayList<Integer> sug){
		this.num=num;
		this.name=name;
		this.title=title;
		this.content=cont;
		this.img=img;
		this.date=Calendar.getInstance();
		this.date.setTime(date);
		this.sug=sug;
	}
	public int getSug_count() {
		if(sug==null) return 0;
		return sug.size();
	}
	public String getDATE() {
		String dt = date.get(Calendar.YEAR)+"."
				+(date.get(Calendar.MONTH)+1)+"."
				+date.get(Calendar.DATE);
		return dt;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String[] getImg() {
		return img;
	}
	public void setImg(String[] img) {
		this.img = img;
	}
	public Calendar getDate() {
		return date;
	}
	public void setDate(Calendar date) {
		this.date = date;
	}
	public ArrayList<Integer> getSug() {
		return sug;
	}
	public void setSug(ArrayList<Integer> sug) {
		this.sug = sug;
	}
	
}
