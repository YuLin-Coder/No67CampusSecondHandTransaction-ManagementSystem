package com.daowen.controller;

import com.daowen.dto.JsonResult;
import com.daowen.entity.Receaddress;
import com.daowen.service.ReceaddressService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.List;

/**************************
 * 
 * 收货地址控制
 *
 */
@Controller
public class ReceaddressController extends SimpleController {
	@Autowired
	private ReceaddressService receaddressSrv = null;

	@Override
	@RequestMapping("/admin/receaddressmanager.do")
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
		receaddressSrv.delete(SQL);
	}

	@RequestMapping("/admin/newaddress")
	@ResponseBody
	public String newAddress(HttpServletRequest request,HttpServletResponse response) {
		String title = request.getParameter("title");
		String shr = request.getParameter("shr");
		String mobile = request.getParameter("mobile");
		String postcode = request.getParameter("postcode");
		String addinfo = request.getParameter("addinfo");
		String hyaccount = request.getParameter("hyaccount");
		SimpleDateFormat sdfreceaddress = new SimpleDateFormat("yyyy-MM-dd");
		Receaddress receaddress = new Receaddress();
		receaddress.setTitle(title == null ? "" : title);
		receaddress.setShr(shr == null ? "" : shr);
		receaddress.setMobile(mobile == null ? "" : mobile);
		receaddress.setPostcode(postcode == null ? "" : postcode);
		receaddress.setAddinfo(addinfo == null ? "" : addinfo);
		receaddress.setHyaccount(hyaccount == null ? "" : hyaccount);
		receaddressSrv.save(receaddress);
		JsonResult result=new JsonResult(1,"新增地址成功");
		return JSONObject.fromObject(result).toString();
	}
	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String shr = request.getParameter("shr");
		String mobile = request.getParameter("mobile");
		String postcode = request.getParameter("postcode");
		String addinfo = request.getParameter("addinfo");
		String hyaccount = request.getParameter("hyaccount");
		SimpleDateFormat sdfreceaddress = new SimpleDateFormat("yyyy-MM-dd");
		Receaddress receaddress = new Receaddress();
		receaddress.setTitle(title == null ? "" : title);
		receaddress.setShr(shr == null ? "" : shr);
		receaddress.setMobile(mobile == null ? "" : mobile);
		receaddress.setPostcode(postcode == null ? "" : postcode);
		receaddress.setAddinfo(addinfo == null ? "" : addinfo);
		receaddress.setHyaccount(hyaccount == null ? "" : hyaccount);
		receaddressSrv.save(receaddress);
		if (forwardurl == null) {
			forwardurl = "/admin/receaddressmanager.do?actiontype=get";
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
		Receaddress receaddress = receaddressSrv.load(new Integer(id));
		if (receaddress == null)
			return;
		String title = request.getParameter("title");
		String shr = request.getParameter("shr");
		String mobile = request.getParameter("mobile");
		String postcode = request.getParameter("postcode");
		String addinfo = request.getParameter("addinfo");
		String hyaccount = request.getParameter("hyaccount");
		SimpleDateFormat sdfreceaddress = new SimpleDateFormat("yyyy-MM-dd");
		receaddress.setTitle(title);
		receaddress.setShr(shr);
		receaddress.setMobile(mobile);
		receaddress.setPostcode(postcode);
		receaddress.setAddinfo(addinfo);
		receaddress.setHyaccount(hyaccount);
		receaddressSrv.update(receaddress);
		if (forwardurl == null) {
			forwardurl = "/admin/receaddressmanager.do?actiontype=get";
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
			Receaddress receaddress = receaddressSrv.load("where id=" + id);
			if (receaddress != null) {
				request.setAttribute("receaddress", receaddress);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/receaddressadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		String hyaccount=request.getParameter("hyaccount");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		//
		if(hyaccount!=null)
			filter+=" and hyaccount='"+hyaccount+"'";
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
		List<Receaddress> listreceaddress = receaddressSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = receaddressSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listReceaddress", listreceaddress);
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
			forwardurl = "/admin/receaddressmanager.jsp";
		}
		forward(forwardurl);
	}
}
