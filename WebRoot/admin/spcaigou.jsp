<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<%
		String  id=request.getParameter("id");
        SupplyorService supplyorSrv=BeansUtil.getBean("supplyorService", SupplyorService.class);
        ShangpinService shangpinSrv=BeansUtil.getBean("shangpinService", ShangpinService.class);
		Shangpin temobjshangpin=null;
	 	 List<Supplyor> supplor_datasource=supplyorSrv.getEntity("");
		 request.setAttribute("supplor_datasource",supplor_datasource);
		
		if( id!=null)
		{
		 
		   temobjshangpin=shangpinSrv.load(" where id="+ id);
		   request.setAttribute("shangpin",temobjshangpin);
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>商品采购</title>

<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
 <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link
	href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js"
	type="text/javascript"></script>
    
    <script type="text/javascript">
       
        $(function (){
            
            $.metadata.setType("attr","validate");
            $("#shangpinForm").validate();
        });  
    </script>
</head>
<body >
	<div class="search-title">
		<h2>商品采购</h2>
		<div class="description"></div>
	</div>
	<!-----开始---->
	<form name="shangpinform" method="post"
		action="${pageContext.request.contextPath}/admin/shangpinmanager.do"
		id="shangpinForm">
		<input type="hidden" name="id" value="<%=id %>" /> <input
			type="hidden" name="pubren" value="${shanghu.accountname}" /> <input
			type="hidden" name="actiontype" value="kucunadd" /> <input
			type="hidden" name="seedid" value="${seedid}" /> <input
			type="hidden" name="errorurl"
			value="/admin/spcaigou.jsp?id=${shangpin.id}" /> <input
			type="hidden" name="forwardurl"
			value="/admin/shangpinmanager.do?actiontype=get&forwardurl=/admin/shangpinmanager.jsp" />
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td align="right">名称:</td>
				<td>${requestScope.shangpin.name}</td>
				<td colspan="2" rowspan="6"><img id="imgTupian" width="200px"
					height="200px" src="${requestScope.shangpin.tupian}" /></td>
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
				
				<td align="right">供应商:</td>
				<td><web:dropdownlist name="supplor" id="supplor"
						cssclass="dropdown" 
						datasource="${supplor_datasource}" textfieldname="name"
						valuefieldname="name">
					</web:dropdownlist> 
				</td>
			</tr>
			<tr>
				<td align="right">采购数量:</td>
				<td><input name="shuliang" style="width:120px;"
					validate="{required:true,digits:true,messages:{required:'请输入数量',digits:'请输入正确数量'}}"
					value="10" class="input-txt" type="text" id="txtShuliang" /><input
					name="danwei" style="width:80px;"
					validate="{required:true,messages:{required:'请输入单位'}}"
					value="${requestScope.shangpin.danwei}" class="input-txt"
					type="text" id="txtDanwei" /></td>
			</tr>
				<tr>
				<td align="right">采购人:</td>
				<td><input name="cgren" placeholder="采购人"
					validate="{required:true,messages:{required:'请输入采购人'}}"
					value="${sessionScope.users.username}" class="input-txt" type="text"
					id="txtCgren" /></td>
			</tr>
			<tr>
				<td colspan="4">
				
				<input type="submit" value="补充库存" id="btnOK"
					class="orange-button" /></td>
			</tr>

		</table>

	</form>
	<!-----结束---->

</body>
</html>
