<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
 
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<%
     UsersService userSrv=BeansUtil.getBean("usersService", UsersService.class);
     Users users= (Users)request.getSession().getAttribute("users");
	 if(users!=null)
	 {
	     Users temusers   =userSrv.load("where id="+((Users)users).getId());
	     request.setAttribute("users",temusers);
	 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>后台用户</title>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
   <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
  <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    
   <script type="text/javascript">
        function initControl(){

			           $('#btnulXiangpian').uploadify({  
			                'formData': { 'folder': '${pageContext.request.contextPath}/Upload' },  
			                'buttonText': '选择图片',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '${pageContext.request.contextPath}/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",
			                'auto':true, 
			                'removeTimeout':0,
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                'uploader': '${pageContext.request.contextPath}/admin/uploadmanager.do',
			                 'fileSizelimit':'2048KB',
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){
			                     $("#filelist").show();
			                     $("#imgXiangpian").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
                                 $("#hidXiangpian").val("/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgxiangpiansrc="${requestScope.users.xiangpian}";
				       if(imgxiangpiansrc==""){
				         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
				         $("#imgXiangpian").attr("src",url);
				         $("#hidXiangpian").val("/upload/nopic.jpg");
				       }else
				       {
				          $("#imgXiangpian").attr("src","${pageContext.request.contextPath}"+imgxiangpiansrc);
				          $("#hidXiangpian").val(imgxiangpiansrc); 
				       }
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#teacherForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>账户信息管理</h2>
		<div class="description">修改帐户信息</div>
	</div>
	<form name="usersform" method="post"
		action="${pageContext.request.contextPath}/admin/usersmanager.do"
		id="usersForm">
		<input type="hidden" name="actiontype" value="update" /> <input
			type="hidden" name="id" value="${requestScope.users.id}" /> <input
			type="hidden" name="forwardurl"
			value="/admin/accountinfo.jsp?seedid=101" />
		<table border="0" cellspacing="1" class="grid" cellpadding="0"
			width="100%">
			<tr>
				<td height="30" align="right">用户名:</td>
				<td>${requestScope.users.username}<input name="username"
					value="${requestScope.users.username}" class="input-txt"
					type="hidden" id="txtUsername"
					validate="{required:true,messages:{required:'请输入用户名'}}" /></td>
					
				<td  colspan="2" rowspan="4"><img id="imgXiangpian" width="200px" height="200px"
					src="${requestScope.users.xiangpian}" />
					<div>
						<input type="file" name="upload" id="btnulXiangpian" />
					</div> <input type="hidden" id="hidXiangpian" name="xiangpian"
					value="${requestScope.users.xiangpian}" /></td>
			</tr>
			
			
			<tr>
				<td height="30" align="right">邮箱 :</td>
				<td><input name="email" value="${requestScope.users.email}"
					class="input-txt" type="text" id="txtEmail"
					validate="{required:true,messages:{required:'请输入邮箱 '}}" /></td>
			</tr>
			
		
			<tr>
				<td height="30" align="right">昵称:</td>
				<td><input name="nickname"
					value="${requestScope.users.nickname}" class="input-txt"
					type="text" id="txtNickname"
					validate="{required:true,messages:{required:'请输入昵称'}}" /></td>
			</tr>
			<tr>
				<td height="30" align="right">姓名:</td>
				<td><input name="realname"
					value="${requestScope.users.realname}" class="input-txt"
					type="text" id="txtRealname"
					validate="{required:true,messages:{required:'请输入姓名'}}" /></td>
			</tr>
			<tr>
				<td height="30" align="right">性别 :</td>
				<td><select name="sex" id="ddlSex">
						<option value="男">男</option>
						<option value="女">女</option>
				</select></td>
			</tr>
			
			<tr>
				<td height="30" align="right">电话号码:</td>
				<td><input name="tel" value="${requestScope.users.tel}"
					class="input-txt" type="text" id="txtTel"
					validate="{required:true,messages:{required:'请输入电话号码'}}" /></td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="ui-button">
						<button class="ui-button-text">
							<i class="icon-ok icon-white"></i>提交
						</button>
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
