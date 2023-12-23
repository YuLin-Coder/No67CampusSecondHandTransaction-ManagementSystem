package com.daowen.controller;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Sitenav;
import com.daowen.entity.Spcategory;
import com.daowen.service.SitenavService;
import com.daowen.service.SpcategoryService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

@Controller
public class SitenavController extends SimpleController {

	@Autowired
	private SitenavService snSrv = null;
	@Autowired
	private SpcategoryService spcategorySrv=null;

	@Override
	@RequestMapping("/admin/sitenavmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		mappingMethod(request, response);

	}
	private void saveBySpc() {

		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String spcid = request.getParameter("spcid");

		if (spcid != null) {
			Spcategory temspc = spcategorySrv.load("where id=" + spcid);
			if (temspc != null) {
				Sitenav sitenav = new Sitenav();
				sitenav.setHref(MessageFormat.format(
						"/e/shangpinlist.jsp?spcid={0}", temspc.getId()));
				sitenav.setSindex(1);
				sitenav.setTitle(temspc.getMingcheng());
				// 产生验证
				Boolean validateresult = snSrv.isExist("where title='"
						+ temspc.getMingcheng() + "'");
				if (validateresult) {
					request.setAttribute("errormsg",
							"<label class='error'>已存在的导航</label>");
					request.setAttribute("sitenav", sitenav);
					request.setAttribute("actiontype", "save");
					forward(errorurl);
					return;
				}
				snSrv.save(sitenav);
			}
		}

		if (forwardurl == null) {
			forwardurl = "/admin/sitenavmanager.do?actiontype=get";
		}
		redirect(forwardurl);

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("snid");
		if (ids == null)
			return;
		String spliter = ",";
		String sql = " where id in(" + join(spliter, ids)
				+ ")";
		System.out.println("sql=" + sql);
		snSrv.delete(sql);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		String sindex = request.getParameter("sindex");
		SimpleDateFormat sdfsitenav = new SimpleDateFormat("yyyy-MM-dd");
		Sitenav sitenav = new Sitenav();
		sitenav.setTitle(title == null ? "" : title);
		sitenav.setHref(href == null ? "" : href);
		sitenav.setSindex(sindex == null ? 0 : new Integer(sindex));
		snSrv.save(sitenav);
		if (forwardurl == null) {
			forwardurl = "/admin/sitenavmanager.do?actiontype=get";
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
		Sitenav sitenav = (Sitenav) snSrv.load(new Integer(id));
		if (sitenav == null)
			return;
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		String sindex = request.getParameter("sindex");
		SimpleDateFormat sdfsitenav = new SimpleDateFormat("yyyy-MM-dd");
		sitenav.setTitle(title);
		sitenav.setHref(href);
		sitenav.setSindex(sindex == null ? 0 : new Integer(sindex));
		snSrv.update(sitenav);
		if (forwardurl == null) {
			forwardurl = "/admin/sitenavmanager.do?actiontype=get";
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
			Sitenav sitenav = snSrv.load("where id="+ id);
			if (sitenav != null) {
				request.setAttribute("sitenav", sitenav);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/sitenavadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1  ";
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		//
		filter+=" order by sindex asc,id ";
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
		List<Sitenav> listsitenav = snSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = snSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listsitenav", listsitenav);
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
			forwardurl = "/admin/sitenavmanager.jsp";
		}
		forward(forwardurl);
	}

}
