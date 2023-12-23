<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
		String  id=request.getParameter("id");
		Shangpin temobjshangpin=null;
		ShangpinService shangpinSrv=BeansUtil.getBean("shangpinService", ShangpinService.class);
		if( id!=null)
		{
		 
		   temobjshangpin=shangpinSrv.load(" where id="+ id);
		   request.setAttribute("shangpin",temobjshangpin);
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>信息查看</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
 <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    
    <script type="text/javascript">
       
        $(function (){
            
            $.metadata.setType("attr","validate");
            $("#shangpinForm").validate();
        });  
    </script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 商品采购
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<!-----开始---->
			<form name="shangpinform" method="post"
				action="${pageContext.request.contextPath}/admin/shangpinmanager.do"
				id="shangpinForm">
				<input type="hidden" name="id" value="<%=id %>" />
						<input type="hidden" name="pubren" value="${shanghu.accountname}" />
						<input type="hidden" name="actiontype" value="kucunadd" />
						<input type="hidden" name="seedid" value="${seedid}" />
						<input type="hidden" name="errorurl"
							value="/e/huiyuan/spcaigou.jsp?id=${shangpin.id}" />
						<input type="hidden" name="forwardurl"
							value="/admin/shangpinmanager.do?actiontype=get&pubren=${huiyuan.accountname}&forwardurl=/e/huiyuan/shangpinmanager.jsp" />
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					<tr>
						<td align="right">名称:</td>
						<td>${requestScope.shangpin.name}</td>
						<td colspan="2" rowspan="6"><img id="imgTupian" width="200px"
							height="200px" src="${pageContext.request.contextPath}${requestScope.shangpin.tupian}" /></td>
					</tr>
					<tr>
						<td align="right">商品编号:</td>
						<td>${requestScope.shangpin.spno}</td>
					</tr>
					<tr>
						<td align="right">商品类别:</td>
						<td>${requestScope.shangpin.sptype}</td>
					</tr>

					<tr>
						<td align="right">价格:</td>
						<td>${requestScope.shangpin.jiage}￥</td>
					</tr>
					<tr>
						<td align="right">会员价:</td>
						<td>${requestScope.shangpin.hyjia}￥</td>
					</tr>
					<tr>
						<td align="right">打折:</td>
						<td>
							<%
								if (temobjshangpin.getDazhe() == 1) {
							%> 打折 <%
								} else {
							%> 非打折 <%
								}
							%>
						</td>
					</tr>


					<tr>
						<td align="right">商品库存:</td>
						<td colspan="3">${requestScope.shangpin.kucun}${shangpin.danwei }</td>
					</tr>
					
					<tr>
							<td align="right">采购数量:</td>
							<td><input name="shuliang"  style="width:120px;"
								validate="{required:true,digits:true,messages:{required:'请输入数量',digits:'请输入正确数量'}}"
								value="10" class="input-txt"
								type="text" id="txtShuliang" /><input name="danwei"  style="width:80px;"
								validate="{required:true,messages:{required:'请输入单位'}}"
								value="${requestScope.shangpin.danwei}" class="input-txt"
								type="text" id="txtDanwei" />
							</td>
						</tr>
					<tr>
					    <td colspan="4">
					        <input type="submit" value="补充库存" id="btnOK" class="orange-button" />
					    </td>
					</tr>

				</table>
				
				</form>
				<!-----结束---->
			</div>
		</div>
	</div>
</body>
</html>
