<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
     String  id=request.getParameter("id");
     QiugouService qiugouSrv=BeansUtil.getBean("qiugouService",  QiugouService.class);
    if( id!=null){
	    Qiugou temobjqiugou=qiugouSrv.load(" where id="+ id);
	      request.setAttribute("qiugou",temobjqiugou);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>求购信息信息查看</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 求购信息管理
		</div>
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">	
			       <!-----开始---->
			               <table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">标题:</td>
			<td>${requestScope.qiugou.title}</td>
			<td colspan="2" rowspan="6"><img id="imgTupian" width="200px" height="200px"
				src="${pageContext.request.contextPath}${requestScope.qiugou.tupian}" /></td>
		</tr>
		<tr>
			<td width="10%" align="right">发布人:</td>
			<td>${requestScope.qiugou.pubren}</td>
		</tr>
		<tr>
			<td align="right">发布时间:</td>
			<td><fmt:formatDate value="${requestScope.qiugou.pubtime}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td width="10%" align="right">价格要求:</td>
			<td>${requestScope.qiugou.jiage}元</td>
		</tr>
		
		<tr>
			<td width="10%" align="right">类别名称:</td>
			<td>${requestScope.qiugou.typename}</td>
		</tr>
		<tr>
			<td width="10%" align="right">新旧程度:</td>
			<td>${requestScope.qiugou.xinjiu}</td>
		</tr>
		<tr>
			<td width="10%" align="right">所在地:</td>
			<td>${requestScope.qiugou.szdi}</td>
		
			<td width="10%" align="right">浏览次数:</td>
			<td>${requestScope.qiugou.clickcount}次</td>
		</tr>
		<tr>
			<td width="10%" align="right">联系电话:</td>
			<td>${requestScope.qiugou.mobile}</td>
		</tr>
		
		<tr>
			<td width="10%" align="right">品牌:</td>
			<td>${requestScope.qiugou.brandname}</td>
		
			<td width="10%" align="right">型号:</td>
			<td>${requestScope.qiugou.xinghao}</td>
		</tr>
		
		<tr>
			<td align="right">供应信息:</td>
			<td colspan="3">${requestScope.qiugou.des}</td>
		</tr>
	</table>
			        <!-----结束---->
			</div>
	     </div>
	</div>
</body>
</html>
