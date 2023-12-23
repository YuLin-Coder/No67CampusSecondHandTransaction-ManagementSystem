package com.daowen.entity;

import javax.persistence.*;

@Table(name="sitenav")
public class Sitenav {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private String href;

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	private int sindex;

	public int getSindex() {
		return sindex;
	}

	public void setSindex(int sindex) {
		this.sindex = sindex;
	}
}
