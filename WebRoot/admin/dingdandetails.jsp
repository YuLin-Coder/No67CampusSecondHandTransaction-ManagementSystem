<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
	String id = request.getParameter("id");
    DingdanService dingdanSrv=BeansUtil.getBean("dingdanService", DingdanService.class);
    DingdanitemsService dditemsSrv=BeansUtil.getBean("dingdanitemsService", DingdanitemsService.class);
	Dingdan temobjdingdan=null;
	if (id != null) {
		
	    temobjdingdan =dingdanSrv.load(" where id=" + id);
		request.setAttribute("dingdan", temobjdingdan);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单信息查看</title>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/layout.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/menu.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
</head>
<body>
	<div class="search-title">
		<h2>订单管理-> 查看订单</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">

		<tr>
			<td align="right">订单号:</td>
			<td>${requestScope.dingdan.ddno}</td>

			<td align="right">下单时间:</td>
			<td><fmt:formatDate value="${requestScope.dingdan.xiadantime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		</tr>
		<tr>
			<td align="right">下单人:</td>
			<td>${requestScope.dingdan.xiadanren}</td>

			<td align="right">总价格:</td>
			<td>${requestScope.dingdan.totalprice}</td>
		</tr>
		<tr>
			<td align="right">状态:</td>
			<td>
			    <c:if test="${dingdan.state==1}">
			                     等待审核
			    </c:if>
			    <c:if test="${dingdan.state==2}">
			                       等待发货
			    </c:if>
			    
			     <c:if test="${dingdan.state==3}">
			                      已发货
			    </c:if>
			     <c:if test="${dingdan.state==4}">
			                 已确定
			    </c:if>
			     <c:if test="${dingdan.state==5}">
			                      已取消
			    </c:if> 
			   

			</td>


			<td align="right">收货地址:</td>
			<td>${requestScope.dingdan.shraddress}</td>
		</tr>
		
		<c:if test="${dingdan.state==3||dingdan.state==4}">
			<tr>
				
	
				<td align="right">订单号:</td>
				<td>${requestScope.dingdan.wlorderno}</td>
			</tr>
		</c:if>
		
		<tr>
			<td align="right">联系人电话:</td>
			<td>${requestScope.dingdan.shrtel}-${requestScope.dingdan.shrname}</td>

			
		</tr>

		<tr>
			<td colspan="4">

				<table border="0" cellspacing="1" class="whitegrid" cellpadding="0"
					width="100%">

					<tr>
						<td>快照</td>
						<td>商品名</td>
						<td>商品数量</td>
						<td>商品价格</td>
					</tr>

					<%
						List<Dingdanitems> listdingdanitems = dditemsSrv.getEntity("where ddno='" + temobjdingdan.getDdno()
										+ "'");

						for (Dingdanitems items : listdingdanitems) {
					%>
					<tr>

						<td ><img src='${pageContext.request.contextPath}<%=items.getSpimage()%>'
							width="60px" height="60px" /></td>
						<td><%=items.getSpname()%></td>

						<td><%=items.getShuliang()%></td>

						<td><%=items.getJiage()%>元</td>
					</tr>

					<%
						}
					%>
				</table></td>
		</tr>

		
	</table>
</body>
</html>
