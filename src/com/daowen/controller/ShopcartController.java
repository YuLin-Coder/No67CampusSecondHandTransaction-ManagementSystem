package com.daowen.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.daowen.dto.JsonResult;
import com.daowen.dto.Shopcart;
import com.daowen.dto.IShopcartAdapter;
import com.daowen.dto.ShopcartItem;
import com.daowen.service.ShopcartService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@RestController
public class ShopcartController {

	@Autowired
	private  ShopcartService shopcartSrv=null;
	
	private String cartName="shopcart";
	@Autowired
	@Qualifier("shangpinAdapter")
	private IShopcartAdapter  cartAdapter=null;
	
	@RequestMapping("/admin/shopcart/getitems")
	@ResponseBody
	public String getShopcart(HttpServletRequest request,HttpServletResponse response) {
		Shopcart cart=shopcartSrv.getCart(cartName);
		HashMap<Integer,ShopcartItem> map=cart.getCartItems();
		List<ShopcartItem> list=new ArrayList<ShopcartItem>();
		for(ShopcartItem item :  map.values()) {
			list.add(item);
		}
		return JSONArray.fromObject(list).toString();
	}
	
	@RequestMapping("/admin/shopcart/add")
	@ResponseBody
	public String put(HttpServletRequest request,HttpServletResponse response) {
		// 商品ID
		String spId = request.getParameter("spid");
		String count=request.getParameter("count");
		int ncount=1;
		if(spId==null)
			return null;
		if(count!=null)
			ncount=Integer.parseInt(count);
		ShopcartItem item=cartAdapter.pack(Integer.parseInt(spId),ncount);
        Shopcart cart=shopcartSrv.getCart(cartName);
        cart.add(item);
		JsonResult result=new JsonResult(1,"成功加入购物车");
		return JSONObject.fromObject(result).toString();

	}
	
	@RequestMapping("/admin/shopcart/update")
	@ResponseBody
	public String modify(HttpServletRequest request,HttpServletResponse response) {
		String id=request.getParameter("id");
		String count=request.getParameter("count");
		Shopcart cart=shopcartSrv.getCart(cartName);
		ShopcartItem item=null;
		if(id!=null)
		  item=cart.find(Integer.parseInt(id));
		if(item!=null)
			item.setCount(new Integer(count));
		JsonResult result=new JsonResult(1,"修改购物车成功");
		return JSONObject.fromObject(result).toString();
	}
	
	
	@RequestMapping("/admin/shopcart/remove")
	@ResponseBody
	public String remove(HttpServletRequest request,HttpServletResponse response) {
		String id=request.getParameter("id");
		Shopcart cart=shopcartSrv.getCart(cartName);
		ShopcartItem item=null;
		if(id!=null)
		  cart.remove(Integer.parseInt(id));
		
		JsonResult result=new JsonResult(1,"移除商品成功");
		return JSONObject.fromObject(result).toString();
	}
	@RequestMapping("/admin/shopcart/removes")
	@ResponseBody
	public String removes(HttpServletRequest request,HttpServletResponse response) {
		String[] ids=request.getParameterValues("ids");
		Shopcart cart=shopcartSrv.getCart(cartName);
		ShopcartItem item=null;
		if(ids!=null) {
			for(String id :ids)
		      cart.remove(Integer.parseInt(id));
		}
		JsonResult result=new JsonResult(1,"移除商品成功");
		return JSONObject.fromObject(result).toString();
	}
	
	
	@RequestMapping("/admin/shopcart/clear")
	@ResponseBody
	public String clear(HttpServletRequest request,HttpServletResponse response) {
		
		Shopcart cart=shopcartSrv.getCart(cartName);
		ShopcartItem item=null;
		 cart.clear();
		
		JsonResult result=new JsonResult(1,"购物车清空");
		return JSONObject.fromObject(result).toString();
	}
	@RequestMapping("/admin/shopcart/orderguide")
	@ResponseBody
	public String orderGuide(HttpServletRequest request,HttpServletResponse response) {
		String[] checkedIds=request.getParameterValues("checkedIds");
		System.out.println("checkedIds="+checkedIds);
		List<ShopcartItem> list=new ArrayList<ShopcartItem>();
		Shopcart cart=shopcartSrv.getCart(cartName);
		if(checkedIds==null) {
			JsonResult result=new JsonResult(-1,"获取订单号异常");
			return JSONObject.fromObject(result).toString();
		}
		
		for(String id : checkedIds) {
			ShopcartItem sci=cart.find(Integer.parseInt(id));
			if(sci!=null) {
				list.add(sci);
				//如果不存在
				
			}
		}
		
		request.getSession().setAttribute("checkedProductList", list);
		request.getSession().setAttribute("groupedProducts", group(list));
		JsonResult result=new JsonResult(1,"获取订单向导");
		result.setData(list);
		return JSONObject.fromObject(result).toString();
	}
	
	
	private HashMap<String,List<ShopcartItem>> group(List<ShopcartItem> list){
		
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
