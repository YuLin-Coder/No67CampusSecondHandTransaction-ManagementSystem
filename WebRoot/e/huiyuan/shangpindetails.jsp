<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
     String  id=request.getParameter("id");
     ShangpinService shangpinSrv=BeansUtil.getBean("shangpinService",  ShangpinService.class);
    if( id!=null){
	    Shangpin temobjshangpin=shangpinSrv.load(" where id="+ id);
	      request.setAttribute("shangpin",temobjshangpin);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>商品信息查看</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 商品管理
		</div>
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">	
			       <!-----开始---->
			               <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >名称:</td>
											   <td>
												   ${requestScope.shangpin.name}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >图片:</td>
											   <td>
												   ${requestScope.shangpin.tupian}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >价格:</td>
											   <td>
												   ${requestScope.shangpin.jiage}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >商城价格:</td>
											   <td>
												   ${requestScope.shangpin.hyjia}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >类型编码:</td>
											   <td>
												   ${requestScope.shangpin.sptypeid}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >商品类型:</td>
											   <td>
												   ${requestScope.shangpin.sptype}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >推荐:</td>
											   <td>
												   ${requestScope.shangpin.tuijian}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >打折:</td>
											   <td>
												   ${requestScope.shangpin.dazhe}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >最新:</td>
											   <td>
												   ${requestScope.shangpin.zuixin}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >热点:</td>
											   <td>
												   ${requestScope.shangpin.hot}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >库存:</td>
											   <td>
												   ${requestScope.shangpin.kucun}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >单位:</td>
											   <td>
												   ${requestScope.shangpin.danwei}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >商品编号:</td>
											   <td>
												   ${requestScope.shangpin.spno}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >发布人:</td>
											   <td>
												   ${requestScope.shangpin.pubren}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >发布时间:</td>
											   <td>
												   ${requestScope.shangpin.pubtime}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >状态:</td>
											   <td>
												   ${requestScope.shangpin.state}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >广告语:</td>
											   <td>
												   ${requestScope.shangpin.subtitle}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >适合对象:</td>
											   <td>
												   ${requestScope.shangpin.shdx}
												</td>
											   </tr>
											   <tr>
											    <td align="right" >对象编号:</td>
											   <td>
												   ${requestScope.shangpin.dxid}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >产地:</td>
											   <td>
												   ${requestScope.shangpin.chandi}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >新旧程度:</td>
											   <td>
												   ${requestScope.shangpin.baozhuang}
												</td>
											   </tr>
											   <tr>
											    <td align="right" >标签id:</td>
											   <td>
												   ${requestScope.shangpin.tagid}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >标签名称:</td>
											   <td>
												   ${requestScope.shangpin.tagname}
												</td>
											   </tr>
				        </table>
			        <!-----结束---->
			</div>
	     </div>
	</div>
</body>
</html>
