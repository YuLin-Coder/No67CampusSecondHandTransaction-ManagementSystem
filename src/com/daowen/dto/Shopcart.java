package com.daowen.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

/**
 * 购物车
 * @author 阿文
 *
 */
public class Shopcart{
	
	
	private HashMap<Integer,ShopcartItem> cartItems=null;
	public Shopcart(){
		
	}
	
	public void clear(){
		
	   if(cartItems==null)
		  return;
	   cartItems.clear();
	   
	}
	
	/**
	 * 获取购物车选项
	 * @return
	 */
	public HashMap<Integer,ShopcartItem> getCartItems(){
		
		if(cartItems==null){
			cartItems = new HashMap<Integer,ShopcartItem>();
		}
		return cartItems;
	}
	
	public HashMap<String,List<ShopcartItem>> getGroupCartItems(){
		HashMap<Integer,ShopcartItem> cartItems=getCartItems();
		
		return group(cartItems.values());
		
	}
	
	/**
	 * 添加选项到购物车
	 * @param item
	 * @return
	 */
	public Boolean add(ShopcartItem item){
		if(item==null)
			return false;
		HashMap<Integer,ShopcartItem> cart=getCartItems();
		ShopcartItem sci=find(item.getId());
		if(sci!=null){
			sci.setCount(sci.getCount()+item.getCount());
			return true;
		}
		//如果购物车中不存在则进行添加操作
		cart.put(item.getId(),item);
		return true;
	}
	/**
	 * 移除
	 * @param spId
	 * @return
	 */
	public ShopcartItem remove(int itemId){
		ShopcartItem scb=find(itemId);
		if(scb==null)
			return null;
		HashMap<Integer,ShopcartItem> cart=getCartItems();
		return cart.remove(itemId);
	}
	/**
	 * 从购物车中查询商品信息
	 * @param spId
	 * @return
	 */
	public ShopcartItem find(int itemId){
		HashMap<Integer,ShopcartItem> cart=getCartItems();
		return cart.get(itemId);
	}
	/**
	 * 获取购物车总金额
	 * @return
	 */
	public double getTotalPrice(){
		HashMap<Integer,ShopcartItem> cart=getCartItems();
		if(cart==null||cart.size()==0)
			return 0;
		double sum=0;
		for(ShopcartItem item :cart.values()){
			sum+=item.getPrice()*item.getCount();
		}
		return sum;
	}
	
	
	
	/**
	 * 获取购物车中商品数量
	 * @return
	 */
	public int size(){
		HashMap<Integer,ShopcartItem> cart=getCartItems();
		return cart.size();
	}
	
	

	private HashMap<String,List<ShopcartItem>> group(Collection<ShopcartItem> list){
		
		if(list==null)
			return null;
		HashMap<String,List<ShopcartItem>> map=new HashMap<String,List<ShopcartItem>>();
		for(ShopcartItem sci :list) {
		   
		   List<ShopcartItem> cartList=map.get(sci.getShaccount());
		   if(cartList!=null)
			   cartList.add(sci);
		   else {
			   
			   cartList=new ArrayList<ShopcartItem>();
			   cartList.add(sci);
			   map.put(sci.getShaccount(), cartList);
			   
		   }
			
		}
		return map;
	
	}

}
