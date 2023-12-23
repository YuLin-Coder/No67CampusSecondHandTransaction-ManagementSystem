package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Leaveword {
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

	private String dcontent;

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	private Date createtime;

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	private String replyren;

	public String getReplyren() {
		return replyren;
	}

	public void setReplyren(String replyren) {
		this.replyren = replyren;
	}

	private Date replytime;

	public Date getReplytime() {
		return replytime;
	}

	public void setReplytime(Date replytime) {
		this.replytime = replytime;
	}

	private String replycontent;

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	private int status;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	private String lwren;

	
	public String getLwren() {
		return lwren;
	}

	public void setLwren(String lwren) {
		this.lwren = lwren;
	}

	public String getLwname() {
		return lwname;
	}

	public void setLwname(String lwname) {
		this.lwname = lwname;
	}

	public String getReplyname() {
		return replyname;
	}

	public void setReplyname(String replyname) {
		this.replyname = replyname;
	}

	private String lwname;

	private String replyname;
}
