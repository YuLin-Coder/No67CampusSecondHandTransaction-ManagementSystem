
<%@ include file="import.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
            String id=request.getParameter("id");
            NoticeService noticeSrv=BeansUtil.getBean("noticeService", NoticeService.class);
            if(id!=null){
            
                Notice n=noticeSrv.load(new Integer(id));
                
                if(n!=null)
                   request.setAttribute("notice",n);
                
            }
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<link rel="stylesheet" href="css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="css/leaveword.css" type="text/css"></link>

<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>



    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="wrap  round-block">
	  <div class="line-title">
                   当前位置：<a href="index.aspx">首页</a> &gt;&gt; <a>系统公告</a>
      </div>
	
	<input type="hidden" id="reUrl" name="reurl" value="/e/noticeinfo.jsp?id=<%=id%>"/>
	<input type="hidden" id="commentresurl" value="/e/noticeinfo.jsp?id=<%=id%>">

	<div class="fn-clear"></div>
	
	
		<div >
		 
		   <div style="min-height:600px;" class="info">
                    <h1>
                           ${notice.title}
                    </h1>
                    <h5>
                                                         来源: ${notice.pubren}
                                                        浏览:<span id="count">2次</span>
                                                         发布时间：<fmt:formatDate value="${notice.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/>
                    </h5>
                    <div class="news-content">
                        <p>
                            ${notice.dcontent}  
                        </p>
                        <div id="content_bot">
                        </div>
                        
                    </div>
                    
                    
                    
                    
                </div>
		   <jsp:include page="comment.jsp">
		       <jsp:param name="commenttype" value="notice"></jsp:param>
		   </jsp:include>
		</div>
		

	</div>
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>