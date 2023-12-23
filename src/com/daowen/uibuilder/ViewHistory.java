package com.daowen.uibuilder;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewHistory {

	
	private   String  cookieprefix=null;
	
	
	public ViewHistory(String name){
		cookieprefix=name;
	}
	 /**
	  * 
	  * @param request 
	  * @return 历史浏览产品 
	  */
	 public  List<String> historyView(HttpServletRequest request) {
    	 
   	      Cookie [] viewedshangpins=request.getCookies(); 
 	        List ids=new ArrayList<String>();
	        if(viewedshangpins!=null&&viewedshangpins.length>0){
	        	
	        	for(Cookie c : viewedshangpins){
	        		
	        		if(c.getName().startsWith(cookieprefix)){
	        			ids.add(c.getValue());
	        			//out.write("浏览过的书籍编码 "+c.getValue());
	        		}
	        	}
	        	
	        }
	        
	        return ids;
	 }
	 
	 
	 public  void view(HttpServletRequest request,HttpServletResponse response,String spid){
		 
		 Cookie[] cookies=  request.getCookies();
		    
	        List<Cookie> cookielist=new ArrayList<Cookie>();
	        
	        Cookie temcookie=null;
	        
	        if(cookies!=null&&cookies.length>0){
	        	
	        	for(Cookie cookie : cookies){
	        		
	        		String cookiename=cookie.getName();
	        		if(cookiename.startsWith(cookieprefix)){
	        			cookielist.add(cookie);
	        		}
	        		//如果cookie中 存在当前书籍编号则记录 该cookie
	        		if(cookie.getValue().equals(spid)){
	        			temcookie=cookie;
	        		}
	        		
	        	}
	         }
	        
	         if(cookielist.size()>20&&temcookie==null){
	        	 temcookie=cookielist.get(0);
	        	 
	         }
	         if(temcookie!=null)
	         {
	        	 temcookie.setMaxAge(0);
	        	 response.addCookie(temcookie);
	         }
	         else{
	           Cookie cookieadd=new Cookie(cookieprefix+spid,spid);
	           response.addCookie(cookieadd);
	         }
	 }
	
	
}
