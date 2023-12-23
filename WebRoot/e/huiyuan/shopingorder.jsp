<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>订单信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
			    
			});
       </script>
	</head>
	  <body >
		 <jsp:include page="head.jsp"></jsp:include>
		 
		 
		 <div class="fn-clear"></div>
		 <div  class="wrap round-block">
			<div class="line-title">
				  当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; <a href="dingdanmanager.jsp">订单管理</a>
			</div>
    	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				
				<!-- 搜索控件开始 -->
				<div class="search-options">
					<form id="searchForm"
						action="${pageContext.request.contextPath}/admin/dingdanmanager.do"
						method="post">
						<table class="grid" cellspacing="1" width="100%">
							<tbody>
								<tr>
									<td>订单号 <input name="ddno" value="${ddno}"
										class="input-txt" type="text" id="ddno" /> 
										<input type="hidden" name="actiontype" value="search" /> 
										<input type="hidden" name="xiadanren" value="${huiyuan.accountname}" />
										<input type="hidden" name="forwardurl" value="/e/huiyuan/shopingorder.jsp" />
										<div class="ui-button">
											<input type="submit" value="搜索" id="btnSearch"
												class="ui-button-text" />
										</div></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!-- 搜索控件结束 -->
				<div class="clear"></div>
			
				<table id="module" width="100%" border="0" cellspacing="0"
					cellpadding="0" class="ui-record-table">
					<thead>
						<tr>
							
							<th><b>订单号</b>
							</th>
							<th><b>下单时间</b>
							</th>
							<th><b>所属商户</b>
							</th>
							<th><b>总价格</b>
							</th>
							
							<th><b>状态</b>
							</th>

							<th><b>电话</b>
							</th>
							
							
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					   <%
					   
					    SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					       if(request.getAttribute("listdingdan")!=null){
					    	
					        List<Dingdan> listdingdan=(List<Dingdan>)request.getAttribute("listdingdan");
					     
					        
					        if(listdingdan.size()==0){
					        	
					 %>
					 
					 <tr>
								<td colspan="20">没有相关订单信息</td>
					 </tr>
					 
					 <%
					        	
					        	
					        }
					        
					        
					        for(Dingdan temdingdan :listdingdan){
					        
					   
					   %>
					
					
						
							<tr>
							
								<td><%=temdingdan.getDdno() %></td>
								<td><%=sdf.format(temdingdan.getXiadantime()) %></td>
								<td><%=temdingdan.getShaccount() %></td>
								<td><%=temdingdan.getTotalprice() %>元</td>
								
								<td>
						 		
								 <%if(temdingdan.getState()==1){ %>
				                       等待付款
				    
				    <%} %>
				     <%if(temdingdan.getState()==2){ %>
				                       已付款
				    <%} %>
				     <%if(temdingdan.getState()==3){ %>
				                      已发货
				    <%} %>
				    <%if(temdingdan.getState()==4){ %>
				                     已签收
				    <%} %>
				     <%if(temdingdan.getState()==5){ %>
				                      已取消
				    <%} %>
				    
								</td>

								<td><%=temdingdan.getShrtel() %></td>
								
								<td>
								
								  <%
								    if(temdingdan.getState()==1){
								  %>
								  <a class="orange-href" href="${pageContext.request.contextPath}/e/huiyuan/cancelorder.jsp?id=<%=temdingdan.getId()%>">取消</a>
								   <a class="orange-href" href="${pageContext.request.contextPath}/e/huiyuan/fukuan.jsp?id=<%=temdingdan.getId()%>">付款</a>
								  <%} %>
								  
								   <%
								    if(temdingdan.getState()==3){
								  %>
								  
								   <a class="orange-href"  href="${pageContext.request.contextPath}/e/huiyuan/qianshou.jsp?id=<%=temdingdan.getId()%>">签收</a>
								  <%} %>
								 
								    <a class="orange-href"  href="${pageContext.request.contextPath}/e/huiyuan/dingdandetails.jsp?id=<%=temdingdan.getId()%>">查看</a>
								</td>
							</tr>
						
						
						<%}} %>
						
					   
							
						
					</tbody>
				</table>
				<div class="clear"></div>
				<daowen:pager id="pager1" attcheform="searchForm" />
			</div>
		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
	</body>
</html>
