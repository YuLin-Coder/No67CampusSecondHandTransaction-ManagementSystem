package com.daowen.controller;

import java.sql.SQLException;
import java.text.MessageFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.jdbc.simplecrud.DataTable;
import com.daowen.jdbc.simplecrud.SimpleJdbc;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.util.BeansUtil;
@Controller
public class TongjiController extends SimpleController {

	
	@Override
	@RequestMapping("/admin/tongjimanager.do")
	public void mapping(HttpServletRequest req, HttpServletResponse resp) {
		
          mappingMethod(req,resp);
	}
	
	private void xiaoshouTongji() {

		SimpleJdbc  jdbc=BeansUtil.getSimpleJdbcBean();
		String begdate = request.getParameter("begindate");
		String enddate = request.getParameter("enddate");
		String spno = request.getParameter("spno");
		String sql="select ddi.spid,ddi.spname,sum(shuliang) totalcount,sum(jiage) totalfee from dingdan d ,dingdanitems ddi where ddi.ddno=d.ddno   ";
		if (begdate != null)

			sql += MessageFormat.format(" and d.xiadantime>=''{0}'' ", begdate);

		if (enddate != null)
			sql += MessageFormat.format(" and xiadantime<=''{0}''  ", enddate);

		sql+="  group by  ddi.spno,ddi.spname  order by totalcount desc ";
		
		System.out.println("dtTongjiSQL="+sql);
		DataTable dt=null;
		try {
			dt = jdbc.query(sql,null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(dt!=null)
			request.setAttribute("dtTongji", dt);
		
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/xiaoshoutongji.jsp";
		}
		forward(forwardurl);

	}   

}
