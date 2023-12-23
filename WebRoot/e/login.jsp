<%@page import="com.daowen.util.*"%>
<%@page import="com.daowen.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

    String forwardurl=request.getParameter("forwardurl");
    if(forwardurl!=null)
        request.setAttribute("forwardurl", forwardurl);
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>会员登录</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>

    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/login.css" type="text/css"></link>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/reset.css" type="text/css"></link>

    <script type="text/javascript">

        $(function(){
            $.metadata.setType("attr","validate");
            $("#form1").validate();
            var userType="${usertype}";

            if(userType!=""){

                $("[name=usertype][value="+userType+"]").prop("checked",true);
            }

        });

    </script>


</head>
<body>
<div class="login_header">
    <div class="header_center clearfix">
        <div class="myfl">
            <span>欢迎登录</span>
        </div>
        <div class="myfr">
            <a href="${pageContext.request.contextPath}/e/index.jsp">返回首页</a>
        </div>
    </div>
</div>
<div class="login_content clearfix">
    <form name="form1" id="form1" method="post" action="${pageContext.request.contextPath}/admin/huiyuanmanager.do">
        <input type="hidden" name="actiontype" value="login" />
        <input type="hidden"  name="errorurl" value="/e/login.jsp"/>

        <div class="login-box fn-right">
            <div class="title clearfix">
                 <span>用户登录</span>

            </div>
            <div class="content">
                <div class="table-row">
                    <input type="text" class="login-input" name="accountname" validate="{required:true,messages:{required:'请输入账户名'}}"  value="${accountname}" placeholder="用户名" id="username"/>

                </div>

                <div class="table-row">
                    <input type="password" class="login-input" placeholder="登录密码" validate="{required:true,messages:{required:'请输入密码'}}"  id="password" name="password" maxlength="16" value="${password }"/>

                </div>

              

                <input type="submit" value="立即登录" class="login-btn">
                <p class="entry_mode clearfix">
                    <a href="${pageContext.request.contextPath}/e/register.jsp" class="myfr">
                        <i>快速注册</i>
                    </a>
                     <a href="${pageContext.request.contextPath}/e/forgetpw.jsp" >
                        <i>忘记密码</i>
                    </a>
                    ${errormsg}
                </p>

            </div>


        </div>
    </form>
</div>
<div class="login_bottom">Copright &nbsp;&nbsp;河洛大学城二手系统 &nbsp;&nbsp;浙ICP17088888号-1 &nbsp;&nbsp;版权所有</div>
</body>
</html>