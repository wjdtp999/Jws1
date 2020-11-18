package com.exchange;

import java.util.ArrayList;

public class exchange_page {
	private int total;
	private int currentPage;
	private ArrayList<exchange> content;
	private int totalPage;
	private int startPage;
	private int endPage;

	public exchange_page(int total,int currentPage,int size,ArrayList<exchange> content) {
			this.total=total;
			this.currentPage=currentPage;
			this.content=content;
			if(total==0) {
				totalPage=0;
				startPage=0;
				endPage=0;
			}else {
				totalPage=total/size;
				if(total%size>0) totalPage++;
				int mod=currentPage%10;
				startPage=currentPage/10*10+1;
				if(mod==0) startPage-=10;
				
				endPage=startPage+9;
				if(endPage > totalPage) endPage=totalPage;
			}
	}
	public boolean hasPage(){
			return total!=0;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCurentPage() {
		return currentPage;
	}
	public void setCurentPage(int curentPage) {
		this.currentPage = curentPage;
	}
	public ArrayList<exchange> getContent() {
		return content;
	}
	public void setContent(ArrayList<exchange> content) {
		this.content = content;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
