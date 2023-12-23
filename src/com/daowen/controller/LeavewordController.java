package com.daowen.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Leaveword;
import com.daowen.service.LeavewordService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

@Controller
public class LeavewordController extends SimpleController {

	@Autowired
	private LeavewordService leavewordSrv = null;

	@Override
	@RequestMapping("/admin/leavewordmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	private void reply() {

		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		
		if (id == null)
			return;
		Leaveword leaveword = leavewordSrv.load(new Integer(id));
		if (leaveword == null)
			return;
		
		String replycontent = request.getParameter("replycontent");
		
		
		leaveword.setReplycontent(replycontent);
		leaveword.setStatus(2);
		
		leavewordSrv.update(leaveword);
		if (forwardurl == null) {
			forwardurl = "/admin/leavewordmanager.jsp";
		}
		redirect(forwardurl);

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids)
				+ ")";
		System.out.println("sql=" + SQL);
		leavewordSrv.delete(SQL);
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
		String replyren = request.getParameter("replyren");
		String replyname=request.getParameter("replyname");
		String replycontent = request.getParameter("replycontent");
		String lwren = request.getParameter("lwren");
		String lwname = request.getParameter("lwname");
		SimpleDateFormat sdfleaveword = new SimpleDateFormat("yyyy-MM-dd");
		Leaveword leaveword = new Leaveword();
		leaveword.setTitle(title == null ? "" : title);
		leaveword.setDcontent(dcontent == null ? "" : dcontent);
		leaveword.setCreatetime(new Date());
		leaveword.setReplyren(replyren == null ? "" : replyren);
		leaveword.setReplytime(new Date());
		leaveword.setReplyname(replyname==null?"":replyname);
		leaveword.setReplycontent(replycontent == null ? "" : replycontent);
		leaveword.setStatus(1);
		leaveword.setLwren(lwren == null ? "" : lwren);
		leaveword.setLwname(lwname==null?"":lwname);
		leavewordSrv.save(leaveword);
		if (forwardurl == null) {
			forwardurl = "/admin/leavewordmanager.do?actiontype=get";
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
		if (id != null) {
			Leaveword leaveword = leavewordSrv.load("where id=" + id);
			if (leaveword != null) {
				request.setAttribute("leaveword", leaveword);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/leavewordadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		//
		int pageindex = 1;
		int pagesize = 10;

		String title = request.getParameter("title");

		String lwren = request.getParameter("lwren");

		if (title != null)
			filter += "  and title like '%" + title + "%'  ";

		if (lwren != null)
			filter += " and lwren='" + lwren + "'";
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
		List<Leaveword> listleaveword = leavewordSrv.getPageEntitys(filter, pageindex,
				pagesize);
		int recordscount = leavewordSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listleaveword", listleaveword);
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
			forwardurl = "/admin/leavewordmanager.jsp";
		}
		forward(forwardurl);
	}

}
