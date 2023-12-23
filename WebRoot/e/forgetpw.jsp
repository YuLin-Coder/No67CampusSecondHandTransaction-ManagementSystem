
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; 忘记密码
		</div>
	
		<div style="min-height:600px;" class="whitebox">

			<h1>忘记密码</h1>
           <form name="form1" id="form1" method="post" action="${pageContext.request.contextPath}/admin/huiyuanmanager.do">
			<input type="hidden" name="actiontype" value="forgetPw" />
			<input type="hidden" name="forwardurl" value="/e/forgetpwnext.jsp" />
			<input type="hidden" name="errorurl" value="/e/forgetpw.jsp" />
			<div class="reg-box">

				<div class="reg-title">
					${errormsg}
					
				</div>
				<div class="reg-content">
					

					<dl>
						<dt>账号:</dt>
						<dd>
							<input type="text"  value="${accountname}" validate="{required:true,messages:{required:'请输入账号'}}" class="input width250" id="txtAccountname"
								name="accountname"> 

						</dd>

					</dl>

				
					<dl>
						<dt></dt>
						<dd>
							<input type="submit" class="btn btn-default" id="btnNext"
								value="下一步" name="btnNext">
						</dd>

					</dl>

                
				</div>


			</div>
          </form>

		</div>
		

	</div>

	<div class="fn-clear"></div>



</body>
</html>