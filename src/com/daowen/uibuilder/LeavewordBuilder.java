package com.daowen.uibuilder;

import java.sql.SQLException;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.daowen.jdbc.simplecrud.Adapter;
import com.daowen.jdbc.simplecrud.DataRow;
import com.daowen.jdbc.simplecrud.DataTable;
import com.daowen.jdbc.simplecrud.DataTableHandler;
import com.daowen.jdbc.simplecrud.MybatisAdapter;
import com.daowen.jdbc.simplecrud.SimpleJdbc;

public class LeavewordBuilder {

	private SimpleJdbc simpleDao=null;
	private HttpServletRequest request=null;
	public LeavewordBuilder(HttpServletRequest request){
		this.request=request;
		Adapter adapter=new MybatisAdapter("applicationContext.xml", "sqlSessionFactoryBean");
		this.simpleDao=new SimpleJdbc(adapter);
	}
	public String build(){
		
		StringBuffer sb=new StringBuffer();
		sb.append("<ul >");
		DataTable list=null;
		try {
			list = simpleDao.query("select lw.*,h.name,h.touxiang from leaveword lw,huiyuan h where lwren=h.accountname ",new DataTableHandler());
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}
		try {
			for(DataRow dataRow : list.getRows())
			{
			         sb.append("<li class=\"item\">");
			         sb.append(MessageFormat.format("<img class=\"avatar\" src=\"{0}{1}\" />",request.getContextPath(), dataRow.getString("touxiang")));
			         sb.append("<div class='body'>");
			         sb.append(MessageFormat.format("<div class=\"head\">{0}</div>",dataRow.getString("title")));
			         sb.append("<div class=\"content\">");
			         sb.append(MessageFormat.format("<span class=\"user-info\">{0}{1}</span>",dataRow.getString("lwren"),dataRow.getString("name")));
			         sb.append(MessageFormat.format("<span class=\"pubtime\">{0}</span>",toDatetimeTip(dataRow.getDate("pubtime"))));
			         sb.append("<div class='data-info'>");
			         sb.append(dataRow.getString("dcontent"));
			         //end data-info
			         sb.append("</div>");
			         //
			         if(dataRow.getInt("status")==1)
			         {
				         sb.append("<div class=\"reply\">");
				         sb.append("<div class=\"reply-block\">");
				         sb.append(MessageFormat.format("<div>{1}:{0}</div>", dataRow.get("replycontent"),dataRow.get("replyren")));
				         sb.append(MessageFormat.format("<span>回复:{0}</span>", new SimpleDateFormat().format(dataRow.get("replytime"))));
				         sb.append("</div>");
				         sb.append("</div>");
			         }
			         sb.append("<div class=\"footer\"></div>");
			         //end content
			         sb.append("</div>");
			         //end body
			         sb.append("</div>");
			         sb.append("</li>");
			        
			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sb.append("</ul>");
		
		return sb.toString();
	}
	
    private  String toDatetimeTip(Date timestamp){
		
		String times="";
		long lpubtime=timestamp.getTime();
        long day=(long)(new Date().getTime()- lpubtime)/(60 * 60 * 1000*24);
        long hour=(long)(new Date().getTime()-lpubtime)/(60 * 60 * 1000);
        long minuter=(long)(new Date().getTime()- lpubtime)/(60 * 1000);
        long seconds=(new Date().getTime()- lpubtime)/1000;
        if(day>0)
       	 times=day+"天前";
        else
        if(hour>0)
       	 times=hour+"小时前";
        else
       	 if(minuter>0)
       	   times=minuter+"分钟前";
       	 else
       		 times=seconds+"秒前";
        
        return times;
	}
}
