<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  include file="import.jsp"%>
<%
           QiugouService qiugouSrv=BeansUtil.getBean("qiugouService",QiugouService.class);
            String id=request.getParameter("id");
            if(id!=null){
                Qiugou qiugou=qiugouSrv.load("where id="+id);
                if(qiugou!=null){
                   request.setAttribute("qiugou",qiugou);
                   qiugou.setClickcount(qiugou.getClickcount()+1);
                   qiugouSrv.update(qiugou);
                }
            }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>求购信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="commentresurl"
		value="/e/qiugouinfo.jsp?id=<%=id%>" />
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; <a
				href="${pageContext.request.contextPath}/e/qiugoulist.jsp">求购信息</a>
		</div>
		<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian" src="${pageContext.request.contextPath}${requestScope.qiugou.tupian}" />
				
			</div>
			<div class="text-box">
				<div class="title">${requestScope.qiugou.title}</div>
				<div class="sub-title"></div>
				<div>
					<ul>
						<li><strong>发布人:</strong> ${requestScope.qiugou.pubren}</li>
						<li><strong>发布时间:</strong><fmt:formatDate value="${requestScope.qiugou.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/></li>
						<li><strong>价格要求:</strong> ${requestScope.qiugou.jiage}元</li>
						<li><strong>新旧程度:</strong> ${requestScope.qiugou.xinjiu}</li>
						<li><strong>所在地:</strong> ${requestScope.qiugou.szdi}</li>

						<li><strong>联系电话:</strong> ${requestScope.qiugou.mobile}</li>

						<li><strong>类别名称:</strong> ${requestScope.qiugou.typename}
						</li>
						<li><strong>品牌:</strong> ${requestScope.qiugou.brandname}</li>
						<li><strong>型号:</strong> ${requestScope.qiugou.xinghao}</li>
					</ul>
				</div>
				<div></div>
			</div>
		</div>
		<!--end text-box-->
	</div>
	<!--end show details-->
	<div class="wrap info">
		<div class="brief-title">介绍</div>
		<div class="brief-content">${requestScope.qiugou.des}</div>
		<jsp:include page="comment.jsp">
			<jsp:param value="qiugou" name="commenttype" />
		</jsp:include>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
