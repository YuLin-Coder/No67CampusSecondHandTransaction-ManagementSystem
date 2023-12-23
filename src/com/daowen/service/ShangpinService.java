package com.daowen.service;

import java.text.MessageFormat;
import java.util.List;

import org.springframework.stereotype.Service;

import com.daowen.entity.Shangpin;
import com.daowen.mapper.ShangpinMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;
@Service
public class ShangpinService extends SimpleBizservice<ShangpinMapper>{

	/**
	 * 通过商品类别查询
	 * @param spcid
	 * @return
	 */
	public List<Shangpin> findBySpcateid(int spcid) {
		List<Shangpin> list =this.query(MessageFormat.format("select * from  shangpin where (sptypeid={0}  and state=1 and spstate=2) or (sptypeid in (select id from spcategory where parentid={0}) and state=1 and spstate=2 ) ",spcid));
		return list;
	}
	/**
	 * 
	 * @param spcId 商品编号
	 * @param ytId  功效编号
	 * @param hcId  品牌编号
	 * @param zsId  支数编号
	 * @param fcolId 颜色编号
	 * @return 返回商品信息
	 */
	public List<Shangpin> findShangpin(int spcId,int tagId,int dxId){
		StringBuilder sb=new StringBuilder();
		sb.append("SELECT * FROM SHANGPIN WHERE state=1 and spstate=2 ");
		if(spcId>0){
			sb.append(MessageFormat.format(" and (sptypeid={0} or sptypeid in (select id from spcategory where parentid={0})) ",spcId));
		}
		
		if(tagId>0){
			sb.append(MessageFormat.format(" and tagid={0} ", tagId));
		}
		
		if(dxId>0){
			sb.append(MessageFormat.format(" and dxId={0} ", dxId));
		}
		
		
		return this.query(sb.toString());
		 
		
		
	}

	public List<Shangpin> getHotSales(int count) {
        if(count>0)
		  return getTopEntity(" where hot=1 order by id desc ", count);
        else
          return getEntity("where hot=1 order by id desc ");
	}

	public List<Shangpin> getRecomment() {

		//审批通过且商家的商品进行推荐
		return getEntity(" where tuijian=1 and state=1 and spstate=2 ");

	}

	public List<Shangpin> getNewest(int count) {
		
       if(count>0)
		return getTopEntity(" order by id desc ", count);
       else
    	   return getEntity(" order by id desc");
	}

	/*
	 * 通过商品类别编号来获取商品信息
	 */
	public List<Shangpin> findBySpcateid(int spcid, int topcount) {

		return query(MessageFormat.format("select  * from  shangpin where sptypeid={0} and state=1 and spstate=2 order by pubtime desc  limit {1} ",
										spcid, topcount));
	}
	
	
	
}
