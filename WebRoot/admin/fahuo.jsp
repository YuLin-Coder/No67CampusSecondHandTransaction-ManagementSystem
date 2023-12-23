<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
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
<title>在线发货</title>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>  
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
        <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <script type="text/javascript">
            $(function (){
               
                $.metadata.setType("attr","validate");
                $("#payform").validate();
            });
    </script>
</head>
<body>
	<div class="search-title">
		<h2>在线发货</h2>
		<div class="description"></div>
	</div>
	<form name="payform" id="payform" method="post"
		action="${pageContext.request.contextPath}/admin/dingdanmanager.do">


		<input type="hidden" name="actiontype" value="fahuo" /> <input
			type="hidden" name="fahuoren" value="${adminuser.username}" /> <input
			type="hidden" name="forwardurl" value="/admin/fahuoresult.jsp" /> <input
			type="hidden" name="ddid" value="<%=id%>" />
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">

			<tr>
				<td align="right">订单号:</td>
				<td>${requestScope.dingdan.ddno}</td>

				<td align="right">下单时间:</td>
				<td><fmt:formatDate value="${requestScope.dingdan.xiadantime}"
						pattern="yyyy-MM-dd hh:mm:ss" /></td>
			</tr>
			<tr>
				<td align="right">下单人:</td>
				<td>${requestScope.dingdan.xiadanren}</td>

				<td align="right">总价格:</td>
				<td>${requestScope.dingdan.totalprice}元
				    
				</td>
			</tr>
			<tr>
				<td align="right">状态:</td>
				<td>待发货</td>


				<td align="right">收货地址:</td>
				<td>${requestScope.dingdan.shraddress}</td>
			</tr>
			<tr>
				<td align="right">联系人电话:</td>
				<td>${requestScope.dingdan.shrtel}</td>

				<td align="right">联系人姓名:</td>
				<td>${requestScope.dingdan.shrname}</td>
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

							<td bgcolor="#ffffff"><img src='${pageContext.request.contextPath}<%=items.getSpimage()%>'
								width="60px" height="60px" /></td>
							<td><%=items.getSpname()%></td>

							<td><%=items.getShuliang()%>份</td>

							<td><%=items.getJiage()%>元
							   
							</td>
						</tr>

						<%
						}
					%>
					</table>

				</td>
			</tr>
			<tr>
				<td>物流公司:</td>
				<td> <select name="wltype" class="dropdown">
		                 <option>顺风物流</option>
		                 <option>申通物流</option>
		                 <option>邮政</option>
		             </select>
		         </td>
				<td>物流订单号:</td>
				<td><input name="wlorderno" class="input-txt" type="text"
					validate="{required:true,messages:{required:'请输入物流订单号'}}" /></td>
			</tr>
			<tr>
				<td colspan="4"><span> <input type="submit"
						class="orange-button" value="发货登记" />
				</span></td>

			</tr>


		</table>

	</form>
</body>
</html>
