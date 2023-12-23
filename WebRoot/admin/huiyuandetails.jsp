<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
   
    if( id!=null)
    {
      HuiyuanService hySrv=BeansUtil.getBean("huiyuanService", HuiyuanService.class);
      Huiyuan temobjhuiyuan=hySrv.load("where id="+ id);
      request.setAttribute("huiyuan",temobjhuiyuan);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>会员信息查看</title>
   	 <link href="${pageContext.request.contextPath}/admin/css/common.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
</head>
<body >

	<div class="search-title">
		<h2>会员信息</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td align="right" class="title">用户名:</td>
			<td>
				${requestScope.huiyuan.accountname}(${requestScope.huiyuan.nickname})
			</td>
			<td colspan="2" rowspan="7"><img id="imgTouxiang" width="200px"
				height="200px" src="${requestScope.huiyuan.touxiang}" /></td>
		</tr>

		

		<tr>
			<td align="right" class="title">注册时间:</td>
			<td>${requestScope.huiyuan.regdate}</td>
		</tr>
		<tr>
			<td align="right" class="title">登录次数:</td>
			<td>${requestScope.huiyuan.logtimes}</td>
		</tr>

		<tr>
			<td align="right" class="title">邮箱:</td>
			<td>${requestScope.huiyuan.email}</td>
		</tr>
		<tr>
			<td align="right" class="title">移动电话:</td>
			<td>${requestScope.huiyuan.mobile}</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td align="right" class="title">地址:</td>
			<td>${requestScope.huiyuan.address}</td>
		</tr>
		<tr>
			

			<td align="right" class="title">姓名:</td>
			<td>${requestScope.huiyuan.name}</td>
		</tr>
	
	</table>
</body>
</html>
