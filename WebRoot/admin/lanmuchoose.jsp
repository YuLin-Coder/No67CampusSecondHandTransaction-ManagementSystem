<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="law.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%
	    LanmuTree lms =BeansUtil.getBean("lanmuTree", LanmuTree.class);

		List listlanmu = lms.getTree(0);
	
		request.setAttribute("listlanmu", listlanmu);
%>
<head>
<title>栏目信息</title>
<link href="${pageContext.request.contextPath}/admin/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
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
<script type="text/javascript">
			
			function toDeleteAction(isleaf,id){
			   
			   
			   if(isleaf==1)
			       document.write(" <a lanmuid='"+id+"' class=\"btn-lanmu-delete action-button\" type='button' href=\"javascript:void\"><img src=\"images/del.gif\">删除栏目</a>");
		       else
		       
		           document.write(""); 
			  
			}
			$(function() {
			    
			    
			    $("#lanmu tr").each(function(){
			        if($(this).attr("parentid")!=0)
			          $(this).attr("data-tt-parent-id",$(this).attr("parentid"));
			        
			    })
			    $("#lanmu").treetable({ expandable: true }).treetable("expandAll");
			     
			    
			   
			});
       </script>
</head>
<body>
<div class="search-title">
				<h2>选择系统栏目</h2>
				
			</div>

			<div class="clear"></div>
			<div style="overflow:auto;height:330px;">
			
			
			<table id="lanmu" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				<thead>
					<tr>

						<th style="text-align:left;">栏目信息</th>


					</tr>
				</thead>
				<tbody>
					
					<c:if test="${listlanmu== null || fn:length(listlanmu) == 0}">
						<tr>
							<td colspan="20">没有栏目信息</td>
						</tr>
					</c:if>
					<c:forEach var="temlanmu" items="${listlanmu}">
						<tr data-tt-id='${temlanmu.id}' parentid="${temlanmu.parentid}">

							<td style="text-align:left;">
							<span class='${temlanmu.isleaf==1?"file":"folder"}'> 
							          <input type="radio"  name="radChoose"  bindtext='${temlanmu.title}' bindvalue='${temlanmu.id}' />
							       
										${temlanmu.title}
								    
								 </span>
							</td>



						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
</body>
</html>