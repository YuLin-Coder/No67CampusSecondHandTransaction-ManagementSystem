package com.daowen.dto;
/**
 * 
 * @author 返回结果
 *
 * @param <T>
 */
public class JsonResult<T> {

	private int stateCode;
	public int getStateCode() {
		return stateCode;
	}

	

	public String getDes() {
		return des;
	}

	
	private String des;
	
	
	private T  data;

	
	public JsonResult(int stateCode,String des) {
		this.stateCode=stateCode;
		this.des=des;
	}
	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
	
}
