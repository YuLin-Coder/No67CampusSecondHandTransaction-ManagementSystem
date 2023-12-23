package com.daowen.uibuilder;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.daowen.entity.Indexcolumns;
import com.daowen.service.IndexcolumnsService;
import com.daowen.util.BeansUtil;

public class IndexcolumnsBuilder {

	private IndexcolumnsService icSrv=null;
	private HttpServletRequest request;
	public IndexcolumnsBuilder(HttpServletRequest req){
		icSrv=BeansUtil.getBean("indexcolumnsService", IndexcolumnsService.class);
		this.request=req;
	}
 
    
       public String buildColumns(){
		
		int columncontentsize=10;
		StringBuffer sb=new StringBuffer();
		ShangpinBuilder  shangpinbuilder=new ShangpinBuilder(request);
		List<Indexcolumns>  list=icSrv.getEntity("");
		for (Indexcolumns indexcolumns : list) {
			sb.append(shangpinbuilder.buildImageShangpin(indexcolumns.getColid(), columncontentsize));
			sb.append("\r\n");
			
		}
		return sb.toString();
		
		
	}
	
	
}
