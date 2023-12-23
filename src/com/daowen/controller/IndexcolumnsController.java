package com.daowen.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Indexcolumns;
import com.daowen.entity.Spcategory;
import com.daowen.jdbc.simplecrud.Adapter;
import com.daowen.jdbc.simplecrud.MybatisAdapter;
import com.daowen.jdbc.simplecrud.SimpleJdbc;
import com.daowen.service.IndexcolumnsService;
import com.daowen.service.LanmuService;
import com.daowen.service.SpcategoryService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
@Controller
public class IndexcolumnsController extends SimpleController {
	
	@Autowired
	private IndexcolumnsService icSrv=null;
	@Autowired
	private LanmuService lanmuSrv=null;
	@Autowired
	private SpcategoryService spcSrv=null;
	@Override
	@RequestMapping("/admin/indexcolumnsmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);
	}
	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " delete from indexcolumns  where id in(" + join(spliter, ids)
				+ ")";
		System.out.println("sql=" + SQL);
		Adapter adapter=new MybatisAdapter("applicationContext.xml", "sqlSessionFactoryBean");
		SimpleJdbc dapper=new SimpleJdbc(adapter);
		try {
			dapper.update(SQL);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

	
	
	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {

		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String spcid=request.getParameter("spcid");
		
		if(spcid!=null)
		{
			Spcategory temspc=spcSrv.load("where id="+spcid);
			if(temspc!=null)
			{
				Indexcolumns indexcolumns = new Indexcolumns();
				indexcolumns.setColdes(temspc.getMingcheng());
				indexcolumns.setColid(temspc.getId());
				indexcolumns.setXtype("商品");
				indexcolumns.setShowstyle("图片");
				indexcolumns.setLayout("1");
				indexcolumns.setWidth("100%");
				icSrv.save(indexcolumns);
			}
		}
		if (forwardurl == null) {
			forwardurl = "/admin/indexcolumnsmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}


	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Indexcolumns indexcolumns = icSrv.load(new Integer(id));
		if (indexcolumns == null)
			return;
		String coldes = request.getParameter("coldes");
		String colid = request.getParameter("colid");
		String xtype = request.getParameter("xtype");
		String showstyle = request.getParameter("showstyle");
		String layout=request.getParameter("layout");
		String width=request.getParameter("width");
		
		indexcolumns.setColdes(coldes);
		indexcolumns.setColid(colid == null ? 0 : new Integer(colid));
		indexcolumns.setXtype(xtype);
		indexcolumns.setShowstyle(showstyle);
		indexcolumns.setLayout(layout);
		indexcolumns.setWidth(width);
		icSrv.update(indexcolumns);
		
		if (forwardurl == null) {
			forwardurl = "/admin/indexcolumnsmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Indexcolumns indexcolumns = (Indexcolumns) icSrv.load("where id=" + id);
			if (indexcolumns != null) {
				request.setAttribute("indexcolumns", indexcolumns);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/indexcolumnsadd.jsp";
		}
		try {
			request.getRequestDispatcher(forwardurl).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String coldes = request.getParameter("coldes");
		if (coldes != null)
			filter += "  and coldes like '%" + coldes + "%'  ";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Indexcolumns> listindexcolumns = icSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = icSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listindexcolumns", listindexcolumns);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/indexcolumnsmanager.jsp";
		}
		forward(forwardurl);
	}

}
