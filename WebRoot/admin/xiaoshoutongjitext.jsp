<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page  import="com.daowen.jdbc.simplecrud.*" %>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>销售统计</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
	
	
	<script type="text/javascript">
	 
	      $(function(){
	    	  
	    	  $("#txtBegintime").datepicker({
                  dateFormat:'yy-mm-dd'
               });
				if($("#txtBegintime").val()==""){
					$("#txtBegintime").datepicker("setDate",new Date());
				}
				$("#txtEndtime").datepicker({
                  dateFormat:'yy-mm-dd'
               });
				if($("#txtEndtime").val()==""){
					var enddate = new Date();
		            enddate.setDate(enddate.getDate() + 1);
					$("#txtEndtime").datepicker("setDate",enddate);
				}
	    	  
	      })
	 </script>
	</head>
	 <body >
			   <div class="search-title">
					<h2>
	                                                      销售统计
	                </h2>
                <div class="description">
                    
                     <a href="${pageContext.request.contextPath }/admin/xiaoshoutongji.jsp">图表模式</a>
                    
                </div>
              </div>
              
               <form id="searchForm"  action="${pageContext.request.contextPath}/admin/tongjimanager.do" method="post" >
					   <table  cellspacing="0" width="100%">
					        <tbody>
					          <tr>
					             <td>
					                                    
                                                                                                开始时间:<input name="begindate"  value="${begindate}" class="input-txt" type="text" id="txtBegintime"   />
                                                                                                结束时间:<input name="enddate"  value="${enddate}" class="input-txt" type="text" id="txtEndtime" />
					                  <input type="hidden"   name="actiontype" value="xiaoshouTongji"/>
					                   <input type="hidden"   name="forwardurl" value="/admin/xiaoshoutongjitext.jsp"/>
					                  <input type="hidden"   name="seedid" value="${seedid}"/>
					                 <div class="ui-button">
					                    <input type="submit" value="统计" id="btnSearch" class="ui-button-text" /> 
					                 </div>
					             </td>
					          </tr>
					        </tbody>
					   </table>
					   </form>
      <%
      
         DataTable dt=(DataTable)request.getAttribute("dtTongji");
      %>         
	<table id="dingdan" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr> 
			    <th><b>编号</b></th>
				<th><b>商品名称</b></th>
				<th><b>销售数量</b></th>
				<th><b>总金额(元)</b></th>
			</tr>
		</thead>
		<tbody>
			  <%
			  int rowSize=0;  
			  if(dt!=null)
			     rowSize=dt.getRows().size();
			  
			  if(rowSize==0){ %>
				<tr>
					<td colspan="10">没有相关信息</td>
				</tr>
			 <%} %>
			
			<%
			 int i=0;
			if(dt!=null){
			for(DataRow dr :dt.getRows()){ %>
			<tr>
				<td><div class="sequence"><%=++i %></div></td>
				
				
				<td><%=dr.getString("spname")%></td>
				<td>
				   <%=dr.getString("totalcount") %>份
				</td>
				<td>
				    <%=dr.getDouble("totalfee") %>元
				</td>
				
			</tr>
			<%}}%>
		</tbody>
	</table>
	
	<div >
	   <%if(rowSize>0){ %>
	      <% 
	          DataRow dr=dt.getRows().get(0);
	          ShangpinService shangpinSrv=BeansUtil.getBean("shangpinService", ShangpinService.class);
	          Shangpin shangpin=shangpinSrv.load("where id='"+dr.getString("spid")+"'");
	         
	          
	      %>
	       <div style="font-size:22px;font-weight:600;border-bottom: 2px solid #3c8dbc;padding-top:22px;padding-left:50px;">
	       
	                        最受欢迎商品:
	       </div>        
	             
	                
	                <div style="width:220px;height:400px;padding:12px;"> 
	                    <a href="${pageContext.request.contextPath}/admin/shangpindetails.jsp?id=<%=shangpin.getId()%>">
	                        <img src="${pageContext.request.contextPath}<%=shangpin.getTupian() %>" width="200" height="200" />
	                        <span style="display:block;width:200px;font-size:14px;height:40px;line-height:20px;overflow:hidden;"><%=shangpin.getName() %></span>
	                    </a>
	                </div>
	   <%} %>
	</div>
		
	</body>
</html>
