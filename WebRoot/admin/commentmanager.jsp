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
		<title>评论信息</title>
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
			             $.dialog.confirm("你确定要注销评论信息?", function(){
				             window.location.href=encodeURI('${pageContext.request.contextPath}/admin/commentmanager.do?actiontype=delete&id='+id);
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
<body>
	
			<div class="search-title">
				<h2>评论管理</h2>
				<div class="description"></div>
			</div>
			<!-- 搜索控件开始 -->
			<div class="search-options">
				<form id="searchForm"
					action="${pageContext.request.contextPath}/admin/commentmanager.do"
					method="post">
					<table class="grid" cellspacing="1" width="100%">
						<tbody>
							<tr>
								<td>评论人 <input name="commentren" value="${commentren}"
									class="input-txt" type="text" id="commentren" /> <input
									type="hidden" name="actiontype" value="search" /> <input
									type="hidden" name="seedid" value="${menuid}" />
									
										<input type="submit" value="搜索" id="btnSearch"
											class="orange-button" />
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<!-- 搜索控件结束 -->
			<div class="clear"></div>
			<div class="action-details">
				<span id="btnCheckAll" class="orange-href">选择</span>
		         <span id="btnDelete" class="orange-href">删除</span>

			</div>
			<table id="module" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				<thead>
					<tr>
						<th>选择</th>
						
						<th><b>评论时间</b>
						</th>
						<th><b>评论人</b>
						</th>
						<th><b>内容</b>
						</th>
						<th><b>评论类型</b>
						</th>
						
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${listcomment== null || fn:length(listcomment) == 0}">
						<tr>
							<td colspan="20">没有相关评论信息</td>
						</tr>
					</c:if>
					<c:forEach var="temcomment" items="${listcomment}">
						<tr>
							<td>&nbsp<input id="chk${temcomment.id}" class="check"
								name="chk${temcomment.id}" type="checkbox"
								value='${temcomment.id}'>
							</td>
							
							<td><fmt:formatDate value="${temcomment.commenttime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
							<td>${temcomment.commentren}</td>
							<td>${temcomment.commentcontent}</td>
							<td>${temcomment.xtype}</td>
						
							<td><a class="orange-href"
								href="commentdetails.jsp?id=${temcomment.id}&seedid=303">查看</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clear"></div>
			<daowen:pager id="pager1" attcheform="searchForm" />
		
</body>
</html>
