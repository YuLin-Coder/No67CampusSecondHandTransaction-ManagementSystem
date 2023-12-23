<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
	String  id=request.getParameter("id");
    DingdanService dingdanSrv=BeansUtil.getBean("dingdanService", DingdanService.class);
    DingdanitemsService dditemsSrv=BeansUtil.getBean("dingdanitemsService", DingdanitemsService.class);
    Dingdan temobjdingdan=null;
    if( id!=null){
      
      temobjdingdan=dingdanSrv.load(" where id="+ id);
      request.setAttribute("dingdan",temobjdingdan);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>订单信息查看</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/e/css/box.all.css"
	type="text/css"></link>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js"></script>

<script type="text/javascript">
	$(function() {
		$(".payment_list li").click(function(){
			
			$(".payment_list li").removeClass("active");
			$(this).addClass("active");
			
		});
		
	});
</script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; 在线付款
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				 <form name="payform" method="post" action="${pageContext.request.contextPath}/admin/dingdanmanager.do">
				 
						      <input type="hidden" name="actiontype" value="payfor"/>
						      
						      <input type="hidden" name="accountname" value="${huiyuan.accountname}"/>
						      <input type="hidden" name="errorurl" value="/e/huiyuan/fukuan.jsp?id=<%=id%>"/>
						      <input type="hidden" name="forwardurl" value="/e/huiyuan/fukuanresult.jsp"/>
						      <input type="hidden" name="ddid" value="<%=id%>"/>
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">

                  
					<tr>
						<td align="right">订单号:</td>
						<td>${requestScope.dingdan.ddno}</td>

						<td align="right">下单时间:</td>
						<td>
						    <fmt:formatDate value="${requestScope.dingdan.xiadantime}" pattern="yyyy-MM-dd hh:mm:ss"/>
						</td>
					</tr>
					<tr>
						<td align="right">下单人:</td>
						<td>${requestScope.dingdan.xiadanren}</td>

						
					</tr>
				
					<tr>
						<td align="right">收货人电话:</td>
						<td>${requestScope.dingdan.shrtel}</td>

						<td align="right">收货人姓名:</td>
						<td>${requestScope.dingdan.shrname}</td>
					</tr>
						<tr>
						<td align="right">状态:</td>
						<td>等待付款</td>


						
					</tr>

					<tr>
						<td colspan="4">

							<table border="0" cellspacing="1" class="whitegrid"
								cellpadding="0" width="100%">

								<tr>
									<td>快照</td>
									<td width="300">商品名</td>
									<td>商品数量</td>
									<td>商品价格</td>
								</tr>

								<%
									List<Dingdanitems> listdingdanitems = dditemsSrv.getEntity( "where ddno='" + temobjdingdan.getDdno()+ "'");

												for (Dingdanitems items : listdingdanitems) {
								%>
								<tr>

									<td bgcolor="#ffffff"><img src='${pageContext.request.contextPath}/<%=items.getSpimage()%>'
										width="60px" height="60px" />
									</td>
									<td width="300px;"><%=items.getSpname()%></td>

									<td><%=items.getShuliang()%>份</td>

									<td><%=items.getJiage()%>元</td>
									
								</tr>

								<%
									}
								%>
							</table>
						</td>
					</tr>
					
					<tr>
						<td colspan="4">
						
						
						   支付金额:${requestScope.dingdan.totalprice}元
						  
						
						</td>
						
					</tr>

					
				   <tr>
								<td align="right">支付密码 :</td>
								<td colspan="3" align="left">
								<input name="paypwd" value="${paypwd}" validate="{required:true,messages:{required:'请输入支付密码'}}" type="password"
									 class="input-txt" />${errormsg}</td>
								
							</tr>

					<tr>
						<td colspan="4">
						       <button class="btn btn-primary">
						          <i class="fa fa-check"></i>确定付款
						       </button>
						
						</td>
						
					</tr>
                   

				</table>
				</form>
			</div>
		</div>
		</div>
</body>
</html>
