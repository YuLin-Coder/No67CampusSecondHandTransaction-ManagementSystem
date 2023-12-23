package com.daowen.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Users;
import com.daowen.service.UsersService;
import com.daowen.ssm.simplecrud.SimpleController;


@Controller
public class AdminUserController extends SimpleController {

	@Autowired
	private UsersService usersService;

	@Override
	@RequestMapping("/admin/login.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		super.mappingMethod(request, response);

	}
	public void login() {
		String usertype = request.getParameter("usertype");
		String validcode = (String) request.getSession().getAttribute(
				"validcode");
		String inputvalidcode = request.getParameter("validcode");
		if (validcode != null && !validcode.equals(inputvalidcode)) {
			System.out.println("系统验证错误");
			request.setAttribute("errmsg",
					"<img src=\"images/error.gif\"/>系统验证码错误");

			// 分发请求参数
			dispatchParams(request, response);
			forward("/admin/login.jsp");
			return;
		}
		System.out.println("验证码=" + validcode);
		if (usertype != null && usertype.equals("0")) {
			adminLogin();
		}
	}

	private void adminLogin() {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Users u = (Users) usersService.load(" where username='" + username
				+ "' and password='" + password + "'");
		if (u == null) {
			dispatchParams(request, response);
			request.setAttribute("errmsg",
					"<img src=\"images/error.gif\"/>用户与密码不匹配");
			System.out.println("系统用户登录失败");
			forward("/admin/login.jsp");
		}
		HttpSession session = request.getSession();
		u.setLogtimes(u.getLogtimes() + 1);
		usersService.update(u);
		session.setAttribute("users", u);
		redirect("/admin/index.jsp");

	}

}
