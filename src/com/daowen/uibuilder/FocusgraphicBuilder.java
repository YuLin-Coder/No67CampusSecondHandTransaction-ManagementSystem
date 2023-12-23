package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.daowen.entity.Jiaodiantu;
import com.daowen.service.JiaodiantuService;
import com.daowen.util.BeansUtil;


public class FocusgraphicBuilder {

	
	private JiaodiantuService jdtSrv=null;
	private HttpServletRequest request;
	public FocusgraphicBuilder(HttpServletRequest request){
		jdtSrv=BeansUtil.getBean("jiaodiantuService", JiaodiantuService.class);
		this.request=request;
	}
	public  String build()
	{
		StringBuffer sb = new StringBuffer();
		sb.append("<div id=\"slide_c\">");
		List<Jiaodiantu> list = jdtSrv.getEntity();
		for (Iterator<Jiaodiantu> it = list.iterator(); it.hasNext();) {
			Jiaodiantu n = it.next();
			sb.append(MessageFormat.format(
					"<a target=\"_blank\" href=''{0}''><img alt=\"\" title=\"\" src=\"{1}{2}\"></a>",
					n.getHref(), request.getContextPath(), n.getTupian()));
			sb.append("\r\n");
		}
		sb.append(" <div class=\"ico_c\">");
		sb.append("\r\n");
		sb.append("</div>");
		sb.append("\r\n");
		sb.append("</div>");
		return sb.toString();
		
	}
	public  String buildFullScreen(){
		StringBuffer sb = new StringBuffer();
		StringBuffer imagessb=new StringBuffer();
		StringBuffer titlesb=new StringBuffer();
		sb.append("<div class=\"carousel\" >");
		sb.append("<div class=\"car-big-picture\">");

		List<Jiaodiantu> list = jdtSrv.getTopEntity("", 10);
		int i=0;
		for (Iterator<Jiaodiantu> it = list.iterator(); it.hasNext();) {
			Jiaodiantu n = it.next();
			String style="";
			if(i++==0){
				style=" style='display:block;'";
			}
			imagessb.append(MessageFormat.format(
					"<a target=\"_blank\" href=''{0}''><img  {3}  src=\"{1}{2}\"></a>",
					n.getHref(), request.getContextPath(), n.getTupian(),style));
			imagessb.append("\r\n");
			
			titlesb.append(MessageFormat.format("<p>{0}</p>",n.getTitle()));
			
			
		}
	    sb.append(imagessb);
		sb.append("</div>");
		
		sb.append("\r\n");
		sb.append("<div class=\"car_click\">");
		sb.append("<div class=\"car_c_title\">");
		sb.append(titlesb);
		sb.append("</div>");
		
		
        sb.append("<div class=\"car_c_smallpic\">");
        
        sb.append("<input class=\"car_c_inpt1\" type=\"button\"/>");
		
        sb.append(imagessb);
        
        sb.append("<input class=\"car_c_inpt2\" type=\"button\"/>");
		
		sb.append("</div>");
		
		sb.append("</div>");
		
		
		//end carousel
		sb.append("</div>");
		
		
		return sb.toString();
		
	}
	public String build3() {
		StringBuffer sb = new StringBuffer();
		
		StringBuffer titlesb=new StringBuffer();
		sb.append("<div class=\"c-banner\">");
		sb.append("<div class=\"banner\">");
		sb.append("<ul>");
        titlesb.append("<div class=\"jumpBtn\">\r\n"); 
         titlesb.append("<ul>");
		List<Jiaodiantu> list = jdtSrv.getTopEntity("", 10);
		int i=0;
	
		for (Iterator<Jiaodiantu> it = list.iterator(); it.hasNext();) {
			Jiaodiantu n = it.next();
			sb.append(MessageFormat.format("<li><a href=\"{0}\"><img src=\"{1}{2}\"></a></li>",n.getHref(),request.getContextPath(),n.getTupian()));
			titlesb.append(MessageFormat.format("<li jumpImg=\"{0}\"></li>",i++));
		}
	    //end img
		sb.append("</ul>");
		
		//end banner
		sb.append("</div>");
		sb.append(MessageFormat.format("<div class=\"nexImg\">\r\n" + 
				"		<img src=\"{0}/e/images/nexImg.png\" />\r\n" + 
				"	</div>\r\n" + 
				"	<div class=\"preImg\">\r\n" + 
				"		<img src=\"{0}/e/images/preImg.png\" />\r\n" + 
				"	</div>",request.getContextPath()));
		titlesb.append("</ul>");
		titlesb.append("</div>");
		
		sb.append(titlesb.toString());
		//end c-banner
		sb.append("</div>");
		
		return sb.toString();
	}
	
}
