
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="import.jsp" %> 
 <script type="text/javascript">
  
    $(function(){
      
      $(".exit").click(function(){
          
    	  
            var pageurl_pagescope= $("#pageurl_pagescope").val();
            
            $.ajax({
		                     
		              url:encodeURI('${pageContext.request.contextPath}/admin/huiyuanmanager.do?actiontype=exit'),
					   method:'get',
					   success:function(){
					      window.location.reload();
					  },
					  error:function(xmhttprequest,status,excetpion){
					     $.alert("系统错误，错误编码"+status);
					  }
		     })

      });
      
      $("#searchForm").submit(function(){
    		 var temtitle= $("#title").val();
    		  if(temtitle==""){
    			  
    			  alert("请输入搜索信息");
    			  return false;
    		  }
    		  
    		  
    	  });
      
      $(".main-nav .menus li a").removeClass("current");
	      var headid='<%=request.getParameter("headid")%>';
	      if (headid != '') {
	           
	     	 $("#"+headid).addClass("current");
	 	 }
    
    })

</script>
 
<%
      Huiyuan temhy=(Huiyuan)request.getSession().getAttribute("huiyuan");
      if(temhy!=null)
         request.setAttribute("huiyuan", temhy);
      
      String spname=request.getParameter("spname");
      if(spname!=null)
    	  request.setAttribute("spname", spname);
      
     
   
     

 %>

<div class="tab-header">

  <div class="wrap">
			<div class="pull-left">
				<div class="pull-left">
				 <c:if test="${sessionScope.huiyuan!=null}">
				       嗨，欢迎<a href="${pageContext.request.contextPath }/e/huiyuan/accountinfo.jsp">${sessionScope.huiyuan.accountname}</a>
				       <span class="exit">退出</span>
				  </c:if>
				</div>
				<a href="#">帮助中心</a>
			</div>
			<div class="pull-right">
			   <c:if test="${sessionScope.huiyuan==null }">
				<a href="${pageContext.request.contextPath}/e/login.jsp"><span class="cr">登录</span></a>
			   </c:if>
				<a href="${pageContext.request.contextPath}/e/register.jsp">注册</a>
				
			    <a href="${pageContext.request.contextPath}/e/shopcart.jsp">购物车</a>
			   
				<a href="${pageContext.request.contextPath}/admin/login.jsp">系统后台</a>
			</div>
		</div>

</div>

 
 
 

   
 <div class="wrap clearfix">
        <div style="font-size: 22px; color:#10aa9c; font-weight: bold; width:400px; line-height:30px; font-family:tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 15px 10px;" class="fn-left">
                      河洛大学城二手系统
        </div>
         <form id="searchForm"  action="${pageContext.request.contextPath}/e/searchsp.jsp" method="post" >
           <input   type="hidden" name="actiontype" value="search" />
           
        <div class="search-box">
            <div class="search-text">
            </div>
            <div class="keyword">
                <input type="text" placeholder="请输入商品名称" value="${spname }" id="title" name="spname">
            </div>
            <div class="so">
                <input type="submit" class="sobtn" id="btnSearch" value="搜索" name="btnSearch">
            </div>
            <div class="error-container">
                
            </div>
        </div>
        
        </form>
    </div>

 
 <div class="main-nav clearfix">
    <div class="wrap">
       <div class="all-product-cate">
         <div class="name">
                              所有产品分类
         </div>
         <div class="index-sp-nav">
            
             <%=new SpcategoryBuilder(request).BuildIndexMenu() %>
         </div>
       </div>
       <%=new SitenavBuilder(request).build() %>
    </div>
  
 </div>
 

  
     
  