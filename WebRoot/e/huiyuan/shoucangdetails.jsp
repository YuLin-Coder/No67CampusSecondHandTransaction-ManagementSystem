<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    ShoucangService scSrv=BeansUtil.getBean("shoucangService", ShoucangService.class);
    if( id!=null)
    {
      Shoucang temobjshoucang=scSrv.load(" where id="+ id);
      request.setAttribute("shoucang",temobjshoucang);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>收藏夹信息查看</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/register.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 收藏夹管理
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<!-----开始---->
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					<tr>
						<td width="10%" align="right">书编号:</td>
						<td>${requestScope.shoucang.bookid}</td>
					</tr>
					<tr>
						<td width="10%" align="right">书名称:</td>
						<td>${requestScope.shoucang.bookname}</td>
					</tr>
					<tr>
						<td width="10%" align="right">图片:</td>
						<td>${requestScope.shoucang.tupian}</td>
					</tr>
					<tr>
						<td width="10%" align="right">收藏人:</td>
						<td>${requestScope.shoucang.scren}</td>
					</tr>
					<tr>
						<td align="right">收藏时间:</td>
						<td><fmt:formatDate value="${requestScope.shoucang.sctime}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</table>
				<!-----结束---->
			</div>
		</div>
	</div>
</body>
</html>
