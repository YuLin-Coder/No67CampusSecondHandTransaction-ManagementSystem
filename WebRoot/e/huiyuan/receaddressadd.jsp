<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>收货地址</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
   <script type="text/javascript">
        
        $(function (){
           
            $.metadata.setType("attr","validate");
            $("#receaddressForm").validate();
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
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
			
			 <div class="title-section">
		              <div class="strong"><i class="fa fa-plus"></i>新建收货地址</div>
		              <div class="des">
		                  <i class="fa fa-list"></i>
		                    <a href="${pageContext.request.contextPath}/admin/receaddressmanager.do?actiontype=load&seedid=104&forwardurl=/e/huiyuan/receaddressmanager.jsp">我的地址</a>
		              </div>
		           </div>
				<form name="receaddressform" method="post"
					action="${pageContext.request.contextPath}/admin/receaddressmanager.do"
					id="receaddressForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="actiontype" value="${actiontype}" />
						<input type="hidden" name="seedid" value="${seedid}" />
						<input type="hidden" name="errorurl"
							value="/e/huiyuan/receaddressadd.jsp" />
						<input name="hyaccount" placeholder="会员"
								validate="{required:true,messages:{required:'请输入会员'}}"
								value="${sessionScope.huiyuan.accountname}" class="input-txt"
								type="hidden"/>
						<input type="hidden" name="forwardurl"
							value="/admin/receaddressmanager.do?actiontype=get&hyaccount=${sessionScope.huiyuan.accountname}&forwardurl=/e/huiyuan/receaddressmanager.jsp" />
						<tr>
							<td colspan="4">${errormsg}</td>
						</tr>
						
						<tr>
							<td align="right">收货人:</td>
							<td><input name="shr" placeholder="收货人"
								validate="{required:true,messages:{required:'请输入收货人'}}"
								value="${sessionScope.huiyuan.name}" class="input-txt"
								type="text" id="txtShr" /></td>
						
							<td align="right">电话:</td>
							<td><input name="mobile" placeholder="电话"
								validate="{required:true,mobile:true,messages:{required:'请输入电话',mobile:'请输入正确的电话号码'}}"
								value="${sessionScope.huiyuan.mobile}" class="input-txt"
								type="text" id="txtMobile" /></td>
						</tr>
						<tr>
							<td align="right">邮编:</td>
							<td><input name="postcode" placeholder="邮编"
								validate="{required:true,zipCode:true,messages:{required:'请输入邮编',zipCode:'请输入正确的邮政编码'}}"
								value="330013" class="input-txt"
								type="text" id="txtPostcode" /></td>
						
							<td align="right">地址:</td>
							<td><input name="addinfo" placeholder="地址"
								validate="{required:true,messages:{required:'请输入地址'}}"
								value="${requestScope.receaddress.addinfo}" class="input-txt"
								type="text" id="txtAddinfo" /></td>
						</tr>
						
						<tr>
							<td align="right">标题:</td>
							<td colspan="3"><input name="title" placeholder="标题"
								validate="{required:true,messages:{required:'请输入标题'}}"
								value="${requestScope.receaddress.title}" class="input-txt"
								type="text" id="txtTitle" /></td>
						</tr>
						
						<tr>
							<td colspan="4">
							   <div style="padding:10px 120px;">
								<button class="btn btn-primary">
									<i class="fa fa-check"></i>提交
								</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
           </div>
         </div>
</body>
</html>
