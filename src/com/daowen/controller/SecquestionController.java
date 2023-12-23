package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Secquestion;
import com.daowen.service.QuestionsetService;
import com.daowen.service.SecquestionService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 安全中心控制
 *
 */
@Controller
public class SecquestionController extends SimpleController {
	@Autowired
	private SecquestionService secquestionSrv = null;

	@Override
	@RequestMapping("/admin/secquestionmanager.do")
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
		secquestionSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String answer = request.getParameter("answer");
		String accountname = request.getParameter("accountname");
		SimpleDateFormat sdfsecquestion = new SimpleDateFormat("yyyy-MM-dd");
		Secquestion secquestion = new Secquestion();
		secquestion.setTitle(title == null ? "" : title);
		secquestion.setAnswer(answer == null ? "" : answer);
		secquestion.setAccountname(accountname == null ? "" : accountname);
		secquestionSrv.save(secquestion);
		if (forwardurl == null) {
			forwardurl = "/admin/secquestionmanager.do?actiontype=get";
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
		Secquestion secquestion = secquestionSrv.load(new Integer(id));
		if (secquestion == null)
			return;
		String title = request.getParameter("title");
		String answer = request.getParameter("answer");
		String accountname = request.getParameter("accountname");
		SimpleDateFormat sdfsecquestion = new SimpleDateFormat("yyyy-MM-dd");
		secquestion.setTitle(title);
		secquestion.setAnswer(answer);
		secquestion.setAccountname(accountname);
		secquestionSrv.update(secquestion);
		if (forwardurl == null) {
			forwardurl = "/admin/secquestionmanager.do?actiontype=get";
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
			Secquestion secquestion = secquestionSrv.load("where id=" + id);
			if (secquestion != null) {
				request.setAttribute("secquestion", secquestion);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> title_datasource=qsSrv.getEntity("");
	    request.setAttribute("title_datasource",title_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/secquestionadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		String accountname=request.getParameter("accountname");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		if(accountname!=null)
			filter+=" and accountname='"+accountname+"'";
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
		List<Secquestion> listsecquestion = secquestionSrv.getPageEntitys(
				filter, pageindex, pagesize);
		int recordscount = secquestionSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listsecquestion", listsecquestion);
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
			forwardurl = "/admin/secquestionmanager.jsp";
		}
		forward(forwardurl);
	}
	@Autowired
	private QuestionsetService qsSrv;
}
