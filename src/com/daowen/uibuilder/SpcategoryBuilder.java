package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.daowen.entity.Spcategory;
import com.daowen.service.SpcategoryService;
import com.daowen.util.BeansUtil;


public class SpcategoryBuilder {

	
	private SpcategoryService spcSrv=null;
	private HttpServletRequest request=null;
	public SpcategoryBuilder(HttpServletRequest request){
		this.request=request;
		spcSrv=BeansUtil.getBean("spcategoryService", SpcategoryService.class);
	}
	public String BuildNavMenu(){
		
		StringBuffer sb=new StringBuffer();
		List<Spcategory> parentlist=spcSrv.getEntity("where isleaf=0 ");
		
		for(Iterator<Spcategory> iterator = parentlist.iterator();iterator.hasNext();){
		   
			Spcategory spc=iterator.next();
			sb.append("<dl>");
			
			sb.append(MessageFormat.format("<dt>{0}</dt>",spc.getMingcheng()));
			sb.append("<dd>");
			
			List<Spcategory> listchild=spcSrv.getEntity("where parentid="+spc.getId());
			
			for(Spcategory temchildspc : listchild){
			  sb.append(MessageFormat.format("<a href=''{0}/e/shangpinlist.jsp?spcid={1}''>{2}</a>",request.getContextPath(),temchildspc.getId(),temchildspc.getMingcheng()));
			
			}
			
			sb.append("</dd>");
			
			//
			sb.append("</dl>");
			
			
		}
		return sb.toString();
		
		
		
	}
public String buildNavMenu(int spcid){
		
		StringBuffer sb=new StringBuffer();
		Spcategory currentRoot=spcSrv.load("where id="+spcid);
		if(currentRoot==null)
		{
			return "节点异常";
		}
		sb.append("<dl>");
		//商品根类
		sb.append(MessageFormat.format("<dt>{0}</dt>",currentRoot.getMingcheng()));
		sb.append("<dd>");
		
		List<Spcategory> listchild=spcSrv.getEntity("where parentid="+spcid);
		
		for(Spcategory temchildspc : listchild){
		  sb.append(MessageFormat.format("<a href=''{0}/e/shangpinlist.jsp?spcid={1}''>{2}</a>",request.getContextPath(),temchildspc.getId(),temchildspc.getMingcheng()));
		
		}
		
		sb.append("</dd>");
		
		//
		sb.append("</dl>");
		
		return sb.toString();
		
	}

   public String BuildIndexMenu(){
	
	StringBuffer sb=new StringBuffer();
	List<Spcategory> parentlist=spcSrv.getTopEntity("where isleaf=0 ",5);
	sb.append("<div class=\"nav-items\">	");
	for(Iterator<Spcategory> iterator = parentlist.iterator();iterator.hasNext();){
	   
		Spcategory spc=iterator.next();
		sb.append("<div class=\"menu-item\">	");
		//商品根类
		sb.append(MessageFormat.format("<div class=\"menu-title\"><div class=\"tip-icon\">></div><a href=\"{0}/e/shangpinlist.jsp?spcid={1}\">{2}</a> </div>",request.getContextPath(),spc.getId(),spc.getMingcheng()));
		
		
		List<Spcategory> listchild=spcSrv.getEntity("where parentid="+spc.getId());
		sb.append("<div class=\"menu-content\">");
		sb.append("<ul>");
		int i=0;
		for(Spcategory temchildspc : listchild){
		  
	      sb.append("<li>");
		  sb.append(MessageFormat.format("<a href=''{0}/e/shangpinlist.jsp?spcid={1}''>{2}</a>",request.getContextPath(),temchildspc.getId(),temchildspc.getMingcheng()));
		  sb.append("</li>");
		}
		sb.append("</ul>");//
		sb.append("</div>");//end of menu-content
		
		sb.append("</div>");//end of menu-item
		
		
	}
	    
    sb.append("</div>");
	
	
	return sb.toString();
	
	
	
}

	
}
