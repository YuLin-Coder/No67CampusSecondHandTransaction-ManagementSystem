<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="law.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>系统首页</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" rel="stylesheet" />
   <link href="${pageContext.request.contextPath}/admin/css/layout.css" rel="stylesheet" />
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
  
</head>
<body>
     <jsp:include page="/admin/head.jsp"></jsp:include>
      <div class="viewframework-body">

        <div class="viewframework-sidebar">
           
             <jsp:include page="menu.jsp"></jsp:include>

        </div>




        <div class="viewframework-contentpage">


            <div id="page-loading" class="loading-mask">
                <div class="loading-icon"></div>
                <div class="loading-mask-body"></div>
            </div>

            <iframe   name="main"   width="100%" height="100%"  style="overflow:auto"  src="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get&seedid=101"  frameborder="0"></iframe>
     

        </div>


    </div>
    
    <script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.js"></script>
</body>
</html>