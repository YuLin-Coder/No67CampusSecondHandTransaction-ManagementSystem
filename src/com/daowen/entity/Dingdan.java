package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Dingdan {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String ddno;

	public String getDdno() {
		return ddno;
	}

	public void setDdno(String ddno) {
		this.ddno = ddno;
	}

	private Date xiadantime;

	public Date getXiadantime() {
		return xiadantime;
	}

	public void setXiadantime(Date xiadantime) {
		this.xiadantime = xiadantime;
	}

	private String xiadanren;

	public String getXiadanren() {
		return xiadanren;
	}

	public void setXiadanren(String xiadanren) {
		this.xiadanren = xiadanren;
	}

	private double totalprice;
	

	public double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}

	 private int state;

		

		public int getState() {
			return state;
		}

		public void setState(int state) {
			this.state = state;
		}

	private String fahuoren;

	public String getFahuoren() {
		return fahuoren;
	}

	public void setFahuoren(String fahuoren) {
		this.fahuoren = fahuoren;
	}

	private Date fahuotime;

	public Date getFahuotime() {
		return fahuotime;
	}

	public void setFahuotime(Date fahuotime) {
		this.fahuotime = fahuotime;
	}

	
	private String shrtel;

	public String getShrtel() {
		return shrtel;
	}

	public void setShrtel(String shrtel) {
		this.shrtel = shrtel;
	}

	private String shraddress;

	public String getShraddress() {
		return shraddress;
	}

	public void setShraddress(String shraddress) {
		this.shraddress = shraddress;
	}

	private String shrname;

	public String getShrname() {
		return shrname;
	}

	public void setShrname(String shrname) {
		this.shrname = shrname;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}

	private String wltype;

	public String getWltype() {
		return wltype;
	}

	public void setWltype(String wltype) {
		this.wltype = wltype;
	}

	public String getWlorderno() {
		return wlorderno;
	}

	public void setWlorderno(String wlorderno) {
		this.wlorderno = wlorderno;
	}

	private String wlorderno;
	
	private String shaccount;

	public String getShaccount() {
		return shaccount;
	}

	public void setShaccount(String shaccount) {
		this.shaccount = shaccount;
	}
	
	

}
