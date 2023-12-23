package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Shoucang {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private int bookid;

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	private String bookname;

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	private String tupian;

	public String getTupian() {
		return tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}

	private String scren;

	public String getScren() {
		return scren;
	}

	public void setScren(String scren) {
		this.scren = scren;
	}
    private String xtype;
	public String getXtype() {
		return xtype;
	}

	public void setXtype(String xtype) {
		this.xtype = xtype;
	}

	private Date sctime;

	public Date getSctime() {
		return sctime;
	}

	public void setSctime(Date sctime) {
		this.sctime = sctime;
	}
	
	private String href;

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}
}
