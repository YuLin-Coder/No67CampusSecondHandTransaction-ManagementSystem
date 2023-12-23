<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>安全中心</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>  
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>

   <script type="text/javascript">
       
        $(function ()
        {
            $.metadata.setType("attr","validate");
            $("#secquestionForm").validate();
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
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 安全中心管理
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<form name="secquestionform" method="post"
					action="${pageContext.request.contextPath}/admin/secquestionmanager.do"
					id="secquestionForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="actiontype" value="${actiontype}" />
						<input type="hidden" name="seedid" value="${seedid}" />
						<input name="accountname"  validate="{required:true,messages:{required:'请输入账号'}}" value="${huiyuan.accountname}" class="input-txt" type="hidden" />
						<input type="hidden" name="errorurl"
							value="/e/huiyuan/secquestionadd.jsp" />
						<input type="hidden" name="forwardurl"
							value="/admin/secquestionmanager.do?actiontype=get&accountname=${huiyuan.accountname}&forwardurl=/e/huiyuan/secquestionmanager.jsp" />
						<tr>
							<td colspan="4">${errormsg}</td>
						</tr>
						<tr>
							<td align="right">问题:</td>
							<td><web:dropdownlist name="title" id="title"
									cssclass="dropdown" value="${requestScope.secquestion.title}"
									datasource="${title_datasource}" textfieldname="title"
									valuefieldname="title">
								</web:dropdownlist>
							</td>
						</tr>
						<tr>
							<td align="right">答案:</td>
							<td><input name="answer" placeholder="答案"
								validate="{required:true,messages:{required:'请输入答案'}}"
								value="${requestScope.secquestion.answer}" class="input-txt"
								type="text" id="txtAnswer" /></td>
						</tr>

						<tr>
							<td colspan="4">
								
									<button class="btn btn-default">
										<i class="icon-ok icon-white"></i>提交
									</button>
								
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
