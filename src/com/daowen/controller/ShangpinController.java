package com.daowen.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Caigou;
import com.daowen.entity.Shangpin;
import com.daowen.entity.Spcategory;
import com.daowen.service.CaigouService;
import com.daowen.service.DuixiangService;
import com.daowen.service.ShangpinService;
import com.daowen.service.SpcategoryService;
import com.daowen.service.SptagService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.util.SequenceUtil;
import com.daowen.webcontrol.PagerMetal;

@Controller
public class ShangpinController extends SimpleController {

	@Override
	@RequestMapping("/admin/shangpinmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {

		mappingMethod(request, response);

	}

	public void shenpi() {
		String id = request.getParameter("id");
		String forwardurl = request.getParameter("forwardurl");
		String spstate = request.getParameter("spstate");
		String reply = request.getParameter("reply");
		String shenpiren = request.getParameter("shenpiren");
		int statuscode = 3;
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		if (id == null)
			return;
		Shangpin shangpin = shangpinSrv.load(" where id=" + id);
		if (shangpin == null)
			return;
		if (spstate != null)
			statuscode = Integer.parseInt(spstate);
		shangpin.setSpstate(statuscode);
		shangpinSrv.update(shangpin);
		if (forwardurl == null) {
			forwardurl = "/admin/shangpinmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	public void shangjia() {

		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		shangpinSrv.executeUpdate(" update shangpin set state=1 where id in("
				+ join(spliter, ids) + ")");

		try {
			response.getWriter().write(new Integer(ids.length));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void xiajia() {

		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " update shangpin set state=2 where id in("
				+ join(spliter, ids) + ")";
		System.out.println("sql=" + SQL);
		shangpinSrv.executeUpdate(SQL);

		try {
			response.getWriter().write(new Integer(ids.length));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void kucunadd() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		String supplor = request.getParameter("supplor");
		String cgdate = request.getParameter("cgdate");
		String cgren = request.getParameter("cgren");
		if (id == null)
			return;
		Shangpin shangpin = shangpinSrv.load(new Integer(id));
		if (shangpin == null)
			return;
		String shuliang = request.getParameter("shuliang");
		String danwei = request.getParameter("danwei");

		if (shuliang != null) {
			shangpin.setKucun(shangpin.getKucun() + Integer.parseInt(shuliang));
			shangpin.setDanwei(danwei);
			shangpinSrv.update(shangpin);

			Caigou caigou = new Caigou();
			caigou.setSpno(shangpin.getSpno());
			caigou.setSpname(shangpin.getName());
			caigou.setSupplor(supplor);
			caigou.setCount(Double.parseDouble(shuliang));
			if (cgdate != null) {
				try {
					caigou.setCgdate(new SimpleDateFormat("yyyy-MM-dd")
							.parse(cgdate));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			} else {
				caigou.setCgdate(new Date());
			}
			caigou.setCgren(cgren == null ? "" : cgren);

			caigou.setDanwei(danwei == null ? "" : danwei);
			caigouSrv.save(caigou);

		}

		if (forwardurl == null) {
			forwardurl = "/admin/shangpinmanager.do?actiontype=get";
		}
		redirect(forwardurl);

	}

	public void hasExist() {
		String spno = request.getParameter("spno");
		String strres = "true";
		if (shangpinSrv.isExist("where spno='" + spno.trim() + "'")) {
			strres = "false";
		} else {

			strres = "true";
		}
		try {
			System.out.println("商品编号存在性=" + strres);
			response.getWriter().write(strres);
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
		String SQL = " where id in(" + join(spliter, ids)
				+ ")";
		System.out.println("sql=" + SQL);
		shangpinSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String name = request.getParameter("name");
		String jiage = request.getParameter("jiage");
		String dazhe = request.getParameter("dazhe");
		String tuijian = request.getParameter("tuijian");
		String zuixin = request.getParameter("zuixin");
		String hot = request.getParameter("hot");
		String sptype = request.getParameter("sptype");
		String sptypeid = request.getParameter("sptypeid");
		String tupian = request.getParameter("tupian");
		String jieshao = request.getParameter("jieshao");
		String pubren = request.getParameter("pubren");
		String subtitle = request.getParameter("subtitle");
		String discount = request.getParameter("discount");
		String tuihuan = request.getParameter("tuihuan");
		String jifen = request.getParameter("jifen");
		String baozhuang = request.getParameter("baozhuang");
		String dxid = request.getParameter("dxid");
		String shdx = request.getParameter("shdx");
		String chandi = request.getParameter("chandi");
		String tagid = request.getParameter("tagid");
		String tagname = request.getParameter("tagname");
		String danwei=request.getParameter("danwei");
		SimpleDateFormat sdfshangpin = new SimpleDateFormat("yyyy-MM-dd");
		Shangpin shangpin = new Shangpin();
		shangpin.setName(name == null ? "" : name);
		shangpin.setSpno(SequenceUtil.buildSequence("SP"));
		shangpin.setJiage(jiage == null ? (double) 0 : new Double(jiage));
		shangpin.setDazhe(dazhe == null ? 0 : new Integer(dazhe));
		shangpin.setTuijian(tuijian == null ? 0 : new Integer(tuijian));
		shangpin.setZuixin(zuixin == null ? 0 : new Integer(zuixin));
		shangpin.setHot(hot == null ? 0 : new Integer(hot));
		shangpin.setSptype(sptype == null ? "" : sptype);
		shangpin.setSptypeid(sptypeid == null ? 0 : new Integer(sptypeid));
		shangpin.setTupian(tupian == null ? "" : tupian);
		shangpin.setSpstate(2);
		shangpin.setJieshao(jieshao == null ? "" : jieshao);
		shangpin.setBaozhuang(baozhuang == null ? "" : baozhuang);
		shangpin.setSubtitle(subtitle == null ? "" : subtitle);
		if (discount != null)
			shangpin.setHyjia(shangpin.getJiage()
					* Double.parseDouble(discount));
		else
			shangpin.setHyjia(shangpin.getJiage());
		shangpin.setChandi(chandi == null ? "" : chandi);
		shangpin.setState(1);
		shangpin.setDanwei(danwei==null?"":danwei);
		shangpin.setShdx(shdx == null ? "" : shdx);
		shangpin.setJifen(jifen == null ? 0 : Integer.parseInt(jifen));
		shangpin.setPubtime(new Date());
		shangpin.setDxid(dxid == null ? 0 : Integer.parseInt(dxid));
		shangpin.setPubren(pubren == null ? "" : pubren);
		shangpin.setTagid(tagid == null ? 0 : Integer.parseInt(tagid));
		shangpin.setTagname(tagname == null ? "" : tagname);
		shangpinSrv.save(shangpin);
		if (forwardurl == null) {
			forwardurl = "/admin/shangpinmanager.do?actiontype=get";
		}
		redirect(forwardurl);

	}

	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String errorurl = request.getParameter("errorurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Shangpin shangpin = shangpinSrv.load(new Integer(id));
		if (shangpin == null)
			return;
		String name = request.getParameter("name");
		String jiage = request.getParameter("jiage");
		String dazhe = request.getParameter("dazhe");
		String tuijian = request.getParameter("tuijian");
		String zuixin = request.getParameter("zuixin");
		String hot = request.getParameter("hot");
		String sptype = request.getParameter("sptype");
		String sptypeid = request.getParameter("sptypeid");
		String tupian = request.getParameter("tupian");
		String jieshao = request.getParameter("jieshao");
		String pubren = request.getParameter("pubren");
		String subtitle = request.getParameter("subtitle");
		String discount = request.getParameter("discount");
		String danwei=request.getParameter("danwei");
		String jifen = request.getParameter("jifen");
		String shdx = request.getParameter("shdx");
		String dxid = request.getParameter("dxid");
		String baozhuang = request.getParameter("baozhuang");
		String chandi = request.getParameter("chandi");
		String tagid = request.getParameter("tagid");
		String tagname = request.getParameter("tagname");
		shangpin.setName(name);
		shangpin.setJiage(jiage == null ? (double) 0 : new Double(jiage));
		shangpin.setDazhe(dazhe == null ? 0 : new Integer(dazhe));
		shangpin.setTuijian(tuijian == null ? 0 : new Integer(tuijian));
		shangpin.setZuixin(zuixin == null ? 0 : new Integer(zuixin));
		shangpin.setHot(hot == null ? 0 : new Integer(hot));
		shangpin.setChandi(chandi == null ? "" : chandi);
		shangpin.setSubtitle(subtitle == null ? "" : subtitle);
		shangpin.setSptype(sptype);
		shangpin.setSptypeid(sptypeid == null ? 0 : new Integer(sptypeid));
		shangpin.setTupian(tupian);
		shangpin.setJieshao(jieshao);
		shangpin.setDanwei(danwei==null?"":danwei);
		shangpin.setBaozhuang(baozhuang == null ? "" : baozhuang);
		if (discount != null)
			shangpin.setHyjia(shangpin.getJiage()
					* Double.parseDouble(discount));
		else
			shangpin.setHyjia(shangpin.getJiage());
		shangpin.setPubtime(new Date());
		shangpin.setPubren(pubren);
		shangpin.setShdx(shdx == null ? "" : shdx);
		shangpin.setJifen(jifen == null ? 0 : Integer.parseInt(jifen));
		shangpin.setDxid(dxid == null ? 0 : Integer.parseInt(dxid));
		shangpin.setChandi(chandi == null ? "" : chandi);
		shangpin.setTagid(tagid == null ? 0 : Integer.parseInt(tagid));
		shangpin.setTagname(tagname == null ? "" : tagname);
		shangpinSrv.update(shangpin);

		if (forwardurl == null) {
			forwardurl = "/admin/shangpinmanager.do?actiontype=get";
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
			Shangpin shangpin = shangpinSrv.load("where id=" + id);
			if (shangpin != null) {
				request.setAttribute("shangpin", shangpin);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> sptype_datasource = spcategorySrv
				.getEntity("where isleaf=1 order by id asc");
		request.setAttribute("sptype_datasource", sptype_datasource);

		List<Object> dxid_datasource = duixiangSrv.getEntity("");
		request.setAttribute("dxid_datasource", dxid_datasource);
		List<Object> tagid_datasource = sptagSrv.getEntity("");
		request.setAttribute("tagid_datasource", tagid_datasource);

		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/shangpinadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {

		List<Object> sptype_datasource = spcategorySrv
				.getEntity("where isleaf=1");
		if (sptype_datasource != null) {
			Spcategory spcategory = new Spcategory();
			spcategory.setId(-1);
			spcategory.setMingcheng("全部");
			spcategory.setIsleaf(1);
			sptype_datasource.add(spcategory);
		}
		request.setAttribute("sptype_datasource", sptype_datasource);
		String filter = "where 1=1 ";
		String spname = request.getParameter("name");
		String pubren = request.getParameter("pubren");
		if (spname != null)
			filter += "  and name like '%" + spname + "%'  ";
		if (pubren != null)
			filter += " and pubren='" + pubren + "'";

		String sptype = request.getParameter("sptype");
		String sptypeid = request.getParameter("sptypeid");
		System.out.println("sptypeid=" + sptypeid);
		if (sptypeid != null) {
			if (!sptypeid.equals("-1"))
				filter += "  and sptypeid=" + sptypeid;
		} else {
			sptypeid = "-1";
			request.setAttribute("sptypeid", sptypeid);
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
		List<Shangpin> listshangpin = shangpinSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = shangpinSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listshangpin", listshangpin);
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
			forwardurl = "/admin/shangpinmanager.jsp";
		}
		forward(forwardurl);
	}

	@Autowired
	private ShangpinService shangpinSrv = null;
	@Autowired
	private SpcategoryService spcategorySrv = null;
	@Autowired
	private DuixiangService duixiangSrv = null;
	@Autowired
	private SptagService sptagSrv = null;
	@Autowired
	private CaigouService caigouSrv = null;

}
