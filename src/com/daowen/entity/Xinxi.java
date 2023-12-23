package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Xinxi {
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

	private String pubren;

	public String getPubren() {
		return pubren;
	}

	public void setPubren(String pubren) {
		this.pubren = pubren;
	}

	private Date pubtime;

	public Date getPubtime() {
		return pubtime;
	}

	public void setPubtime(Date pubtime) {
		this.pubtime = pubtime;
	}

	private int clickcount;

	public int getClickcount() {
		return clickcount;
	}

	public void setClickcount(int clickcount) {
		this.clickcount = clickcount;
	}

	private String dcontent;

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	private String tupian2;

	public String getTupian2() {
		return tupian2;
	}

	public void setTupian2(String tupian2) {
		this.tupian2 = tupian2;
	}

	private int lanmuid;

	public int getLanmuid() {
		return lanmuid;
	}

	public void setLanmuid(int lanmuid) {
		this.lanmuid = lanmuid;
	}

	private String lanmuming;

	public String getLanmuming() {
		return lanmuming;
	}

	public void setLanmuming(String lanmuming) {
		this.lanmuming = lanmuming;
	}

	private String laiyuan;

	public String getLaiyuan() {
		return laiyuan;
	}

	public void setLaiyuan(String laiyuan) {
		this.laiyuan = laiyuan;
	}
	private  int tuijian;

	public int getTuijian() {
		return tuijian;
	}

	public void setTuijian(int tuijian) {
		this.tuijian = tuijian;
	}
	
	private  int hot;

	public int getHot() {
		return hot;
	}

	public void setHot(int hot) {
		this.hot = hot;
	}
	private int zuixin;

	public int getZuixin() {
		return zuixin;
	}

	public void setZuixin(int zuixin) {
		this.zuixin = zuixin;
	}
	private String zhaiyao;

	public String getZhaiyao() {
		return zhaiyao;
	}

	public void setZhaiyao(String zhaiyao) {
		this.zhaiyao = zhaiyao;
	}
	
	private int agreecount;

	public int getAgreecount() {
		return agreecount;
	}



	public void setAgreecount(int agreecount) {
		this.agreecount = agreecount;
	}



	public int getAgainstcount() {
		return againstcount;
	}



	public void setAgainstcount(int againstcount) {
		this.againstcount = againstcount;
	}

	private int againstcount;
	
	
	
	
	
}
