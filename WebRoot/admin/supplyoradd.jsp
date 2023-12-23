<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>供应商</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
	    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        
        $(function ()
        {
            $.metadata.setType("attr","validate");
            $("#supplyorForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>新建供应商</h2>
		<div class="description"></div>
	</div>
	<form name="supplyorform" method="post"
		action="${pageContext.request.contextPath}/admin/supplyormanager.do"
		id="supplyorForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/supplyoradd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/supplyormanager.do?actiontype=get&forwardurl=/admin/supplyormanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">名称:</td>
				<td><input name="name" placeholder="名称"
					validate="{required:true,messages:{required:'请输入名称'}}"
					value="${requestScope.supplyor.name}" class="input-txt" type="text"
					id="txtName" /></td>
			</tr>
			<tr>
				<td align="right">电话:</td>
				<td><input name="tel" placeholder="电话"
					validate="{required:true,messages:{required:'请输入电话'}}"
					value="${requestScope.supplyor.tel}" class="input-txt" type="text"
					id="txtTel" /></td>
			</tr>
			<tr>
				<td align="right">邮箱:</td>
				<td><input name="email" placeholder="邮箱"
					validate="{required:true,messages:{required:'请输入邮箱'}}"
					value="${requestScope.supplyor.email}" class="input-txt"
					type="text" id="txtEmail" /></td>
			</tr>
			<tr>
				<td align="right">地址:</td>
				<td><input name="address" placeholder="地址"
					validate="{required:true,messages:{required:'请输入地址'}}"
					value="${requestScope.supplyor.address}" class="input-txt"
					type="text" id="txtAddress" /></td>
			</tr>
			<tr>
				<td align="right">联系人:</td>
				<td><input name="lxren" placeholder="联系人"
					validate="{required:true,messages:{required:'请输入联系人'}}"
					value="${requestScope.supplyor.lxren}" class="input-txt"
					type="text" id="txtLxren" /></td>
			</tr>
			<tr>
				<td align="right">传真:</td>
				<td><input name="fax" placeholder="传真"
					validate="{required:true,messages:{required:'请输入传真'}}"
					value="${requestScope.supplyor.fax}" class="input-txt" type="text"
					id="txtFax" /></td>
			</tr>
			<tr>
				<td align="right">说明:</td>
				<td colspan="3"><textarea name="des" rows="4" id="txtDes"
						style="width:58%;height:100px;" validate="{required:true}">${requestScope.supplyor.des}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="ui-button">
						<button class="ui-button-text">
							<i class="icon-ok icon-white"></i>提交
						</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
