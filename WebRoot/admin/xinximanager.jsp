<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>资讯信息信息</title>
 
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />

    
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
<link
	href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js"
	type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/webui/combo/combo.js"
			type="text/javascript"></script>
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
				                 url: "${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=delete",
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
		$("#btnCheckAll").click(function() {
			var ischeck = false;
			$(".check").each(function() {
				if ($(this).is(":checked")) {
					$(this).prop("checked", "");
					ischeck = false;
				} else {
					$(this).prop("checked", "true");
					ischeck = true;
				}
			});
			if ($(this).text() == "选择记录")
				$(this).text("取消选择");
			else
				$(this).text("选择记录");
		})
	});
</script>
</head>
<body >
	<div class="search-title">
				<h2>新闻资讯管理</h2>
				<div class="description">
					<a href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=load&seedid=202">发布新闻资讯
					</a>
				</div>
			</div>
			<!-- 搜索控件开始 -->
			<div class="search-options">
				<form id="searchForm"
					action="${pageContext.request.contextPath}/admin/xinximanager.do"
					method="post">
					<table class="grid" cellspacing="1" width="100%">
						<tbody>
							<tr>
								<td>资讯标题 <input name="title" value="${title}"
									class="input-txt" type="text" id="title" /> 
									<input type="hidden" name="actiontype" value="search" />
									   新闻分类<span class="search-form-item-content">
					                            <a textfieldid="hidLanmuname" valuefieldid="hidLanmuid" window_width="800" window_height="400"
					                                window_title="系统栏目" url="${pageContext.request.contextPath}/admin/lanmuchoose.jsp" class="ui-open-trigger ui-select-middle-trigger"
					                                 style="width: 120px;">栏目名称 </a>
					                            <input name="lanmuid" validate="{required:true,messages:{required:'请选择栏目'}}" type="hidden" id="hidLanmuid" runat="server" value="${lanmuid}" />
					                            <input name="lanmuming" type="hidden" id="hidLanmuname" runat="server" value="${lanmuming}" />
					                   </span> 
									<input type="hidden" name="seedid" value="${seedid}" />
								
									<input type="submit" value="搜索" id="btnSearch" class="orange-button" />
									
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<!-- 搜索控件结束 -->
			<div class="clear"></div>
			<div class="action-details">
				
                <span id="btnCheckAll" class="orange-href">选择
				</span> 
				<span id="btnDelete" class="orange-href">删除
				</span>
				
			</div>
			<table id="module" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				<thead>
					<tr>
						<th>选择</th>
						<th style="width:260px;overflow:hidden;"><b>标题</b>
						</th>
						<th><b>发布人</b>
						</th>
						
						<th><b>发布时间</b>
						</th>
						<th><b>点击次数</b>
						</th>
					
						<th><b>所属栏目</b>
						</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${listxinxi== null || fn:length(listxinxi) == 0}">
						<tr>
							<td colspan="20">没有相关资讯信息信息</td>
						</tr>
					</c:if>
					<c:forEach var="temxinxi" items="${listxinxi}">
						<tr>
							<td>&nbsp<input id="chk${temxinxi.id}" class="check"
								name="ids" type="checkbox" value='${temxinxi.id}'>
							</td>
							<td>${temxinxi.title}</td>
							<td>${temxinxi.pubren}</td>
							
							<td><fmt:formatDate value="${temxinxi.pubtime}" pattern="yyyy-MM-dd"/></td>
							<td>${temxinxi.clickcount}</td>
							
							
							<td>${temxinxi.lanmuming}(${temxinxi.lanmuid})</td>
							<td><a class="orange-href"
								href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=load&id=${temxinxi.id}&seedid=202">修改</a>
								<a class="orange-href" target="_blank" href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=${temxinxi.id}">查看</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clear"></div>
			<daowen:pager id="pager1" attcheform="searchForm" />
		
	
</body>
</html>
