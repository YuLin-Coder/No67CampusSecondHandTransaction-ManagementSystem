<%@ include file="import.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ include file="huiyuan/law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/web2table.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>


    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    
            $(function(){
              
            	
            })
    
    
    </script>
    
    
    
   

    

</head>
<body>



    <div class="wrap round-block">
        <div class="line-title">
            当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 系统注册结果
        </div>

        <div class="result-guide-box">
            <div class="content clearfix">
                <div class="icon-area">
                    <i class="fa fa-check-circle"></i>
                </div>
                <div class="text-area">
                    <strong>下单成功！</strong>
                    <a href="${pageContext.request.contextPath}/admin/dingdanmanager.do?actiontype=get&xdren=${sessoinScope.huiyuan.accountname }&forwardurl=/e/huiyuan/shopingorder.jsp">付款</a>
                </div>
            </div>
        </div>

    </div>





    <div class="fn-clear"></div>



</body>
</html>