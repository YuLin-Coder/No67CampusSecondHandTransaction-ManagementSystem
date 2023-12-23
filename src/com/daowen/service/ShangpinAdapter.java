package com.daowen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daowen.dto.IShopcartAdapter;
import com.daowen.dto.ShopcartItem;
import com.daowen.entity.Shangpin;

@Service
public class ShangpinAdapter implements IShopcartAdapter {

	@Autowired
	private ShangpinService shangpinSrv=null;
	@Override
	public ShopcartItem pack(int key,int count) {
		Shangpin shangpin=shangpinSrv.load("where id="+key);
		ShopcartItem item=new ShopcartItem();
		item.setPrice(shangpin.getJiage());
		item.setCount(count);
		item.setId(shangpin.getId());
		item.setTitle(shangpin.getName());
		item.setSubtitle(shangpin.getSubtitle());
		item.setImgurl(shangpin.getTupian());
		item.setShaccount(shangpin.getPubren());
		return item;
		
	}

}
