package com.daowen.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.daowen.dto.Shopcart;


@Service
public class ShopcartService {
	
	private  HashMap<String,Shopcart> map=null;
	public ShopcartService(){
		map=new HashMap<String,Shopcart>();

	}
	
	public Shopcart getCart(String cartName){
		if(map.get(cartName)==null)
			map.put(cartName, new Shopcart());
		return map.get(cartName);
	}
	
	public  void clear(String cartName){
		 Shopcart cart=getCart(cartName);
		 if(cart==null)
			 return;
		 cart.clear();
	}
	public void  removeCart(String cartName) {
		
		if(map.get(cartName)==null)
			map.remove(cartName);
	}
	
	
	
	
	
}
