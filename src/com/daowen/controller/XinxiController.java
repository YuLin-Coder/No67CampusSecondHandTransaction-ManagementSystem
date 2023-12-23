package com.daowen.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Xinxi;
import com.daowen.service.XinxiService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

@Controller
public class XinxiController extends SimpleController {

	@Autowired
	private XinxiService xinxiSrv=null;
	@Override
	@RequestMapping("/admin/xinximanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);

	}
	public void agree() {
		  String id=request.getParameter("id");
		  if (id == null)
				return;
			Xinxi xinxi = (Xinxi)xinxiSrv.load(new Integer(id));
			if (xinxi == null)
				return;
		   xinxi.setAgreecount(xinxi.getAgreecount()+1);
		   xinxiSrv.update(xinxi);
		   try {
			response.getWriter().write(new Integer(xinxi.getAgreecount()).toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		
	}
	

	public void against() {
		  String id=request.getParameter("id");
		  if (id == null)
				return;
			Xinxi xinxi = (Xinxi) xinxiSrv.load( new Integer(id));
			if (xinxi == null)
				return;
		   xinxi.setAgainstcount(xinxi.getAgainstcount()+1);
		   xinxiSrv.update(xinxi);
		   try {
			response.getWriter().write(new Integer(xinxi.getAgainstcount()).toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		
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
		xinxiSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String dcontent = request.getParameter("dcontent");
		String tupian2 = request.getParameter("tupian2");
		String lanmuid = request.getParameter("lanmuid");
		String lanmuming = request.getParameter("lanmuming");
		String  tuijian=request.getParameter("tuijian");
		String  hot=request.getParameter("hot");
		String zuixin=request.getParameter("zuixin");
		String  zhaiyao=request.getParameter("zhaiyao");
		String usertype=request.getParameter("usertype");
		SimpleDateFormat sdfxinxi = new SimpleDateFormat("yyyy-MM-dd");
		
		Xinxi xinxi = new Xinxi();
		xinxi.setTitle(title == null ? "" : title);
		xinxi.setPubren(pubren == null ? "" : pubren);
		
		xinxi.setPubtime(new Date());
		xinxi.setHot(hot!=null?1:0);
		xinxi.setTuijian(tuijian!=null?1:0);
		xinxi.setZuixin(zuixin!=null?1:0);
		xinxi.setClickcount(0);
		xinxi.setZhaiyao(zhaiyao==null?"":zhaiyao);
		xinxi.setDcontent(dcontent == null ? "" : dcontent);
		xinxi.setTupian2(tupian2 == null ? "" : tupian2);
		xinxi.setAgainstcount(0);
		xinxi.setAgreecount(0);
		xinxi.setLanmuid(new Integer(lanmuid));
		
		xinxi.setLanmuming(lanmuming == null ? "" : lanmuming);
		xinxiSrv.save(xinxi);
		
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/xinximanager.do?actiontype=get";
		}else{
			forwardurl+="&lanmuid="+xinxi.getLanmuid();
		}
		redirect(forwardurl);
		
	
	}

	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Xinxi xinxi = (Xinxi) xinxiSrv.load(new Integer(id));
		if (xinxi == null)
			return;
		String title = request.getParameter("title");
		String laiyuan=request.getParameter("laiyuan");
		String dcontent = request.getParameter("dcontent");
		String tupian2 = request.getParameter("tupian2");
		String lanmuid = request.getParameter("lanmuid");
		String lanmuming = request.getParameter("lanmuming");
		String  tuijian=request.getParameter("tuijian");
		String  hot=request.getParameter("hot");
		String pubren=request.getParameter("pubren");
		String zuixin=request.getParameter("zuixin");
		String zhaiyao=request.getParameter("zhaiyao");
		xinxi.setZhaiyao(zhaiyao);
		xinxi.setTitle(title);
	    xinxi.setLaiyuan(laiyuan);
		xinxi.setDcontent(dcontent);
		xinxi.setHot(hot!=null?1:0);
		
		xinxi.setTuijian(tuijian!=null?1:0);
		xinxi.setZuixin(zuixin!=null?1:0);
		xinxi.setTupian2(tupian2);
		if(pubren!=null)
			   xinxi.setPubren(pubren);
		xinxi.setLanmuid(new Integer(lanmuid));
		xinxi.setLanmuming(lanmuming);
		xinxiSrv.update(xinxi);
		
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/xinximanager.do?actiontype=get";
		}else{
			forwardurl+="&lanmuid="+xinxi.getLanmuid();
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
			Xinxi xinxi = xinxiSrv.load("where id=" + id);
			if (xinxi != null) {
				request.setAttribute("xinxi", xinxi);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/xinxiadd.jsp";
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
		String title=request.getParameter("title");
		String pubren=request.getParameter("pubren");
		String lanmuid=request.getParameter("lanmuid");
		
		// 获取当前分页
		if(title!=null)
		   filter+=" and title like '%"+title+"%'";
		
		if(lanmuid!=null&&lanmuid!="")
			filter+=" and lanmuid="+lanmuid;
		
		if(pubren!=null)
			filter+=" and pubren='"+pubren+"'";
		System.out.println("filter="+filter);
		
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Xinxi> listxinxi = xinxiSrv.getPageEntitys(filter+" order by id desc ", pageindex, pagesize);
		int recordscount = xinxiSrv.getRecordCount(filter == null ? "": filter);
		request.setAttribute("listxinxi", listxinxi);
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
			forwardurl = "/admin/xinximanager.jsp";
		}
		forward(forwardurl);
	}
	
	
	

}
