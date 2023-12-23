
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>

<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户添加</title>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/menu.css" rel="stylesheet" type="text/css" />
    
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>
    
    
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
	    
    
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css"
			rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js"
			type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/green.css" rel="stylesheet" type="text/css" />

    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css"
			type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   
	<script type="text/javascript">
        function initControl(){
	  //开始绑定
                    //结束绑定
                      $("#txtCreatetime").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
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
                                 $("#hidXiangpian").val("${pageContext.request.contextPath}/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgxiangpiansrc="${requestScope.users.xiangpian}";
			          
				       if(imgxiangpiansrc==""){
				         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
				         
				         $("#imgXiangpian").attr("src",url);
				         $("#hidXiangpian").val(url);
				       }else
				       {
				          $("#imgXiangpian").attr("src",imgxiangpiansrc);
				          $("#hidXiangpian").val(imgxiangpiansrc); 
				       }
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#usersForm").validate();
                   
        });  
    </script>
    
</head>
<body>

           <div class="search-title">
                <h2>
                                                新建后台用户管理
                </h2>
                <div class="description">
                    
                </div>
            </div>
            
           	<form name="usersform" method="post"
					action="${pageContext.request.contextPath}/admin/usersmanager.do"
					id="usersForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="actiontype" value="${actiontype}" />
						<tr>
							<td width="15%" align="right">
								用户名:
							</td>
							<td width="35%">
								<input name="username"  validate="{required:true,messages:{required:'请输入用户名'}}" value="${requestScope.users.username}"
									class="input-txt" type="text" id="txtUsername" />
							</td>
							<td width="50%" colspan="2" rowspan="6">
							   <img id="imgXiangpian" width="200px" height="200px"
									src="${requestScope.users.xiangpian}" />
								<div>
									<input type="file" name="upload" id="btnulXiangpian" />
								</div>
								<input type="hidden" id="hidXiangpian" name="xiangpian"
									value="${requestScope.users.xiangpian}" />
							</td>
						</tr>
						<tr>
							<td align="right">
								密码:
							</td>
							<td>
								<input name="password" validate="{required:true,messages:{required:'请输入密码'}}" value="${requestScope.users.password}"
									class="input-txt" type="password" id="txtPassword" />
							</td>
						</tr>
						
						<tr>
							<td align="right">
								创建人:
							</td>
							<td>
								<input name="creator" validate="{required:true,messages:{required:'请输入创建人'}}"  value="${requestScope.users.creator}"
									class="input-txt" type="text" id="txtCreator" />
							</td>
						</tr>
						
						<tr>
							<td align="right">
								绑定邮箱:
							</td>
							<td>
								<input name="email" validate="{required:true,messages:{required:'请输入邮箱',email:'输入有效邮箱'}}"  value="${requestScope.users.email}"
									class="input-txt" type="text" id="txtEmail" />
							</td>
						</tr>
						<tr>
							<td align="right">
								电话:
							</td>
							<td>
								<input name="tel" value="${requestScope.users.tel}"
									class="input-txt" type="text" id="txtTel" />
							</td>
						</tr>
					
						<tr>
							<td align="right">
								真名:
							</td>
							<td>
								<input name="realname" value="${requestScope.users.realname}"
									class="input-txt" type="text" id="txtRealname" />
							</td>
						</tr>
						<tr>
							<td align="right">
								昵称:
							</td>
							<td>
								<input name="nickname" value="${requestScope.users.nickname}"
									class="input-txt" type="text" id="txtNickname" />
							</td>
						
							<td align="right">
								性别:
							</td>
							<td>
								<input name="sex" type="radio"  checked="checked" value="男" />男
								<input name="sex" type="radio"  value="女"  />女
							</td>
						</tr>
						
					</table>
					<div class="ui-button">
					  <input type="submit" value="提交" id="Button1" class="ui-button-text" />
					</div>
					
				</form>
     
  

</body>
</html>