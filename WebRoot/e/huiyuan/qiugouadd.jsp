<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>求购信息</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
   <script type="text/javascript">
        function initControl(){
	
			           $('#btnulTupian').uploadify({  
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
			                     $("#imgTupian").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
                                 $("#hidTupian").val("/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgtupiansrc="${requestScope.qiugou.tupian}";
				       if(imgtupiansrc==""){
				         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
				         $("#imgTupian").attr("src",url);
				         $("#hidTupian").val("/upload/nopic.jpg");
				       }else
				       {
				          $("#imgTupian").attr("src","${pageContext.request.contextPath}"+imgtupiansrc);
				          $("#hidTupian").val(imgtupiansrc); 
				       }
			            editor = KindEditor.create('textarea[name="des"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
                   
		               $("#typeid").change(function(){
			        	      $("[name=typename]").val($("#typeid option:selected").text());
			            });
		               $("[name=typename]").val($("#typeid option:selected").text());
                    
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#qiugouForm").validate();
        });  
    </script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 求购信息管理
		</div>
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<form name="qiugouform" method="post"
					action="${pageContext.request.contextPath}/admin/qiugoumanager.do"
					id="qiugouForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="actiontype" value="${actiontype}" />
						<input name="pubren" placeholder="发布人"
								validate="{required:true,messages:{required:'请输入发布人'}}"
								value="${huiyuan.accountname}" class="input-txt"
								type="hidden" id="txtPubren" />
						<input type="hidden" name="seedid" value="${seedid}" />
						<input type="hidden" name="errorurl"
							value="/e/huiyuan/qiugouadd.jsp" />
						<input type="hidden" name="forwardurl"
							value="/admin/qiugoumanager.do?actiontype=get&pubren=${huiyuan.accountname }&forwardurl=/e/huiyuan/qiugoumanager.jsp" />
						<tr>
							<td colspan="4">${errormsg}</td>
						</tr>
						<tr>
							<td align="right">标题:</td>
							<td><input name="title" placeholder="标题"
								validate="{required:true,messages:{required:'请输入标题'}}"
								value="${requestScope.qiugou.title}" class="input-txt"
								type="text" id="txtTitle" /></td>
							<td colspan="2" rowspan="6"><img id="imgTupian" width="200px" height="200px"
								src="${pageContext.request.contextPath }${requestScope.qiugou.tupian}" />
								<div>
									<input type="file" name="upload" id="btnulTupian" />
								</div> <input type="hidden" id="hidTupian" name="tupian"
								value="${requestScope.qiugou.tupian}" /></td>
						</tr>
					
						<tr>
							<td align="right">价格要求:</td>
							<td><input name="jiage" placeholder="价格要求"
								validate="{required:true,messages:{required:'请输入价格要求'}}"
								value="${requestScope.qiugou.jiage}" class="input-txt"
								type="text" id="txtJiage" /></td>
						</tr>
						<tr>
							<td align="right">新旧程度:</td>
							<td><input name="xinjiu" placeholder="新旧程度"
								validate="{required:true,messages:{required:'请输入新旧程度'}}"
								value="${requestScope.qiugou.xinjiu}" class="input-txt"
								type="text" id="txtXinjiu" /></td>
						</tr>
						<tr>
							<td align="right">所在地:</td>
							<td><input name="szdi" placeholder="所在地"
								validate="{required:true,messages:{required:'请输入所在地'}}"
								value="${requestScope.qiugou.szdi}" class="input-txt"
								type="text" id="txtSzdi" /></td>
						</tr>
						
						<tr>
							<td align="right">联系电话:</td>
							<td><input name="mobile" placeholder="联系电话"
								validate="{required:true,messages:{required:'请输入联系电话'}}"
								value="${requestScope.qiugou.mobile}" class="input-txt"
								type="text" id="txtMobile" /></td>
						</tr>
						<tr>
							<td align="right">类别:</td>
							<td><web:dropdownlist name="typeid" id="typeid"
									cssclass="dropdown" value="${requestScope.qiugou.typeid}"
									datasource="${typeid_datasource}" textfieldname="mingcheng"
									valuefieldname="id">
								</web:dropdownlist>
							 <input id="hidtypename" name="typename" type="hidden"
								value="${requestScope.qiugou.typename}" /></td>
						</tr>
						
						<tr>
							<td align="right">品牌:</td>
							<td><input name="brandname" placeholder="品牌"
								validate="{required:true,messages:{required:'请输入品牌'}}"
								value="${requestScope.qiugou.brandname}" class="input-txt"
								type="text" id="txtBrandname" /></td>
						
							<td align="right">型号:</td>
							<td><input name="xinghao" placeholder="型号"
								validate="{required:true,messages:{required:'请输入型号'}}"
								value="${requestScope.qiugou.xinghao}" class="input-txt"
								type="text" id="txtXinghao" /></td>
						</tr>
						
						<tr>
							<td align="right">需求描述:</td>
							<td colspan="3"><textarea name="des" id="txtDes"
									style="width: 98%; height: 200px;">${requestScope.qiugou.des}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<button class="button">
									<i class="fa fa-check"></i>提交
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
