<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="import.jsp" %>
<%
     String spname=request.getParameter("spname");
     ShangpinService shangpinSrv=BeansUtil.getBean("shangpinService", ShangpinService.class);
     if(spname!=null){
    	 request.setAttribute("spname", spname);
    	 List<Shangpin> listShangpin=shangpinSrv.getEntity("where name like '%"+spname+"%'");
    	 if(listShangpin!=null)
    		 request.setAttribute("listShangpin", listShangpin);
     }
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品搜索</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

<link href="${pageContext.request.contextPath}/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
	$(function() {

		
	});
</script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>


	<div class="fn-clear"></div>
	<div class="wrap round-block"  style="min-height:400px;padding:15px;">

			

				
				 <div  class="picture-list">
		   
		     <div class="title">
		          ${spname}
		     </div>
		     <ul>
		       <c:forEach var="shangpin" items="${listShangpin}">
		        <li>
		           
		           <a href="${pageContext.request.contextPath}/e/shangpininfo.jsp?id=${shangpin.id}" class="item">
		             <c:if test="${shangpin.tuijian==1}">
			              <div class="tag">
			                 <span>推荐</span>
			              </div>
		              </c:if>
		              <c:if test="${shangpin.zuixin==1}">
			              <div class="tag">
			                 <span>最新</span>
			              </div>
		              </c:if>
		               <c:if test="${shangpin.hot==1}">
			              <div class="tag">
			                 <span>热卖</span>
			              </div>
		              </c:if>
		              <div class="img">
		                 <img src="${pageContext.request.contextPath }${shangpin.tupian}" />
		              </div>
		               
		               <div class="name">${shangpin.name}</div>
		               <div class="price">¥ ${shangpin.hyjia}</div>
		               <div class="discount"><fmt:formatNumber type="number" value="${shangpin.hyjia/shangpin.jiage}" maxFractionDigits="2" />折</div>
		           </a>
		           
		        </li>
		        </c:forEach>
		     </ul>
		     
		   </div>
		   <c:if test="${listShangpin== null || fn:length(listShangpin) == 0}">
		       <div style="font-size:26px;padding-left:200px;padding-top:150px;color:red;font-weight:600;">
		                           没有找到相关商品信息
		       </div>
		       
		    </c:if>
			
			
		</div>
    


		<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>