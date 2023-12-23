package com.daowen.dto;


public class ShopcartItem{
	
	
	private  int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	private String title;
	
	private  String subtitle;
	

	private int count;


	private Double price;

	private String imgurl;

	private String shaccount;

	public String getShaccount() {
		return shaccount;
	}

	public void setShaccount(String shaccount) {
		this.shaccount = shaccount;
	}
	
	
}
