package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Caigou {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String spno;

	public String getSpno() {
		return spno;
	}

	public void setSpno(String spno) {
		this.spno = spno;
	}

	private String spname;

	public String getSpname() {
		return spname;
	}

	public void setSpname(String spname) {
		this.spname = spname;
	}

	private String supplor;

	public String getSupplor() {
		return supplor;
	}

	public void setSupplor(String supplor) {
		this.supplor = supplor;
	}

	private Double count;

	public Double getCount() {
		return count;
	}

	public void setCount(Double count) {
		this.count = count;
	}

	private Date cgdate;

	public Date getCgdate() {
		return cgdate;
	}

	public void setCgdate(Date cgdate) {
		this.cgdate = cgdate;
	}

	private String cgren;

	public String getCgren() {
		return cgren;
	}

	public void setCgren(String cgren) {
		this.cgren = cgren;
	}

	private  int storeid;

	public int getStoreid() {
		return storeid;
	}

	public void setStoreid(int storeid) {
		this.storeid = storeid;
	}

	private String storename;

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	private String danwei;

	public String getDanwei() {
		return danwei;
	}

	public void setDanwei(String danwei) {
		this.danwei = danwei;
	}

}
