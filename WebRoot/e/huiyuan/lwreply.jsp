<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>

<%
	String  id=request.getParameter("id");
	LeavewordService leavewordSrv=BeansUtil.getBean("leavewordService", LeavewordService.class);
	if( id!=null){
	  Leaveword temobjleaveword=leavewordSrv.load(" where id="+ id);
	  request.setAttribute("leaveword",temobjleaveword);
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>留言</title>
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
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
       
        $(function (){
        	  editor = KindEditor.create('textarea[name="replycontent"]', {
		            uploadJson : '../plusin/upload_json.jsp',
			        fileManagerJson : '../plusin/file_manager_json.jsp',
		            resizeType: 1,
			        allowFileManager: true
			       });
            $.metadata.setType("attr","validate");
            $("#leavewordForm").validate();
        });  
    </script>
    
  
    
</head>
<body>

   <jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 在线解答
		</div>


		<div class="main">

			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">

				<form name="leavewordform" method="post"
					action="${pageContext.request.contextPath}/admin/leavewordmanager.do"
					id="leavewordForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="replyren"
							value="${sessionScope.huiyuan.accountname}" />
						<input type="hidden" name="replyname"
							value="${sessionScope.huiyuan.name}" />

						<input type="hidden" name="actiontype" value="reply" />
						<input type="hidden" name="seedid" value="${seedid}" />
						<input type="hidden" name="errorurl"
							value="/e/huiyuan/lwreply.jsp?id=<%=id%>" />
						<input type="hidden" name="forwardurl"
							value="/admin/leavewordmanager.do?actiontype=get&replyren=${sessionScope.huiyuan.accountname}&forwardurl=/e/huiyuan/leavewordmanager.jsp" />
						<tr>
							<td colspan="4">${errormsg}</td>
						</tr>
						<tr>
							<td align="right" width="10%" class="title">账户名:</td>
							<td>${sessionScope.huiyuan.accountname}</td>
							<td colspan="2" rowspan="6"><img
								src="${pageContext.request.contextPath }${sessionScope.huiyuan.touxiang}"
								width="200" height="200" /></td>
						</tr>

						<tr>
							<td align="right" width="10%" class="title">商户名:</td>
							<td>${sessionScope.huiyuan.name}</td>
						</tr>
						<tr>
							<td align="right" width="10%" class="title">联系电话:</td>
							<td>${sessionScope.huiyuan.mobile}</td>
						</tr>
						<tr>
							<td align="right" width="10%" class="title">地址:</td>
							<td>${sessionScope.huiyuan.address}</td>
						</tr>


						<tr>

							<td align="right" class="title">入住时间:</td>
							<td><fmt:formatDate value="${requestScope.huiyuan.regdate}"
									pattern="yyyy-MM-dd hh:mm:ss" /></td>
						</tr>
						<tr>
							<td align="right">咨询标题:</td>
							<td colspan="3">${requestScope.leaveword.title}</td>
						</tr>
						<tr>
							<td align="right">咨询内容:</td>
							<td colspan="3">${requestScope.leaveword.dcontent}</td>
						</tr>
						<tr>
							<td align="right">回复:</td>
							<td colspan="3"><textarea name="replycontent"
									id="txtReplycontent" style="width: 98%; height: 200px;">${requestScope.leaveword.replycontent}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4">

								<button class="orange-button">提交</button>
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>
</body>
</html>
