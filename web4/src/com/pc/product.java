package com.pc;

import java.util.Date;

public class product {
	private int num;
	private String pd_name;
	private int pd_price;
	private float cpu;
	private int ram;
	private int ssd;
	private String mb;
	private int am;
	private String detail_img;
	private String pd_img;
	private String pd_soft;
	private Date pc_date;
	private int hit;
	
	public product(){	}
	public product(int num,String name,int price, float cpu,int ram, int ssd,String mb,int am,String dimg,String pimg,String soft,Date pc_date,int hit){
		this.num=num;
		this.pd_name=name;
		this.pd_price=price;
		this.cpu=cpu;
		this.ram=ram;
		this.ssd=ssd;
		this.mb=mb;
		this.am=am;
		this.detail_img=dimg;
		this.pd_img=pimg;
		this.pd_soft=soft;
		this.pc_date=pc_date;
		this.hit=hit;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public float getCpu() {
		return cpu;
	}
	public void setCpu(float cpu) {
		this.cpu = cpu;
	}
	public int getRam() {
		return ram;
	}
	public void setRam(int ram) {
		this.ram = ram;
	}
	public int getSsd() {
		return ssd;
	}
	public void setSsd(int ssd) {
		this.ssd = ssd;
	}
	public String getMb() {
		return mb;
	}
	public void setMb(String mb) {
		this.mb = mb;
	}
	public int getAm() {
		return am;
	}
	public void setAm(int am) {
		this.am = am;
	}
	public String getDetail_img() {
		return detail_img;
	}
	public void setDetail_img(String detail_img) {
		this.detail_img = detail_img;
	}
	public String getPd_img() {
		return pd_img;
	}
	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}
	public String getPd_soft() {
		return pd_soft;
	}
	public void setPd_soft(String pd_soft) {
		this.pd_soft = pd_soft;
	}
	public Date getPc_date() {
		return pc_date;
	}
	public void setPc_date(Date pc_date) {
		this.pc_date = pc_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
}
