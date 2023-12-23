<%@ page import="com.daowen.uibuilder.*" %>
<%@ page import="com.daowen.util.*" %>
<%@ page import="com.daowen.entity.*" %>
<%@ page import="com.daowen.service.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
DuixiangService duixiangSrv=BeansUtil.getBean("duixiangService", DuixiangService.class);
List<Duixiang>  duixiangList=duixiangSrv.getEntity();
request.setAttribute("duixiangList", duixiangList);

SptagService sptagSrv=BeansUtil.getBean("sptagService", SptagService.class);
List<Sptag> listSptag=sptagSrv.getEntity("");
request.setAttribute("listSptag", listSptag);
		

%>