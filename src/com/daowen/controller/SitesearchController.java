package com.daowen.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Xinxi;
import com.daowen.service.XinxiService;
import com.daowen.ssm.simplecrud.SimpleController;

@Controller
public class SitesearchController extends SimpleController {

	@Autowired
	private XinxiService xinxiSrv=null;
	
	@Override
	@RequestMapping("/admin/sitesearch.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);

	}
	
	private void find() {

		String searchtype = request.getParameter("searchtype");
        String  title=request.getParameter("title");
		if(searchtype!=null&&searchtype.equals("2")){
		}
		if(searchtype!=null&&searchtype.equals("3")){
	            List<Xinxi> xinxilist=null;
	            if(title!=null){
	            	 xinxilist=xinxiSrv.getEntity("where title like '%"+title+"%'");
	                 request.setAttribute("xinxilist", xinxilist);
	            }
			
			forward("/e/searchnews.jsp");
		}
	}
	
	

	

}
