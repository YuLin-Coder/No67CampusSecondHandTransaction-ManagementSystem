
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/register.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>



<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"
	type="text/javascript"></script>

<script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
 <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
 <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
 <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
 <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
<script type="text/javascript">
		 $(function (){
		           
		            $.metadata.setType("attr","validate");
		            $("#form1").validate();
		 });  
 </script>
</head>
<style type="text/css">
 
     .dropdown{width:260px;}

</style>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; 忘记密码
		</div>
		
		<c:if test="${empty secquestion_datasource==null||fn:length(secquestion_datasource)==0}">
		   
		       <div class="reg-box">
                <div class="reg-title">
                 
                </div>
                <div style="min-height:600px;" class="msg-tip">
                    <div class="ico error">
                    </div>
                    <div class="text">
                        <strong>你没有设置密保问题,不能设置找回密码！</strong>
                        <a href="${pageContext.request.contextPath}/admin/secquestionmanager.do?actiontype=load&forwardurl=/e/huiyuan/secquestionadd.jsp">设置密保问题</a>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
		    
		   
		</c:if>
		
	  <c:if test="${!empty secquestion_datasource==null||fn:length(secquestion_datasource)>0}">
		
		<div class="whitebox">

			<h1>忘记密码</h1>
           <form name="form1" id="form1" method="post" action="${pageContext.request.contextPath}/admin/huiyuanmanager.do">
			<input type="hidden" name="actiontype" value="resetPw" />
			<input type="hidden" name="forwardurl" value="/e/forgetpwresult.jsp" />
			<input type="hidden" name="errorurl" value="/e/forgetpwnext.jsp" />
			<div class="reg-box">
               
				<div class="reg-title">
					${errormsg}
					
				</div>
				<div class="reg-content">
					
					<dl>
					   <dt>账号:</dt>
					   <dd>${accountname}
					       <input type="hidden" name="accountname" value="${accountname}"/>
					   </dd>
					</dl>
					<dl>
						<dt>安全问题:</dt>
						<dd>
							
                         <web:dropdownlist name="sectitle" id="sectitle"
						    cssclass="dropdown" 
						    datasource="${secquestion_datasource}" textfieldname="title"
						    valuefieldname="title">
					     </web:dropdownlist>
						</dd>

					</dl>

					<dl>
						<dt>答案:</dt>
						<dd>
							<input type="text" validate="{required:true,messages:{required:'请输入密保答案'}}" class="input width250" 
								name="secanswer"> 

						</dd>

					</dl>
                    <dl>
						<dt>新密码:</dt>
						<dd>
							<input type="password" validate="{required:true,messages:{required:'请输入密码'}}" class="input width250" id="txtPassword"
								name="password"> 

						</dd>

					</dl>

					<dl>
						<dt>再次输入新密码:</dt>
						<dd>
						<input type="password" validate="{required:true,equalTo:'#txtPassword',messages:{required:'请再次输入密码',equalTo:'两次密码不一致'}}" class="input width250" id="txtPassword2"
								name="password2"> 

						</dd>

					</dl>
				
					<dl>
						<dt></dt>
						<dd>
							<input type="submit" class="btn btn-default" id="btnReigster"
								value="重置密码" name="btnReigster">
						</dd>

					</dl>

                
				</div>


			</div>
          </form>

		</div>
		</c:if>

	</div>

	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>