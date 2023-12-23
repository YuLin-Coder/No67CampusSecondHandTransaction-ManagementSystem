package com.daowen.controller;

import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.daowen.entity.*;
import com.daowen.service.*;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 系统介绍控制
 *
 */
@Controller
public class SysconfigitemController extends SimpleController {
	@Autowired
	private SysconfigitemService sysconfigitemSrv = null;

	@Autowired
	private SysconfigService sysconfigSrv = null;

	@Override
	@RequestMapping("/admin/sysconfigitemmanager.do")
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
		sysconfigitemSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String dcontent = request.getParameter("dcontent");
		String cfgid = request.getParameter("cfgid");
		String cfgname = request.getParameter("cfgname");
		SimpleDateFormat sdfsysconfigitem = new SimpleDateFormat("yyyy-MM-dd");
		Sysconfigitem sysconfigitem = new Sysconfigitem();
		sysconfigitem.setTitle(title == null ? "" : title);
		sysconfigitem.setDcontent(dcontent == null ? "" : dcontent);
		sysconfigitem.setCfgid(cfgid == null ? 0 : new Integer(cfgid));
		sysconfigitem.setCfgname(cfgname == null ? "" : cfgname);
		sysconfigitemSrv.save(sysconfigitem);
		if (forwardurl == null) {
			forwardurl = "/admin/sysconfigitemmanager.do?actiontype=get";
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
		Sysconfigitem sysconfigitem = sysconfigitemSrv.load(new Integer(id));
		if (sysconfigitem == null)
			return;
		String title = request.getParameter("title");
		String dcontent = request.getParameter("dcontent");
		String cfgid = request.getParameter("cfgid");
		String cfgname = request.getParameter("cfgname");
		SimpleDateFormat sdfsysconfigitem = new SimpleDateFormat("yyyy-MM-dd");
		sysconfigitem.setTitle(title);
		sysconfigitem.setDcontent(dcontent);
		sysconfigitem.setCfgid(cfgid == null ? 0 : new Integer(cfgid));
		sysconfigitem.setCfgname(cfgname);
		sysconfigitemSrv.update(sysconfigitem);
		if (forwardurl == null) {
			forwardurl = "/admin/sysconfigitemmanager.do?actiontype=get";
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
			Sysconfigitem sysconfigitem = sysconfigitemSrv.load("where id=" + id);
			if (sysconfigitem != null) {
				request.setAttribute("sysconfigitem", sysconfigitem);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		String cfgid = request.getParameter("cfgid");
		if (cfgid != null) {
			Sysconfig sysconfig = sysconfigSrv.load("where id=" + cfgid);
			if (sysconfig != null)
				request.setAttribute("sysconfig", sysconfig);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/sysconfigitemadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String cfgid = request.getParameter("cfgid");

		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		//
		if (cfgid != null) {
			filter += " and cfgid=" + cfgid;
			Sysconfig sysconfig = sysconfigSrv.load("where id=" + cfgid);
			if (sysconfig != null)
				request.setAttribute("sysconfig", sysconfig);

		}

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
		List<Sysconfigitem> listsysconfigitem = sysconfigitemSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = sysconfigitemSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listsysconfigitem", listsysconfigitem);
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
			forwardurl = "/admin/sysconfigitemmanager.jsp";
		}
		forward(forwardurl);
	}
}
