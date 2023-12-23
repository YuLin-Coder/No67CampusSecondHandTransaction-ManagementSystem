package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Spcategory;
import com.daowen.service.SpcategoryService;
import com.daowen.service.SpcategoryTree;
import com.daowen.ssm.simplecrud.SimpleController;
@Controller
public class SpcategoryController extends SimpleController {

	@Override
	@RequestMapping("/admin/spcategorymanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		
		mappingMethod(request,response);

	}
	
	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		spcategoryTree.deleteLeafNode(new Integer(id));
		
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String mingcheng = request.getParameter("mingcheng");
		String jieshao = request.getParameter("jieshao");
		String parentid=request.getParameter("parentid");
		System.out.println("获取到parentid="+parentid);
		SimpleDateFormat sdfspcategory = new SimpleDateFormat("yyyy-MM-dd");
		Spcategory spcategory = new Spcategory();
		spcategory.setIsleaf(1);
		if(parentid!=null)
		    spcategory.setParentid(new Integer(parentid));
		spcategory.setMingcheng(mingcheng == null ? "" : mingcheng);
		spcategory.setJieshao(jieshao == null ? "" : jieshao);
		spcategoryTree.saveTreeNode(spcategory);
		
		get();
	}

	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Spcategory spcategory = spcategorySrv.load(new Integer(id));
		if (spcategory == null)
			return;
		String mingcheng = request.getParameter("mingcheng");
		String jieshao = request.getParameter("jieshao");
		SimpleDateFormat sdfspcategory = new SimpleDateFormat("yyyy-MM-dd");
		spcategory.setMingcheng(mingcheng);
		spcategory.setJieshao(jieshao);
		spcategorySrv.update(spcategory);
		get();
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		
		String parentid = request.getParameter("parentid");
		if (parentid != null) {

			int tempid = new Integer(parentid);
            String showtext=spcategoryTree.getShowText(tempid);
            System.out.print("showtext="+showtext);
			request.setAttribute("parenttext", showtext);
			request.setAttribute("parentid", parentid);

		} else {
			request.setAttribute("parentid", 0);
			request.setAttribute("parenttext", "商品总分类");
		}
		
		
		
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Spcategory spcategory = spcategorySrv.load("where id=" + id);
			if (spcategory != null) {
				request.setAttribute("spcategory", spcategory);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/spcategoryadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String mingcheng = request.getParameter("mingcheng");
		if (mingcheng != null)
			filter += "  and mingcheng like '%" + mingcheng + "%'  ";
		//
		
		List<Spcategory> listspcategory=spcategoryTree.getTree(0);
		request.setAttribute("listspcategory", listspcategory);
		
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/spcategorymanager.jsp";
		}
		forward(forwardurl);
	}
	@Autowired
	private SpcategoryService spcategorySrv=null;
	@Autowired
	private SpcategoryTree   spcategoryTree=null;
	

}
