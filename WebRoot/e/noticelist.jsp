
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>系统公告</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>

<%
     NoticeService  noticeSrv=BeansUtil.getBean("noticeService", NoticeService.class);

     List<Notice>  noticelist=noticeSrv.getEntity(" order by pubtime desc");
     if(noticelist!=null)
    	 request.setAttribute("listNotice", noticelist);
%>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="fn-clear"></div>
		<div  class="wrap round-block">
		
		
		<div style="min-height:600px;" class="simple-grid-list">
		
		   <div class="title">系统公告</div>
		   
		   <ul>
		      <c:forEach items="${listNotice}"  var="temnotice">
			      <li>
					<a  href="${pageContext.request.contextPath}/e/noticeinfo.jsp?id=${temnotice.id}">${temnotice.title}<span class="date"><fmt:formatDate value="${temnotice.pubtime }" pattern="yyyy-MM-dd"/></span></a>
				   </li>
			   </c:forEach>
		   </ul>
		   
		   
		</div>
		
	  </div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
