<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="import.jsp"%>
<%
            String shaccount=request.getParameter("shaccount");
            HuiyuanService shanghuSrv=BeansUtil.getBean("huiyuanService", HuiyuanService.class);
            Huiyuan shanghu=null;
            if(shaccount!=null){
                shanghu=shanghuSrv.load("where accountname='"+shaccount+"'");
                if(shanghu!=null)
                   request.setAttribute("temshanghu",shanghu);
            }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>商户</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
 <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>

   
   <script type="text/javascript">
      
        $(function ()
        {
        	editor = KindEditor.create('textarea[name="dcontent"]', {
		            uploadJson : '../plusin/upload_json.jsp',
			        fileManagerJson : '../plusin/file_manager_json.jsp',
		            resizeType: 1,
			        allowFileManager: true
			 });
            $.metadata.setType("attr","validate");
            $("#leavewordForm").validate();
            
            $("#btnOK").click(function(){
       		 
	       		 var poster=$("[name=lyren]").val();
	       		 var temreturnurl=$("#reUrl").val();
	       		 if(poster==""){
	       			 
	       			 window.location.href="login.jsp?reurl="+temreturnurl;
	                    return false;
	       		 }
	       		 
	       		 
	       		 
	       		 
	       	 });
	            
        });  
    </script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 联系卖家
		</div>
	
	<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian" src="${pageContext.request.contextPath}${requestScope.temshanghu.touxiang}" />
				<div class="operation">
					<div class="ticket-price">
					
					     ${requestScope.temshanghu.name}
					</div>
				</div>
			</div>
			<div class="text-box">
				<div class="title">${requestScope.temshanghu.name}</div>
				<div class="sub-title">店铺宣言:</div>
				<div>
					<ul>
						<li><strong>店铺电话:</strong> ${requestScope.temshanghu.mobile}</li>
						<li><strong>店铺地址:</strong> ${requestScope.temshanghu.address}
						</li>
						
						<li><strong>入住时间:</strong>
							<fmt:formatDate value="${requestScope.temshanghu.regdate}" pattern="yyyy-MM-dd"/></li>
		              
					</ul>
				</div>
				
			</div>
		</div>
			
	      <div class="brief-title">在线咨询</div>
		<div class="brief-content">
		
		    <form name="leavewordform" method="post"
					action="${pageContext.request.contextPath}/admin/leavewordmanager.do"
					id="leavewordForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="replyren" value="${requestScope.temshanghu.accountname}" />
						<input type="hidden" name="replyname" value="${requestScope.temshanghu.name}" />
			
						<input type="hidden" name="lwren" value="${sessionScope.huiyuan.accountname}" />
						<input type="hidden" name="lwname" validate="{required:true,messages:{required:'请完善个人信息姓名'}}" value="${sessionScope.huiyuan.name}" />

						<input type="hidden" name="actiontype" value="save" />
						<input type="hidden" name="seedid" value="${seedid}" />
						<input type="hidden" name="errorurl"
							value="/e/leavewordadd.jsp?tgid=${s.id }" />
						<input type="hidden" name="forwardurl"
							value="/admin/leavewordmanager.do?actiontype=get&lwren=${sessionScope.huiyuan.accountname}&forwardurl=/e/huiyuan/leavewordmanager.jsp" />
						<tr>
							<td colspan="4">${errormsg}</td>
						</tr>
						

						<tr>
							<td align="right">咨询标题:</td>
							<td colspan="3"><input name="title" placeholder="标题"
								validate="{required:true,messages:{required:'请输入标题'}}"
								value="${requestScope.leaveword.title}" class="input-txt"
								type="text" id="txtTitle" /></td>
						</tr>

						<tr>
							<td align="right">内容:</td>
							<td colspan="3"><textarea name="dcontent" id="txtDcontent"
									style="width:98%;height:200px;">${requestScope.leaveword.dcontent}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4">
									<button id="btnOK" class="dw-btn">
										<i class="fa fa-check"></i>提交
									</button>
							</td>
						</tr>
					</table>
				</form>
		
		</div>
	</div>
	<div class="fn-clear"></div>
</body>
</html>
