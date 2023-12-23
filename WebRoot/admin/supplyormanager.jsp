<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>供应商信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           top.$.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             top.$.dialog.confirm("你确定要注销供应商信息?", function(){
				             window.location.href=encodeURI('${pageContext.request.contextPath}/admin/supplyormanager.do?forwardurl=/admin/supplyormanager.jsp&actiontype=delete&id='+id);
				         });
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
		<h2>供应商管理</h2>
		<div class="description">
			<a
				href="${pageContext.request.contextPath}/admin/supplyormanager.do?actiontype=load">新建供应商</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/supplyormanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>名称 <input name="name" value="${name}" class="input-txt"
							type="text" id="name" /> <input type="hidden" name="actiontype"
							value="search" /> <input type="hidden" name="seedid"
							value="${seedid}" /> <input type="hidden" name="forwardurl"
							value="/admin/supplyormanager.jsp" />
							<div class="ui-button">
								<button class="ui-button-text">搜索</button>
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
		<span id="btnCheckAll" class="orange-href">选择</span> <span
			id="btnDelete" class="orange-href">删除</span>

	</div>
	<table id="supplyor" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>名称</b></th>
				<th><b>电话</b></th>
				<th><b>邮箱</b></th>
				<th><b>地址</b></th>
				<th><b>联系人</b></th>
				<th><b>传真</b></th>

				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listsupplyor== null || fn:length(listsupplyor) == 0}">
				<tr>
					<td colspan="20">没有相关供应商信息</td>
				</tr>
			</c:if>
			<%	
 									if(request.getAttribute("listsupplyor")!=null)
								      {
									  List<Supplyor> listsupplyor=( List<Supplyor>)request.getAttribute("listsupplyor");
								     for(Supplyor  temsupplyor  :  listsupplyor)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temsupplyor.getId()%>" class="check"
					name="chk<%=temsupplyor.getId()%>" type="checkbox"
					value='<%=temsupplyor.getId()%>'></td>
				<td><%=temsupplyor.getName()%></td>
				<td><%=temsupplyor.getTel()%></td>
				<td><%=temsupplyor.getEmail()%></td>
				<td><%=temsupplyor.getAddress()%></td>
				<td><%=temsupplyor.getLxren()%></td>
				<td><%=temsupplyor.getFax()%></td>

				<td><a class="orange-href"
					href="${pageContext.request.contextPath}/admin/supplyormanager.do?actiontype=load&id=<%=temsupplyor.getId()%>&forwardurl=/admin/supplyoradd.jsp">修改</a> 
					
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
