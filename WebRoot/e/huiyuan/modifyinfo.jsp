
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="law.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"
	type="text/javascript"></script>
 <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>

    <script type="text/javascript">
     
          $(function(){
        	  
        	  var init=function(){
        		  $('#btnulTouxiang').uploadify({  
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
		                     $("#imgTouxiang").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
                             $("#hidTouxiang").val("/upload/temp/"+file.name);
		                  }
		             }); 
		          var imgtouxiangsrc="${sessionScope.huiyuan.touxiang}";
			       if(imgtouxiangsrc==""){
			         var url="${pageContext.request.contextPath}/upload/touxiang.jpg";
			         $("#imgTouxiang").attr("src",url);
			         $("#hidTouxiang").val("/upload/touxiang.jpg");
			       }else
			       {
			          $("#imgTouxiang").attr("src","${pageContext.request.contextPath}"+imgtouxiangsrc);
			          $("#hidTouxiang").val(imgtouxiangsrc); 
			       }  
        	  };
        	  $.metadata.setType("attr","validate");
              $("#huiyuanForm").validate();
              init();
          
          });
          
          
    
    </script>



</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/accountinfo.jsp">首页</a> &gt;&gt;修改账户信息
		</div>
	

		<div class="main">

			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
               <div >
				<form name="huiyuanform" method="post"
					action="${pageContext.request.contextPath}/admin/huiyuanmanager.do"
					id="huiyuanForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${requestScope.huiyuan.id}" />
						<input type="hidden" name="actiontype" value="update" />
						<input type="hidden" name="forwardurl" value="/e/huiyuan/modifyinfores.jsp" />
						<tr>
							<td align="right">用户名:</td>
							<td>${requestScope.huiyuan.accountname}<input name="accountname"
								value="${requestScope.huiyuan.accountname}" class="input-txt"
								type="hidden" id="txtAccountname" /></td>
						    <td  rowspan="6" colspan="7">
						         <img id="imgTouxiang" width="200px" height="200px"  src="${pageContext.request.contextPath}${requestScope.huiyuan.touxiang}"/>
								<div>
									<input type="file" name="upload" id="btnulTouxiang" />
								</div>
								<input type="hidden" id="hidTouxiang" name="touxiang" value="${requestScope.huiyuan.touxiang}" />
							</td>
						</tr>
						
						<tr>
							<td align="right">姓名:</td>
							<td>
							
							<input name="name" validate="{required:true,messages:{required:'请输入名称'}}" value="${requestScope.huiyuan.name}"
								class="input-txt" type="text"  /></td>
						</tr>
						<tr>
							<td align="right">身份证号:</td>
							<td>
							
							<input name="idcardno"  value="${requestScope.huiyuan.idcardno}"
								class="input-txt" type="text"  /></td>
						</tr>
						<tr>
							<td align="right">昵称:</td>
							<td><input name="nickname"
								value="${requestScope.huiyuan.nickname}" validate="{required:true,messages:{required:'请输入昵称'}}" class="input-txt"
								type="text" id="txtNickname" /></td>
						</tr>
						
								
						<tr>
							<td align="right">邮箱:</td>
							<td><input name="email"
								value="${requestScope.huiyuan.email}" validate="{required:true,email:true,messages:{required:'请输入邮箱'}}" class="input-txt"
								type="text" id="txtEmail" /></td>
						</tr>
						
						
						<tr>
							<td align="right">性别:</td>
							<td>
							      <input  type="radio"  name="sex" id="radSex"  value="男"  checked="checked" >男
							      <input type="radio"  name="sex" id="radSex"  value="女" >女
							</td>
						</tr>
						<tr>
							<td align="right">地址:</td>
							<td><input name="address"
								value="${requestScope.huiyuan.address}" class="input-txt"
								type="text" id="txtAddress" /></td>
						
							<td align="right">移动电话:</td>
							<td><input name="mobile"
								value="${requestScope.huiyuan.mobile}" validate="{required:true,mobile:true,messages:{required:'请输入名称'}}" class="input-txt"
								type="text" id="txtMobile" /></td>
						</tr>
						
						
					
					</table>
					<div style="margin-left: 120px;">
						<input type="submit" value="提交" id="Button1"
							class="btn btn-default" />
					</div>
				</form>
              </div>
			</div>
		</div>

	</div>



	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>