<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
<%
        SitenavService snSrv=BeansUtil.getBean("sitenavService", SitenavService.class);

%>
<body >
			<div class="search-title">
				<h2>首页导航选择向导</h2>
				<div class="description">
					
				</div>
			</div>
			<div class="clear"></div>
			<table id="lanmu" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				
				<tbody>
					<c:if test="${listlanmu== null || fn:length(listlanmu) == 0}">
						<tr>
							<td colspan="20">没有资讯类信息</td>
						</tr>
					</c:if>
					      <%	
								    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
							 		if(request.getAttribute("listlanmu")!=null)
								      {
									  List<Lanmu> listlanmu=( List<Lanmu>)request.getAttribute("listlanmu");
								     for(Lanmu  temlanmu  :   listlanmu)
								      {
							%>
						<tr data-tt-id='<%=temlanmu.getId() %>' parentid="<%=temlanmu.getParentid()%>">
							<td style="text-align:left;width:10%;">
							    <span class='<%=temlanmu.getIsleaf()==1?"file":"folder" %>'> 
								
										<%=temlanmu.getTitle()%>
								</span>
										
							  </td>
							  <td style="text-align:left;">
							  <%
							     boolean isexist=snSrv.isExist(MessageFormat.format("where title=''{0}'' ",temlanmu.getTitle()));  
							     if(!isexist){
							    	
							  %>
							        <form name="sitenavform" method="post"
										action="${pageContext.request.contextPath}/admin/sitenavmanager.do">
										
									<input type="hidden" name="actiontype" value="save" />
									
									<input type="hidden" name="title" value="<%=temlanmu.getTitle() %>" />
									<input type="hidden" name="errorurl" value="/admin/sncolumnguide.jsp" />
									<input type="hidden" name="sindex" value="1" />
									
									<input type="hidden" name="href" value="/e/lanmuinfo.jsp?lanmuid=<%=temlanmu.getId()%>"/>
									<input type="hidden" name="forwardurl"
										value="/admin/sitenavmanager.do?actiontype=get&forwardurl=/admin/sitenavmanager.jsp" />
										<button class="orange-href"><img src="images/add.gif">加入导航</button>
							         
								   
								   </form>
							       
							  <%}else{%>
							              已加入
							  <%} %>
							         
							
							
		                     </td>
						</tr>
					    <%}}%>
				</tbody>
			</table>
</body>
</html>
