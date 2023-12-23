<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
     CaigouService caigouSrv=BeansUtil.getBean("caigouService",  CaigouService.class);
    if( id!=null)
    {
      Caigou temobjcaigou=caigouSrv.load(" where id="+ id);
      request.setAttribute("caigou",temobjcaigou);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>采购信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看采购</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">商品编号:</td>
			<td>${requestScope.caigou.spno}</td>
		</tr>
		<tr>
			<td width="10%" align="right">商品名称:</td>
			<td>${requestScope.caigou.spname}</td>
		</tr>
		<tr>
			<td width="10%" align="right">供应商:</td>
			<td>${requestScope.caigou.supplor}</td>
		</tr>
		<tr>
			<td width="10%" align="right">采购数量:</td>
			<td>${requestScope.caigou.count}${requestScope.caigou.danwei}</td>
		</tr>
		<tr>
			<td align="right">采购日期:</td>
			<td><fmt:formatDate value="${requestScope.caigou.cgdate}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td width="10%" align="right">采购人:</td>
			<td>${requestScope.caigou.cgren}</td>
		</tr>
		
	</table>
</body>
</html>
