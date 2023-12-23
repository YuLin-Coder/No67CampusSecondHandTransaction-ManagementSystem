<%@ page language="java"  pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>首页栏目向导</title>
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
<script type="text/javascript">
		
			$(function() {
			    $("#lanmu tr").each(function(){
			        if($(this).attr("parentid")!=0)
			          $(this).attr("data-tt-parent-id",$(this).attr("parentid"));
			    })
			    $("#lanmu").treetable({ expandable: true }).treetable("expandAll");
			    $(".btn-lanmu-delete").click(function(){
			             
			    	     
		                return confirm("你确定要加入该栏目");
		                 
		                 
			    });
			});
       </script>
</head>
<body >
			<div class="search-title">
				<h2>首页栏目选择向导</h2>
				<div class="description">
					
				</div>
			</div>
			<div class="clear"></div>
			<table id="lanmu" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				
				<tbody>
					<c:if test="${listspcategory== null || fn:length(listspcategory) == 0}">
						<tr>
							<td colspan="20">没有商品类别信息</td>
						</tr>
					</c:if>
					      <%	
								    SitenavService sitenavSrv=BeansUtil.getBean("sitenavService", SitenavService.class);  
									if(request.getAttribute("listspcategory")!=null)
								      {
									  List<Spcategory> listspcategory=( List<Spcategory>)request.getAttribute("listspcategory");
								     for(Spcategory  temspcategory  :   listspcategory)
								      {
							%>
						<tr data-tt-id='<%=temspcategory.getId() %>' parentid="<%=temspcategory.getParentid()%>">
							<td style="text-align:left;">
							    <span
								class='<%=temspcategory.getIsleaf()==1?"file":"folder" %>'> 
								<a
									title="<%=temspcategory.getMingcheng()%>"
									href="spcategorymanager.do?actiontype=load&seedid=203&id=<%=temspcategory.getId() %>&parentid=<%=temspcategory.getParentid() %>">
										<%=temspcategory.getMingcheng()%></a> 
								</span>
										
							  
							  <%
							     boolean isexist=sitenavSrv.isExist(MessageFormat.format("where title=''{0}''",temspcategory.getMingcheng()));  
							     if(!isexist){
							    	
							  %>
							      
							       <a lanmuid='<%=temspcategory.getId() %>' class="btn-lanmu-delete orange-href"  href="sitenavmanager.do?actiontype=saveBySpc&spcid=<%=temspcategory.getId() %>">
							         <img src="images/add.gif">加入导航
								   </a>
							  <%}else{%>
							              <span class="orange-href">已加入</span>
							  <%} %>
							         
							
							
		                     </td>
						</tr>
					    <%}}%>
				</tbody>
			</table>
</body>
</html>
