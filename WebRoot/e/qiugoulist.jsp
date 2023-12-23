<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.daowen.webcontrol.*"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@  include file="import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <%
    QiugouService qiugoutskSrv=BeansUtil.getBean("qiugouService", QiugouService.class);
    String  filter="";
    int pageindex = 1;
	int pagesize = 10;
	// 获取当前分页
	String currentpageindex = request.getParameter("currentpageindex");
	// 当前页面尺寸
	String currentpagesize = request.getParameter("pagesize");
	// 设置当前页
	if (currentpageindex != null)
		pageindex = new Integer(currentpageindex);
	// 设置当前页尺寸
	if (currentpagesize != null)
		pagesize = new Integer(currentpagesize);
	List<Qiugou> qiugoulist = qiugoutskSrv.getPageEntitys(filter,
			pageindex, pagesize);
	int recordscount = qiugoutskSrv.getRecordCount(filter == null ? ""
			: filter);
	request.setAttribute("qiugoulist", qiugoulist);
	PagerMetal pm = new PagerMetal(recordscount);
	// 设置尺寸
	pm.setPagesize(pagesize);
	// 设置当前显示页
	pm.setCurpageindex(pageindex);
	// 设置分页信息
	request.setAttribute("pagermetal", pm);
  %>
<head>
<title>求购信息列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		
		<div style="min-height: 600px;" class="common-picture-list">
			<ul>
				<% 
                    SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                     if(qiugoulist!=null){
     	              for(Iterator it=qiugoulist.iterator();it.hasNext();){ 
     	                  Qiugou temqiugou=(Qiugou)it.next();
     	            %>
				<li class="clearfix">
					<h3>
						<a
							href="${pageContext.request.contextPath}/e/qiugouinfo.jsp?id=<%=temqiugou.getId()%>"><%=temqiugou.getTitle() %></a>
					</h3>
					<div class="picture-area">
						<img src="${pageContext.request.contextPath}<%=temqiugou.getTupian()%>" width="150" height="95" />
					</div>
					<div class="text-area">
						<div class="list-show-item">
							<em> 发布人:</em><%=temqiugou.getPubren()%></div>
						<div class="list-show-item">
							<em> 发布时间:</em><%=sdf.format(temqiugou.getPubtime())%></div>
						<div class="list-show-item">
							<em> 价格要求:</em><%=temqiugou.getJiage()%>元</div>
						<div class="list-show-item">
							<em> 新旧程度:</em><%=temqiugou.getXinjiu()%></div>
						<div class="list-show-item">
							<em> 所在地:</em><%=temqiugou.getSzdi()%></div>
						<div class="list-show-item">
							<em> 浏览次数:</em><%=temqiugou.getClickcount()%></div>
						<div class="list-show-item">
							<em> 联系电话:</em><%=temqiugou.getMobile()%></div>
						
						<div class="list-show-item">
							<em> 类别名称:</em><%=temqiugou.getTypename()%></div>
						<div class="list-show-item">
							<em> 品牌:</em><%=temqiugou.getBrandname()%></div>
						<div class="list-show-item">
							<em> 型号:</em><%=temqiugou.getXinghao()%></div>
						
						<div class="abstract">
							<%=HTMLUtil.subStringInFilter(temqiugou.getDes(), 0, 200) %>
							[<a
								href="${pageContext.request.contextPath}/e/qiugouinfo.jsp?id=<%=temqiugou.getId()%>">详细</a>]
						</div>
					</div>
				</li>
				<%}} %>
			</ul>
			<form id="qiugousearchForm" method="post"
				action="${pageContext.request.contextPath}/e/qiugoulist.jsp">
				<input type="hidden" name="actiontype" value="get" /> <input
					type="hidden" name="forwardurl" value="/e/qiugoulist.jsp" />
			</form>
			<daowen:pager id="pager1" attcheform="qiugousearchForm" />
		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
