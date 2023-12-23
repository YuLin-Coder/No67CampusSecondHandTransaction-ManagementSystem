<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>订单信息</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   
    <link href="${pageContext.request.contextPath}/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			    	var ids = $(".check[type=checkbox]:checked").serialize();
					 if($(".check:checked").length<1)
				        {
				           $.dialog.alert("请选择需要删除条目");
				           return;
				        } 
					if(!confirm("你确定要删除吗")){
						return;
					}
					$.ajax({
			             url: "${pageContext.request.contextPath}/admin/dingdanmanager.do?actiontype=delete",
			                     method: 'post',
			                     data: ids,
			                     success: function (data) {
			                          window.location.reload();
			                     },
			                     error: function (XMLHttpRequest, textStatus, errorThrown) {
			                         alert(XMLHttpRequest.status + errorThrown);
			                     }
			                 });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>订单管理</h2>
		<div class="description"></div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/dingdanmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>订单号 <input name="ddno" value="${ddno}" class="input-txt"
							type="text" id="ddno" /> <input type="hidden" name="actiontype"
							value="search" /> <input type="hidden" name="seedid"
							value="${seedid}" />
							<div class="ui-button">
								<input type="submit" value="搜索" id="btnSearch"
									class="ui-button-text" />
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">

		<span id="btnCheckAll" class="orange-href">选择 </span> 
		<span
			id="btnDelete" class="orange-href">删除 </span>

	</div>
	<table id="module" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>

				<th><b>订单号</b></th>
				<th><b>下单时间</b></th>
				<th><b>下单人</b></th>
				<th><b>总价格</b></th>
				<th><b>状态</b></th>
				<th><b>联系人电话</b></th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>


			<%
					   
					       if(request.getAttribute("listdingdan")!=null){
					    	
					        List<Dingdan> listdingdan=(List<Dingdan>)request.getAttribute("listdingdan");
					        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					        
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
				<td>&nbsp<input id="chk<%=temdingdan.getId()%>" class="check"
					name="ids" type="checkbox"
					value='<%=temdingdan.getId()%>'/></td>
				<td><%=temdingdan.getDdno() %></td>
				<td><%=sdf.format(temdingdan.getXiadantime()) %></td>
				<td><%=temdingdan.getXiadanren() %></td>
				<td><%=temdingdan.getTotalprice() %></td>
				<td>
				    <%if(temdingdan.getState()==1){ %>
				                     等待审核
				    
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
								    if(temdingdan.getState()==2){
								  %> 
				   <a class="orange-href"
					href="${pageContext.request.contextPath}/admin/fahuo.jsp?id=<%=temdingdan.getId()%>">发货</a>
					<%} %> 
					
					<a class="orange-href"
					href="${pageContext.request.contextPath}/admin/dingdandetails.jsp?id=<%=temdingdan.getId()%>">查看</a>
				</td>
			</tr>


			<%}
					        
					       
					       
					       } %>




		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
