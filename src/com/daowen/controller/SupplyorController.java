package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Supplyor;
import com.daowen.service.SupplyorService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
@Controller
public class SupplyorController extends SimpleController {

	@Autowired
	private SupplyorService supplyorSrv=null;
	@Override
	@RequestMapping("/admin/supplyormanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);
	}
	
	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		supplyorSrv.delete(" where id=" + id);
		get();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String lxren = request.getParameter("lxren");
		String fax = request.getParameter("fax");
		String des = request.getParameter("des");
		SimpleDateFormat sdfsupplyor = new SimpleDateFormat("yyyy-MM-dd");
		Supplyor supplyor = new Supplyor();
		supplyor.setName(name == null ? "" : name);
		supplyor.setTel(tel == null ? "" : tel);
		supplyor.setEmail(email == null ? "" : email);
		supplyor.setAddress(address == null ? "" : address);
		supplyor.setLxren(lxren == null ? "" : lxren);
		supplyor.setFax(fax == null ? "" : fax);
		supplyor.setDes(des == null ? "" : des);
		supplyorSrv.save(supplyor);
		// 保存附件
		if (forwardurl == null) {
			forwardurl = "/admin/supplyormanager.do?actiontype=get";
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
		Supplyor supplyor =supplyorSrv.load(new Integer(id));
		if (supplyor == null)
			return;
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String lxren = request.getParameter("lxren");
		String fax = request.getParameter("fax");
		String des = request.getParameter("des");
		SimpleDateFormat sdfsupplyor = new SimpleDateFormat("yyyy-MM-dd");
		supplyor.setName(name);
		supplyor.setTel(tel);
		supplyor.setEmail(email);
		supplyor.setAddress(address);
		supplyor.setLxren(lxren);
		supplyor.setFax(fax);
		supplyor.setDes(des);
		supplyorSrv.update(supplyor);
		if (forwardurl == null) {
			forwardurl = "/admin/supplyormanager.do?actiontype=get";
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
			Supplyor supplyor = supplyorSrv.load("where id="+ id);
			if (supplyor != null) {
				request.setAttribute("supplyor", supplyor);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/supplyoradd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String name = request.getParameter("name");
		if (name != null)
			filter += "  and name like '%" + name + "%'  ";
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
		List<Supplyor> listsupplyor = supplyorSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = supplyorSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listsupplyor", listsupplyor);
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
			forwardurl = "/admin/supplyormanager.jsp";
		}
		forward(forwardurl);
	}
	
	
}
