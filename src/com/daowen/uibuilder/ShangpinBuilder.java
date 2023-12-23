package com.daowen.uibuilder;

import java.text.DecimalFormat;
import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daowen.entity.Huiyuan;
import com.daowen.entity.Shangpin;
import com.daowen.entity.Spcategory;
import com.daowen.service.ShangpinService;
import com.daowen.service.SpcategoryService;
import com.daowen.util.BeansUtil;

public class ShangpinBuilder {

	private String picListCss = "picture-list";
	private String sidebarCss="sidebar-list";
    private ShangpinService shangpinSrv=null;
    private SpcategoryService spcSrv=null;
	private HttpServletRequest request;
	public ShangpinBuilder(HttpServletRequest request) {
		this.request=request;
		shangpinSrv=BeansUtil.getBean("shangpinService", ShangpinService.class);
		spcSrv=BeansUtil.getBean("spcategoryService", SpcategoryService.class);
	}
	
	public String buildImagetextList(List list,String title){
		return buildImagetextList(list,title,null);
	}
	
	
	public String buildImagetextList(List list, String lanmudes,String href) {
		StringBuffer sb = new StringBuffer();
		int i = 0;
		sb.append(MessageFormat.format("<div class=\"{0}\">", picListCss));
		sb.append("\r\n");
		// 栏目标题
		if(href!=null)
		sb.append(MessageFormat.format(
				"<div class=\"title\"><strong>{0}</strong><a href=\"{1}\" class=\"more\">更多</a></div>", lanmudes,href));
		else
			sb.append(MessageFormat.format("<div class=\"title\"><strong>{0}</strong></div>", lanmudes));
		//
		sb.append("<ul>");
		
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Shangpin shangpin = (Shangpin) iterator.next();
            sb.append("<li>");
			int id = shangpin.getId();
			String texfieldvalue = shangpin.getName();
			String imagefieldvalue = shangpin.getTupian();

			sb.append(MessageFormat.format(
					"<a class=\"item\" href=\"{0}\\e\\shangpininfo.jsp?id={1}\">",
					request.getContextPath(), id));
			if(shangpin.getZuixin()==1){
				sb.append("<div class=\"tag\"><span>最新</span></div>");
			}
			if(shangpin.getTuijian()==1){
				sb.append("<div class=\"tag\"><span>推荐</span></div>");
			}
			if(shangpin.getHot()==1){
				sb.append("<div class=\"tag\"><span>热卖</span></div>");
			}
			sb.append(MessageFormat.format("<div class=\"img\"><img src=\"{0}{1}\"/> </div>",
					request.getContextPath(),imagefieldvalue));
			sb.append(MessageFormat.format("<div class=\"name\">{0}</div>",texfieldvalue));
			sb.append(MessageFormat.format("<div class=\"price\">¥{0}</div>",shangpin.getHyjia()));
			sb.append(MessageFormat.format("<div class=\"discount\">{0}折</div>",new DecimalFormat("0.00").format(shangpin.getHyjia()/shangpin.getJiage())));
			sb.append("</a>");
			// end li
			sb.append("</li>");
			
		}
		sb.append("</ul>");
		// end of picutre-list
		sb.append("</div>");
		
		return sb.toString();
	}

	public String buildHotSidebar(String barName,int count){
		List<Shangpin> listShangpin=shangpinSrv.getHotSales(count);
		return buildSidebarList(listShangpin,barName,sidebarCss);
	}
	
	
	public String buildNewestidebar(String barName,int count){
		List<Shangpin> listShangpin=shangpinSrv.getNewest(count);
		return buildSidebarList(listShangpin,barName,sidebarCss);
	}
	
	
	public String buildSidebarList(List<Shangpin> list,String title,String sidebarCss){
		StringBuilder sb=new StringBuilder();
		
		sb.append("<div class=\"sidebar-list\">");
		sb.append(MessageFormat.format("<div class=\"title\">{0}</div>",title));
		sb.append("<ul>");
		int i=1;
		for(Shangpin shangpin :list){
			sb.append("<li>");
			sb.append(MessageFormat.format("<div class=\"o-index\">{0}</div>",i++));
			sb.append(MessageFormat.format("<div class=\"img\"><a href=\"{0}\\e\\shangpininfo.jsp?id={1}\"><img src=\"{0}{2}\"></a></div>",request.getContextPath(),shangpin.getId(),shangpin.getTupian()));
		    sb.append(MessageFormat.format("<div class=\"name\">{0}</div>", shangpin.getName()));
		    sb.append(MessageFormat.format("<div class=\"price\">¥{0}<span class=\"del\">{1}</span></div>", shangpin.getHyjia(),shangpin.getJiage()));
		    sb.append("</li>");
		}
		
		sb.append("</ul>");
		sb.append("</div>");//end of sidebar-list
		return sb.toString();
	}
	/**
	 * 图片
	 * 
	 * @param spcId
	 * @param maxcount
	 * @return
	 */
	public String buildImageShangpin(int spcId, int maxcount) {
		StringBuilder sb = new StringBuilder();
		Spcategory spcategory = null;
		List<Shangpin> shangpinlist = null;
		if (spcId != 0) {
			spcategory = spcSrv.load("where id="+ spcId);
			if (spcategory == null)
				return "";
			if (maxcount != -1)
				shangpinlist = shangpinSrv.findBySpcateid(spcId, maxcount);
			else
				shangpinlist = shangpinSrv.findBySpcateid(spcId);
			String href=request.getContextPath()+"/e/shangpinlist.jsp?spcid="+spcId;
			// 等到书籍信息
			sb.append(buildImagetextList(shangpinlist, spcategory.getMingcheng(),href));

		} else {
			shangpinlist = shangpinSrv.getEntity("");
			// 等到书籍信息
			sb.append(buildImagetextList(shangpinlist, "在线书籍"));

		}

		return sb.toString();

	}
	public String buildHotSale(int count) {
		StringBuilder sb = new StringBuilder();
		List<Shangpin> shangpinlist = shangpinSrv.getHotSales(count);
		// 等到书籍信息
		sb.append(buildImagetextList(shangpinlist, "热买书籍推荐"));
		return sb.toString();
	}

	// 推荐书籍
	public String buildRecomment(String title) {

		StringBuilder sb = new StringBuilder();
		List<Shangpin> shangpinlist = shangpinSrv.getRecomment();
		// 等到书籍信息
		sb.append(buildImagetextList(shangpinlist, title));
		return sb.toString();
	}

	// 最新书籍
	public String buildLastest() {
		StringBuilder sb = new StringBuilder();
		List<Shangpin> shangpinlist = shangpinSrv.getNewest(10);
		// 得到最新书籍信息
		sb.append(buildImagetextList(shangpinlist, "新货上架"));
		return sb.toString();
	}
	
	

	public ShangpinBuilder view(HttpServletResponse response,String id){
		Huiyuan huiyuan=(Huiyuan)request.getSession().getAttribute("huiyuan");
		if(huiyuan==null)
			return this;
 		String username=huiyuan==null?"":huiyuan.getAccountname();
 		//获取历史浏览
 		new ViewHistory("shangpin_browser_"+username).view(request,response,id);
 		return this;
	}


	public String buildViewedList() {

		StringBuilder sb = new StringBuilder();
		Huiyuan huiyuan=(Huiyuan)request.getSession().getAttribute("huiyuan");
 		if(huiyuan==null)
 			return "";
 		String username=huiyuan==null?"":huiyuan.getAccountname();
 		
		// 获取历史浏览
		List<String> ids =new  ViewHistory("shangpin_browser_"+username).historyView(request);
		String temids = "";
		int i = 0;
		for (String id : ids) {
			temids += id;
			if (i < ids.size() - 1) {
				temids += ",";
			}
			i++;

		}
		if (ids != null && ids.size() > 0) {
			List<Shangpin> shangpinlist = shangpinSrv.getEntity(" where id in (" + temids + ")");
			// 得到最新书籍信息
			sb.append(buildImagetextList(shangpinlist, "猜你喜欢的商品"));
		}
		return sb.toString();
	}

	
	

}
