package com.daowen.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.*;

@Entity
public class Shangpin {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private String spno;

	public String getSpno() {
		return spno;
	}

	public void setSpno(String spno) {
		this.spno = spno;
	}

	private Double jiage;

	public Double getJiage() {
		return jiage;
	}

	public void setJiage(Double jiage) {
		this.jiage = jiage;
	}

	private int dazhe;

	public int getDazhe() {
		return dazhe;
	}

	public void setDazhe(int dazhe) {
		this.dazhe = dazhe;
	}

	private int tuijian;

	public int getTuijian() {
		return tuijian;
	}

	public void setTuijian(int tuijian) {
		this.tuijian = tuijian;
	}

	private int zuixin;

	public int getZuixin() {
		return zuixin;
	}

	public void setZuixin(int zuixin) {
		this.zuixin = zuixin;
	}

	private int hot;

	public int getHot() {
		return hot;
	}

	public void setHot(int hot) {
		this.hot = hot;
	}

	private String sptype;

	public String getSptype() {
		return sptype;
	}

	public void setSptype(String sptype) {
		this.sptype = sptype;
	}

	private int sptypeid;

	public int getSptypeid() {
		return sptypeid;
	}

	public void setSptypeid(int sptypeid) {
		this.sptypeid = sptypeid;
	}

	private String tupian;

	public String getTupian() {
		return tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}

	private String jieshao;

	public String getJieshao() {
		return jieshao;
	}

	public void setJieshao(String jieshao) {
		this.jieshao = jieshao;
	}

	private double hyjia;

	public double getHyjia() {
		return hyjia;
	}

	public void setHyjia(double hyjia) {
		this.hyjia = hyjia;
	}

	private int jifen;

	public int getJifen() {
		return jifen;
	}

	public void setJifen(int jifen) {
		this.jifen = jifen;
	}

	

	private Date pubtime;

	public Date getPubtime() {
		return pubtime;
	}

	public void setPubtime(Date pubtime) {
		this.pubtime = pubtime;
	}

	private String pubren;

	public String getPubren() {
		return pubren;
	}

	public void setPubren(String pubren) {
		this.pubren = pubren;
	}

	public int getKucun() {
		return kucun;
	}

	public void setKucun(int kucun) {
		this.kucun = kucun;
	}

	public String getDanwei() {
		return danwei;
	}

	public void setDanwei(String danwei) {
		this.danwei = danwei;
	}

	private int kucun;

	private String danwei;

	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtile) {
		this.subtitle = subtile;
	}

	private String subtitle;

	public String getShdx() {
		return shdx;
	}

	public void setShdx(String shdx) {
		this.shdx = shdx;
	}

	/**
	 * 适合对象
	 */
	private String shdx;

	public int getDxid() {
		return dxid;
	}

	public void setDxid(int dxid) {
		this.dxid = dxid;
	}

	private int dxid;

	private String baozhuang;

	public String getBaozhuang() {
		return baozhuang;
	}

	public void setBaozhuang(String baozhuang) {
		this.baozhuang = baozhuang;
	}

	private String chandi;

	public String getChandi() {
		return chandi;
	}

	public void setChandi(String chandi) {
		this.chandi = chandi;
	}

	private int tagid;

	public int getTagid() {
		return tagid;
	}

	public void setTagid(int tagid) {
		this.tagid = tagid;
	}

	private String tagname;

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	private int spstate;

	public int getSpstate() {
		return spstate;
	}

	public void setSpstate(int spstate) {
		this.spstate = spstate;
	}

}
