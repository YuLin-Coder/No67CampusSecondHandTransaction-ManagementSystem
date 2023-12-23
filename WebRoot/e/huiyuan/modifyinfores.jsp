<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单信息查看</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/e/css/box.all.css"
	type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
<script
	src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery-validation/jquery.metadata.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery-validation/messages_cn.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
<script type="text/javascript">
	$(function() {
	});
</script>
</head>
<body style="padding:10px">
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 系统提示
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<div style="margin-top:80px;font-size:26px; margin-left:80px;">
					<i class="fa fa-check"></i> 账户信息修改成功
				</div>

			</div>
		</div>
		</div>
</body>
</html>
