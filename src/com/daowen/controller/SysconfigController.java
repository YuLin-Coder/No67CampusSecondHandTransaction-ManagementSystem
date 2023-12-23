package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Sysconfig;
import com.daowen.service.SysconfigService;
import com.daowen.service.SysconfigitemService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 系统介绍控制
 *
 */
@Controller
public class SysconfigController extends SimpleController {
	@Autowired
	private SysconfigService sysconfigSrv = null;
	@Autowired
	private SysconfigitemService cfgitemSrv = null;

	@Override
	@RequestMapping("/admin/sysconfigmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids) + ")";
		System.out.println("sql=" + SQL);
		sysconfigSrv.delete(SQL);
		SQL = " where cfgid in(" + join(spliter, ids) + ")";
		cfgitemSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String name = request.getParameter("name");
		SimpleDateFormat sdfsysconfig = new SimpleDateFormat("yyyy-MM-dd");
		Sysconfig sysconfig = new Sysconfig();
		sysconfig.setName(name == null ? "" : name);
		// 产生验证
		Boolean validateresult = sysconfigSrv.isExist("where name='" + name + "'");
		if (validateresult) {
			try {
				request.setAttribute("errormsg", "<label class='error'>已存在的名称</label>");
				request.setAttribute("sysconfig", sysconfig);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		sysconfigSrv.save(sysconfig);
		if (forwardurl == null) {
			forwardurl = "/admin/sysconfigmanager.do?actiontype=get";
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
		Sysconfig sysconfig = sysconfigSrv.load(new Integer(id));
		if (sysconfig == null)
			return;
		String name = request.getParameter("name");
		SimpleDateFormat sdfsysconfig = new SimpleDateFormat("yyyy-MM-dd");
		sysconfig.setName(name);
		sysconfigSrv.update(sysconfig);
		if (forwardurl == null) {
			forwardurl = "/admin/sysconfigmanager.do?actiontype=get";
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
			Sysconfig sysconfig = sysconfigSrv.load("where id=" + id);
			if (sysconfig != null) {
				request.setAttribute("sysconfig", sysconfig);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/sysconfigadd.jsp";
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
		List<Sysconfig> listsysconfig = sysconfigSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = sysconfigSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listsysconfig", listsysconfig);
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
			forwardurl = "/admin/sysconfigmanager.jsp";
		}
		forward(forwardurl);
	}
}
