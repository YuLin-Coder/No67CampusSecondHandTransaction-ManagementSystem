<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    HytypeService hytypeSrv=BeansUtil.getBean("hytypeService", HytypeService.class);
    HuiyuanService huiyuanSrv=BeansUtil.getBean("huiyuanService", HuiyuanService.class);
    List<Object> typeid_datasource=hytypeSrv.getEntity("");
    request.setAttribute("typeid_datasource",typeid_datasource);
    if( id!=null){
      
      Huiyuan temobjhuiyuan=huiyuanSrv.load(" where id="+ id);
      request.setAttribute("huiyuan",temobjhuiyuan);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>设置会员级别</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script> 
    <script type="text/javascript">
      
        $(function(){
        	
        	$("#typeid").change(function(){
  	           $("[name=typename]").val($("#typeid option:selected").text());
            });
        	$("[name=typename]").val($("#typeid option:selected").text());
        	
        });
    
    </script>
</head>
<body >

	<div class="search-title">
		<h2>设置会员级别</h2>
		<div class="description"></div>
	</div>

	<form name="huiyuanform" method="post"
		action="${pageContext.request.contextPath}/admin/huiyuanmanager.do"
		id="huiyuanForm">
		<input type="hidden" name="id" value="<%=id %>" /> <input
			type="hidden" name="status" value="2" /> <input type="hidden"
			name="forwardurl"
			value="/admin/huiyuanmanager.do?actiontype=get&forwardurl=/admin/huiyuanmanager.jsp" />
		<input type="hidden" name="actiontype" value="updateLevel" />
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td align="right" class="title">用户名:</td>
				<td>
					${requestScope.huiyuan.accountname}(${requestScope.huiyuan.nickname})
				</td>
				<td colspan="2" rowspan="6"><img id="imgTouxiang" width="200px"
					height="200px" src="${requestScope.huiyuan.touxiang}" /></td>
			</tr>
			<tr>
				<td align="right" class="title">姓名:</td>
				<td>${requestScope.huiyuan.name}</td>
			</tr>
			<tr>
				<td align="right">会员级别:</td>
				<td><web:dropdownlist name="typeid" id="typeid"
						cssclass="dropdown" value="${requestScope.huiyuan.typeid}"
						datasource="${typeid_datasource}" textfieldname="name"
						valuefieldname="id">
					</web:dropdownlist> <input id="hidtypename" name="typename" type="hidden"
					value="${requestScope.huiyuan.typename}" /></td>
			</tr>

			<tr>
				<td align="right" class="title">注册时间:</td>
				<td><fmt:formatDate value="${requestScope.huiyuan.regdate}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td align="right" class="title">登录次数:</td>
				<td>${requestScope.huiyuan.logtimes}</td>
			</tr>

			<tr>
				<td align="right" class="title">邮箱:</td>
				<td>${requestScope.huiyuan.email}</td>
			</tr>
			<tr>
				<td align="right" class="title">移动电话:</td>
				<td>${requestScope.huiyuan.mobile}</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td align="right" class="title">地址:</td>
				<td>${requestScope.huiyuan.address}</td>


			</tr>
			<tr>
				<td colspan="2">

					<button class="orange-button">确定</button>
				</td>

			</tr>
		</table>
	</form>
</body>
</html>
