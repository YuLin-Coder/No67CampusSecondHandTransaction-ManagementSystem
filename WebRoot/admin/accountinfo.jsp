<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
     UsersService userSrv=BeansUtil.getBean("usersService", UsersService.class);
     Users users= (Users)request.getSession().getAttribute("users");
	 if(users!=null)
	 {
	     Users temusers   =userSrv.load("where id="+((Users)users).getId());
	    request.setAttribute("users",temusers);
	 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>后台用户信息</title>
	<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/layout.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看账户信息</h2>
		<div class="description"></div>
	</div>
	<table border="0" cellspacing="1" class="grid" cellpadding="0"
		width="100%">
		<tr>
			<td align="right" width="10%" class="title">用户名:</td>
			<td>${requestScope.users.username}</td>
			<td colspan="2" rowspan="6"><img src="${pageContext.request.contextPath}${requestScope.users.xiangpian}" width="200"
				height="200" />
			</td>
		</tr>
	
		<tr>
			<td align="right" class="title">创建时间:</td>
			<td>
			   <fmt:formatDate value="${requestScope.users.createtime}" pattern="yyyy-MM-dd hh:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td align="right" width="10%" class="title">邮箱 :</td>
			<td>${requestScope.users.email}</td>
		</tr>
		<tr>
			<td align="right" width="10%" class="title">创建人:</td>
			<td>${requestScope.users.creator}</td>
		</tr>
		<tr>
			<td align="right" width="10%" class="title">登陆次数:</td>
			<td>${requestScope.users.logtimes}</td>
		</tr>
		<tr>
			<td align="right" width="10%" class="title">昵称:</td>
			<td>${requestScope.users.nickname}</td>
		</tr>
		<tr>
			<td align="right" width="10%" class="title">姓名:</td>
			<td>${requestScope.users.realname}</td>
		
			<td align="right" class="title">性别 :</td>
			<td>${requestScope.users.sex}</td>
		</tr>
	
		<tr>
			<td align="right" width="10%" class="title">电话号码:</td>
			<td colspan="3">${requestScope.users.tel}</td>
		</tr>
	</table>
</body>
</html>
