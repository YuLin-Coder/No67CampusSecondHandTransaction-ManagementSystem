<%@page import="java.text.SimpleDateFormat"%>
<%@ page  import="com.daowen.util.*" %>
<%@page import="com.daowen.entity.*"%>
<%@page import="com.daowen.service.*"%>
<%@page import="com.daowen.uibuilder.*"%>

<%@page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
  String id=request.getParameter("lanmuid");
  String parentid=request.getParameter("parentid");
  List<Lanmu> listlm=null;
  LanmuService lanmuSrv=BeansUtil.getBean("lanmuService", LanmuService.class);
  Lanmu lanmu=null;
  if(id!=null){
  
      lanmu=(Lanmu)lanmuSrv.load("where id="+id);
     
      if(lanmu!=null)
          request.setAttribute("lanmu",lanmu);
      if(lanmu.getIsleaf()!=1){
         listlm=lanmuSrv.getEntity("where parentid="+id);
         parentid=id;
      }else
      {
      	if(parentid!=null)
      	   listlm=lanmuSrv.getEntity("where parentid="+parentid);
      }
     
  }
  
  LanmuBuilder lmb=new LanmuBuilder("box");
  List<Xinxi> xinxilist=lmb.findXinxiByLanmu(new Integer(id));
  
  System.out.print("xinsize="+xinxilist.size());
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${lanmu.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	

	
	<div class="fn-clear"></div>
	<div class="wrap round-block" >
	       <ul class="cate-href">
	     <%if(listlm!=null&&listlm.size()>0) {
	        for(Lanmu temlanmu :listlm){
	     
	     %>
	     
	          
	             <li><a class="item" href="${pageContext.request.contextPath}/e/xinxilist.jsp?lanmuid=<%=temlanmu.getId()%>&parentid=<%=parentid%>"><%=temlanmu.getTitle() %></a></li>
	            
	      <%}} %>
	     
	     </ul>
	     <div>
	        
	         <%=lmb.buildImageLanmu(xinxilist,lanmu.getTitle())%>
	         
	     
	     </div>
	     
		

	</div>
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>