package com.daowen.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Users;
import com.daowen.service.UsersService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

@Controller
@Scope("prototype")
@Qualifier("value=usersController")
public class UsersController extends SimpleController{

    @Autowired
	private UsersService usersService;
	@RequestMapping("/admin/usersmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
	   this.mappingMethod(request, response);
	}
	
	public void modifyPw() {
		String password1 = request.getParameter("password1");
		String repassword1 = request.getParameter("repassword1");
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Users users = usersService.load(new Integer(id));
		if (users != null) {
			if (!users.getPassword().equals(password1)){
					request.setAttribute("errormsg",
							"<label class='error'>原始密码不正确，不能修改</label>");
					forward(forwardurl);
				
			} else {
				users.setPassword(repassword1);
				usersService.update(users);
				request.getSession().setAttribute("users", users);
				redirect(forwardurl);
			}
		}
	}
	
	public void save(){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String creator = request.getParameter("creator");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String realname = request.getParameter("realname");
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		SimpleDateFormat sdfusers = new SimpleDateFormat("yyyy-MM-dd");
		Users users = new Users();
		users.setUsername(username == null ? "" : username);
		users.setPassword(password == null ? "" : password);
		users.setCreator(creator == null ? "" : creator);
	    users.setCreatetime(new Date());
		users.setEmail(email == null ? "" : email);
		users.setTel(tel == null ? "" : tel);
		users.setLogtimes(0);
		users.setRealname(realname == null ? "" : realname);
		users.setNickname(nickname == null ? "" : nickname);
		users.setSex(sex == null ? "" : sex);
		users.setXiangpian(xiangpian == null ? "" : xiangpian);
		usersService.save(users);
		String forwardurl=request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/usersmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}
	
	public void update(){
		String id = request.getParameter("id");
		if (id == null)
			return;
		Users users = (Users) usersService.load(new Integer(id));
		if (users == null)
			return;
		String username = request.getParameter("username");
		String creator = request.getParameter("creator");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String realname = request.getParameter("realname");
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		SimpleDateFormat sdfusers = new SimpleDateFormat("yyyy-MM-dd");
		users.setUsername(username);
		users.setCreator(creator);
		users.setEmail(email);
		users.setTel(tel);
		users.setRealname(realname);
		users.setNickname(nickname);
		users.setSex(sex);
		users.setXiangpian(xiangpian);
		usersService.update(users);
		String  forwardurl=request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/usersmanager.do?actiontype=get";
		}
		redirect(forwardurl);
		
		
	}
	
	public void load(){
		String id = request.getParameter("id");
		String actiontype = "save";
		if (id != null) {
			Users users = (Users) usersService.load(new Integer(id));
			if (users != null) {
				request.setAttribute("users", users);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		String forwardurl=request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/usersadd.jsp";
		}
		forward(forwardurl);
	}
	public void delete() {
		String id = request.getParameter("id");
		usersService.delete(" where id=" + id);
		get();
	}
	public void get(){
		int pageindex = 1;
		int pagesize = 10;
		String filter="";
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
		
		List<Users> usersList=usersService.getPageEntitys(filter,pageindex,pagesize);
		int recordscount = usersService.getRecordCount(filter);
		request.setAttribute("usersList", usersList);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		try {
			request.getRequestDispatcher("/admin/usersmanager.jsp").forward(request,response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
