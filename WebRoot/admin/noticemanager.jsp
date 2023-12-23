<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>公告信息</title>
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
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             $.dialog.confirm("你确定要注销公告信息?", function(){
				             window.location.href=encodeURI('${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=delete&id='+id);
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
			    });
			});
       </script>
	</head>
	  <body >

	<div class="search-title">
		<h2>公告管理</h2>
		<div class="description">
			<a
				href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=load&seedid=207">新建公告</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/noticemanager.do"
			method="post">
			<table class="grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>公告标题 <input name="title" value="${title}"
							class="input-txt" type="text" id="title" /> <input
							type="hidden" name="actiontype" value="search" /> <input
							type="hidden" name="seedid" value="${seedid}" />
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
	<div class="action-details">
				 <span id="btnCheckAll" class="orange-href">选择</span>
				
				 <span id="btnDelete" class="orange-href" >删除</span>
				
			</div>
	<table id="module" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>标题</b>
				</th>
				<th><b>发布人</b>
				</th>
				<th><b>发布时间</b>
				</th>
				<th><b>点击次数</b>
				</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listnotice== null || fn:length(listnotice) == 0}">
				<tr>
					<td colspan="20">没有相关公告信息</td>
				</tr>
			</c:if>
			<c:forEach var="temnotice" items="${listnotice}">
				<tr>
					<td>&nbsp<input id="chk${temnotice.id}" class="check"
						name="chk${temnotice.id}" type="checkbox" value='${temnotice.id}'>
					</td>
					<td>${temnotice.title}</td>
					<td>${temnotice.pubren}</td>
					<td><fmt:formatDate value="${temnotice.pubtime}" pattern="yyyy-MM-dd" /></td>
					<td>${temnotice.clickcount}</td>
					<td><a class="orange-href"
						href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=load&id=${temnotice.id}&seedid=207">修改</a>
						<a class="orange-href"
						href="${pageContext.request.contextPath}/e/noticeinfo.jsp?id=${temnotice.id}"  target="_blank">查看</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />

</body>
</html>
