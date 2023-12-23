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

import com.daowen.entity.Qiugou;
import com.daowen.service.QiugouService;
import com.daowen.service.SpcategoryService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 求购信息控制
 *
 */
@Controller
public class QiugouController extends SimpleController {
	@Autowired
	private QiugouService qiugouSrv = null;
	@Autowired
	private SpcategoryService wptypeSrv = null;

	@Override
	@RequestMapping("/admin/qiugoumanager.do")
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
		qiugouSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String jiage = request.getParameter("jiage");
		String xinjiu = request.getParameter("xinjiu");
		String szdi = request.getParameter("szdi");
		String tupian = request.getParameter("tupian");
		String clickcount = request.getParameter("clickcount");
		String des = request.getParameter("des");
		String mobile = request.getParameter("mobile");
		String typeid = request.getParameter("typeid");
		String typename = request.getParameter("typename");
		String brandname = request.getParameter("brandname");
		String xinghao = request.getParameter("xinghao");
		String state = request.getParameter("state");
		SimpleDateFormat sdfqiugou = new SimpleDateFormat("yyyy-MM-dd");
		Qiugou qiugou = new Qiugou();
		qiugou.setTitle(title == null ? "" : title);
		qiugou.setPubren(pubren == null ? "" : pubren);
		if (pubtime != null) {
			try {
				qiugou.setPubtime(sdfqiugou.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			qiugou.setPubtime(new Date());
		}
		qiugou.setJiage(jiage == null ? "" : jiage);
		qiugou.setXinjiu(xinjiu == null ? "" : xinjiu);
		qiugou.setSzdi(szdi == null ? "" : szdi);
		qiugou.setTupian(tupian == null ? "" : tupian);
		qiugou.setClickcount(clickcount == null ? 0 : new Integer(clickcount));
		qiugou.setDes(des == null ? "" : des);
		qiugou.setMobile(mobile == null ? "" : mobile);
		qiugou.setTypeid(typeid == null ? 0 : new Integer(typeid));
		qiugou.setTypename(typename == null ? "" : typename);
		qiugou.setBrandname(brandname == null ? "" : brandname);
		qiugou.setXinghao(xinghao == null ? "" : xinghao);
		qiugou.setState(state == null ? 0 : new Integer(state));
		qiugouSrv.save(qiugou);
		if (forwardurl == null) {
			forwardurl = "/admin/qiugoumanager.do?actiontype=get";
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
		Qiugou qiugou = qiugouSrv.load(new Integer(id));
		if (qiugou == null)
			return;
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String jiage = request.getParameter("jiage");
		String xinjiu = request.getParameter("xinjiu");
		String szdi = request.getParameter("szdi");
		String tupian = request.getParameter("tupian");
		String clickcount = request.getParameter("clickcount");
		String des = request.getParameter("des");
		String mobile = request.getParameter("mobile");
		String typeid = request.getParameter("typeid");
		String typename = request.getParameter("typename");
		String brandname = request.getParameter("brandname");
		String xinghao = request.getParameter("xinghao");
		String state = request.getParameter("state");
		SimpleDateFormat sdfqiugou = new SimpleDateFormat("yyyy-MM-dd");
		qiugou.setTitle(title);
		qiugou.setPubren(pubren);
		if (pubtime != null) {
			try {
				qiugou.setPubtime(sdfqiugou.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		qiugou.setJiage(jiage);
		qiugou.setXinjiu(xinjiu);
		qiugou.setSzdi(szdi);
		qiugou.setTupian(tupian);
		qiugou.setClickcount(clickcount == null ? 0 : new Integer(clickcount));
		qiugou.setDes(des);
		qiugou.setMobile(mobile);
		qiugou.setTypeid(typeid == null ? 0 : new Integer(typeid));
		qiugou.setTypename(typename);
		qiugou.setBrandname(brandname);
		qiugou.setXinghao(xinghao);
		qiugou.setState(state == null ? 0 : new Integer(state));
		qiugouSrv.update(qiugou);
		if (forwardurl == null) {
			forwardurl = "/admin/qiugoumanager.do?actiontype=get";
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
			Qiugou qiugou = qiugouSrv.load("where id=" + id);
			if (qiugou != null) {
				request.setAttribute("qiugou", qiugou);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> typeid_datasource = wptypeSrv.getEntity("where isleaf=1 ");
		request.setAttribute("typeid_datasource", typeid_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/qiugouadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String pubren=request.getParameter("pubren");
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		if(pubren!=null)
			filter+=" and pubren='"+pubren+"'";
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
		List<Qiugou> listqiugou = qiugouSrv.getPageEntitys(filter, pageindex,
				pagesize);
		int recordscount = qiugouSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listqiugou", listqiugou);
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
			forwardurl = "/admin/qiugoumanager.jsp";
		}
		forward(forwardurl);
	}
}
