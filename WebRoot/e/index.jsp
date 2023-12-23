<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE HTML>
<%
    NoticeService noticeSrv=BeansUtil.getBean("noticeService", NoticeService.class);
    ShangpinService shangpinSrv=BeansUtil.getBean("shangpinService", ShangpinService.class);
    List<Notice> listNotice=noticeSrv.getTopEntity("order by id desc",10);
    if(listNotice!=null)
    	request.setAttribute("listNotice", listNotice);
   
    List<Shangpin> listHotshangpin=shangpinSrv.getEntity("where hot=1");
    if(listHotshangpin!=null)
    	request.setAttribute("listHotshangpin", listHotshangpin);
    ShangpinBuilder spBuilder=new ShangpinBuilder(request);
    

%>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/e/css/carousel.css" />
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/e/js/carousel.js'></script>

    <script type="text/javascript">
        $(function () {
            $(".index-sp-nav").css("display","block");
        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
     <%=new FocusgraphicBuilder(request).buildFullScreen()%>
	
	<div class="clearfix"></div>
	
	<div class="wrap round-block">
	   <div class="fn-left" style="width:960px;">
	   <div class="jagged-panel">
	      <div class="title">
	                        爆款推荐
	      </div>
	      <div class="content">
	      
	        <c:forEach items="${requestScope.listHotshangpin}" var="temshangpin">
	        
	        
	        
	         <div class="image-item">
	             <a href="${pageContext.request.contextPath}/e/shangpininfo.jsp?id=${temshangpin.id}">
	                 <img src="${pageContext.request.contextPath}${temshangpin.tupian }" >
	             </a>
	             <div class="price">
	                <span class="pull-left">
	                   ¥${temshangpin.hyjia}
	                </span>
	                <span class="pull-right">
	                                            会员价
	                </span>
	             </div>
	             <div class="name-des">
	                    ${temshangpin.name }
	             </div>
	             
	         </div>
	         
	         </c:forEach>
	      </div>
	   </div>
	   </div>
	   <div class="fnright" style="width:292px;">
	       <div class="jagged-panel">
	           <div class="title">
	                                 系统公告
	           </div>
	           <div class="content">
	              <ul>
	                 <c:forEach var="notice" items="${requestScope.listNotice}">
	                      <li>
	                        <a href="${pageContext.request.contextPath}/e/noticeinfo.jsp?id=${notice.id}">${notice.title }</a>
	                       
	                      </li>
	                 </c:forEach>
	                 
	              </ul>
	           </div>
	       </div>   
	   
	   </div>
	   
	</div>

	
    <div class="wrap round-block">
     
        <div style="width:960px;margin:0px 10px 30px;background:#fff;" class="fn-left">
           
            <%=new IndexcolumnsBuilder(request).buildColumns() %>
             <div class="clearfix"></div>
			
		
        </div>
        <div style="width:210px;background:#fff;" class="fn-left">
            <%=spBuilder.buildHotSidebar("最新上架", 10) %>
            <%=spBuilder.buildHotSidebar("销售排行", 10) %>
        </div>
	   
        
		
	 
	</div>
	
		
	<div class="fn-clear"></div>
	
   
	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>