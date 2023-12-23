<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>商品</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>  
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
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
        
        $(function (){
        	
        	var initControl=function(){
            	
            	$("#dxid").change(function(){
          	        $("[name=shdx]").val($("#dxid option:selected").text());
                 });
            	$("[name=shdx]").val($("#dxid option:selected").text());
            	 $("#tagid").change(function(){
	      	        $("[name=tagname]").val($("#tagid option:selected").text());
	             });
            	 $("[name=tagname]").val($("#tagid option:selected").text());
		       
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
	                     $("#filelist").show();
	                     $("#imgTupian").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
	                     $("#hidTupian").val("/upload/temp/"+file.name);
	                  }
	             }); 
	          var imgtupiansrc="${requestScope.shangpin.tupian}";
		       if(imgtupiansrc==""){
		         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
		         $("#imgTupian").attr("src",url);
		         $("#hidTupian").val("/upload/nopic.jpg");
		       }else
		       {
		          $("#imgTupian").attr("src","${pageContext.request.contextPath}"+imgtupiansrc);
		          $("#hidTupian").val(imgtupiansrc); 
		       }
	            editor = KindEditor.create('textarea[name="jieshao"]', {
	            uploadJson : '../plusin/upload_json.jsp',
		        fileManagerJson : '../plusin/file_manager_json.jsp',
	            resizeType: 1,
		        allowFileManager: true
		       });
            }
            initControl();
            $.metadata.setType("attr","validate");
            var actiontype="${actiontype}";
           
            $("#shangpinForm").validate();
            
            var zuixin='${requestScope.shangpin.zuixin}';
            
            if(zuixin=='1'){
            	$("#txtZuixin").prop("checked",true);
            }
            var tuijian='${requestScope.shangpin.tuijian}';
            if(tuijian=='1'){
            	$("#txtTuijian").prop("checked",true);
            }
            
            var dazhe='${requestScope.shangpin.dazhe}';
            if(dazhe=='1'){
            	$("#txtDazhe").prop("checked",true);
            }
            var hot='${requestScope.shangpin.hot}';
            if(hot=='1'){
            	$("#txtHot").prop("checked",true);
            }
            $("[name='sptypeid']").val($("#sptype").children('option:selected').val());
        	$("[name='sptype']").val($("#sptype").children('option:selected').text());
            $("#sptype").change(function(){
            	
            	$("[name='sptypeid']").val($(this).children('option:selected').val());
            	$("[name='sptype']").val($(this).children('option:selected').text());
            })
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>商品管理->新建商品</h2>
		<div class="description"></div>
	</div>
	<form name="shangpinform" method="post"
		action="${pageContext.request.contextPath}/admin/shangpinmanager.do"
		id="shangpinForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			
			<input type="hidden" name="pubren" value="${users.username}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/shangpinadd.jsp" />
			<tr>
			     <td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">名称:</td>
				<td><input name="name"
					validate="{required:true,messages:{required:'请输入名称'}}"
					value="${requestScope.shangpin.name}" class="input-txt" type="text"
					id="txtName" /></td>
				<td colspan="2" rowspan="6"><img id="imgTupian" width="200px"
					height="200px" src="${requestScope.shangpin.tupian}" />
					<div>
						<input type="file" name="upload" id="btnulTupian" />
					</div> <input type="hidden" id="hidTupian" name="tupian"
					value="${requestScope.shangpin.tupian}" />
				</td>
			</tr>
			<tr>
				<td align="right">广告语:</td>
				<td><input name="subtitle"
					validate="{required:true,messages:{required:'请输入广告语'}}"
					value="${requestScope.shangpin.subtitle}" class="input-txt" type="text" /></td>
			</tr>
			
			
			<tr>
				<td align="right">商品类别:</td>
				<td><input type="hidden" name="sptype" /> <input type="hidden"
					name="sptypeid" /> 
					<web:dropdownlist id="sptype"   cssclass="dropdown" 
						value="${requestScope.shangpin.sptypeid}"
						datasource="${sptype_datasource}" textfieldname="mingcheng"
						valuefieldname="id">
					</web:dropdownlist>
					
				</td>
			</tr>

			

			<tr>
				<td align="right">市场价:(元)</td>
				<td><input name="jiage"  style="width:80px;"
					validate="{required:true,number:true,messages:{required:'请输入价格',number:'请输入正确价格'}}"
					value="${requestScope.shangpin.jiage}" class="input-txt"
					type="text" id="txtJiage" /></td>
			</tr>
			<tr>
				<td align="right">折扣:</td>
				<td><input name="discount"  style="width:80px;"
					validate="{required:true,number:true,max:1,messages:{required:'请输入折扣',number:'请输入正确价格',max:'折扣最大为1'}}"
					value="<fmt:formatNumber value="${requestScope.shangpin.hyjia/shangpin.jiage}" pattern="0.00"/>" class="input-txt"
					type="text"  /></td>
			</tr>
			<tr>
				<td align="right">游戏名称:</td>
				<td><web:dropdownlist name="tagid" id="tagid"
						cssclass="dropdown" value="${requestScope.shangpin.tagid}"
						datasource="${tagid_datasource}" textfieldname="name"
						valuefieldname="id">
					</web:dropdownlist> 
					<input id="hidtagname" name="tagname" type="hidden"
					value="${requestScope.shangpin.tagname}" /></td>
			</tr>
			
			<tr>
				<td align="right">特性:</td>
				<td><input name="dazhe" value="1" type="checkbox"
					id="txtDazhe" /> 打折 <input name="tuijian" value="1"
					type="checkbox" id="txtTuijian" /> 推荐 
					<input name="zuixin" value="1" type="checkbox" id="txtZuixin" />最新
					<input name="hot" value="1" type="checkbox" id="txtHot" />热销商品
				</td>
			   <td align="right">适合对象:</td>
				<td>
				   <web:dropdownlist name="dxid" id="dxid" cssclass="dropdown"  value="${requestScope.shangpin.dxid}" datasource="${dxid_datasource}"   textfieldname="name" valuefieldname="id">
                   </web:dropdownlist>
				   <input id="hidshdx" name="shdx" type="hidden" value="${requestScope.shangpin.shdx}"/>
				</td>
				
			</tr>
			
			<tr>
				<td align="right">新旧程度:</td>
				<td>
				   <input name="baozhuang"
					validate="{required:true,messages:{required:'请输入新旧程度'}}"
					value="${requestScope.shangpin.baozhuang}" class="input-txt" type="text" />
				</td>

				<td align="right">版本:</td>
				<td><input name="chandi"
					validate="{required:true,messages:{required:'请输入版本'}}"
					value="${requestScope.shangpin.chandi}" class="input-txt" type="text" /></td>
				
			</tr>

			<tr>
				<td align="right">单位:</td>
				<td>
				   <input name="danwei"
					validate="{required:true,messages:{required:'请输入商品单位'}}"
					value="${requestScope.shangpin.danwei}" class="input-txt" type="text" />
				</td>
			</tr>

			<tr>
				<td align="right">介绍:</td>
				<td colspan="3"><textarea name="jieshao" id="txtJieshao"
						style="width:98%;height:400px;">${requestScope.shangpin.jieshao}</textarea>
				</td>
			</tr>
		  	
			
			<tr>
			
			    <td colspan="2">
			       <input type="submit" value="提交" id="Button1" class="orange-button" />
			    </td>
			</tr>
		</table>
		
	</form>
</body>
</html>
