<%@page import="com.daowen.entity.*"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="law.jsp"%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收货地址管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"
	type="text/javascript"></script>
 <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
	<script type="text/javascript">
			$(function() {
				 $(".remove").click(function(){
			    	
					 var id =$(this).data("id");
					
					if(!confirm("你确定要删除吗")){
						return;
					}
					$.ajax({
			                  url: "${pageContext.request.contextPath}/admin/receaddressmanager.do?actiontype=delete",
			                     method: 'post',
			                     data: {
			                    	 
			                    	'ids':id 
			                    	 
			                     },
			                     success: function (data) {
			                          window.location.reload();
			                     },
			                     error: function (XMLHttpRequest, textStatus, errorThrown) {
			                         alert(XMLHttpRequest.status + errorThrown);
			                     }
			                 });
			    });
			    
			});
       </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 收货地址
		</div>
	
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
		       
		           <div class="title-section">
		              <div class="strong">收货地址</div>
		              <div class="des">
		                  <i class="fa fa-plus"></i>
		                    <a href="${pageContext.request.contextPath}/admin/receaddressmanager.do?actiontype=load&seedid=104&forwardurl=/e/huiyuan/receaddressadd.jsp">添加地址</a>
		              </div>
		           </div>
				    <div class="address-list clearfix">
				      <c:forEach var="address"  items="${requestScope.listReceaddress}">
				           
				        <ul class="address-info">
				          <div class="add-title">
				            <a  href="${pageContext.request.contextPath}/admin/receaddressmanager.do?actiontype=load&seedid=104&id=${address.id}&forwardurl=/e/huiyuan/receaddressadd.jsp" class="edit">
				               <i class="fa fa-edit"></i>
				            </a>
				                   ${address.title }
				             <span data-id="${address.id}" class="remove">
				                <i class="fa fa-close"></i>
				             </span>           
				          </div><!-- end title -->
				          
				           <li>${address.shr}</li>
				           <li>${address.addinfo }</li>
				           <li>${address.mobile }</li>
				           <li>${address.postcode}</li>
				        </ul>
				         
				      
				          
				      </c:forEach>
				      
				        
					
				     </div>
		   </div>
			
		</div>
		

    </div>
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>


 
</body>
</html>