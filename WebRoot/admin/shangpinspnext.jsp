<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    ShangpinService shangpinSrv=BeansUtil.getBean("shangpinService",  ShangpinService.class);
    if( id!=null)
    {
         Shangpin temobjshangpin= shangpinSrv.load(" where id="+ id);
          request.setAttribute("shangpin",temobjshangpin);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>商品审批</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>商品审批</h2>
		<div class="description"></div>
	</div>
	<form name="shangpinform" method="post"
		action="${pageContext.request.contextPath}/admin/shangpinmanager.do"
		id="shangpinForm">
		<input type="hidden" name="id" value="<%=id%>" /> <input
			type="hidden" name="actiontype" value="shenpi" /> <input
			type="hidden" name="errorurl" value="/admin/shangpinadd.jsp" /> <input
			type="hidden" name="forwardurl"
			value="/admin/shangpinmanager.do?actiontype=get&forwardurl=/admin/shangpinmanager.jsp" />
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td width="10%" align="right">名称:</td>
				<td>${requestScope.shangpin.name}</td>
				<td colspan="2" rowspan="6"><img id="imgTupian" width="200px" height="200px"
					src="${pageContext.request.contextPath}${requestScope.shangpin.tupian}" /></td>
			</tr>
				
			<tr>
				<td width="10%" align="right">广告语:</td>
				<td>${requestScope.shangpin.subtitle}</td>
			</tr>
			<tr>
				<td width="10%" align="right">商品编号:</td>
				<td>${requestScope.shangpin.spno}</td>
			</tr>
			
			<tr>
				<td width="10%" align="right">价格:</td>
				<td>${requestScope.shangpin.hyjia}元</td>
			</tr>
			
			<tr>
				<td width="10%" align="right">商品类型:</td>
				<td>${requestScope.shangpin.sptype}</td>
			</tr>
			
			<tr>
				<td width="10%" align="right">库存:</td>
				<td>${requestScope.shangpin.kucun}-${requestScope.shangpin.danwei}</td>
			</tr>
		
			<tr>
				<td width="10%" align="right">发布人:</td>
				<td>${requestScope.shangpin.pubren}</td>
			
				<td width="10%" align="right">发布时间:</td>
				<td>${requestScope.shangpin.pubtime}</td>
			</tr>
		
			<tr>
				<td width="10%" align="right">适合对象:</td>
				<td>${requestScope.shangpin.shdx}</td>
			
				<td width="10%" align="right">产地:</td>
				<td>${requestScope.shangpin.chandi}</td>
			</tr>
			<tr>
				<td width="10%" align="right">新旧程度:</td>
				<td>${requestScope.shangpin.baozhuang}</td>
			
				<td width="10%" align="right">商品标签:</td>
				<td>${requestScope.shangpin.tagname}</td>
			</tr>
			<tr>
				<td align="right">审核结果</td>
				<td><input type="radio" value="2" name="spstate"
					checked="checked" />审批通过 <input type="radio" value="3"
					name="spstate" />拒绝</td>
			</tr>
			
			<tr>
				<td align="right">处理说明:</td>
				<td colspan="3"><textarea name="reply" id="txtReply"
						style="width: 48%; height: 80px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<button class="orange-button">提交审批</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
