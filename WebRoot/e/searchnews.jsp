
<%@ include file="import.jsp"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
            String title=request.getParameter("title");
  XinxiService xinxiSrv=BeansUtil.getBean("xinxiService", XinxiService.class);
             List<Xinxi> xinxilist=null;
            if(title!=null){
            
            	
            	 xinxilist=xinxiSrv.getEntity("where title like '%"+title+"%'");
                        
                
            }
            
            
            
            
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统栏目信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	

	<div class="fn-clear"></div>
	
	<div class="wrap">
		<div class="directory">
		  
		     <div class="line-title">
		          <div class="introduce"><%=title %></div>
     	     </div>
     	     <div class="directory-content">
     	     
     	         <ul>
     	            <% 
     	           LanmuBuilder lmb=new LanmuBuilder("box");  
     	            for(Iterator it=xinxilist.iterator();it.hasNext();){ 
     	               SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
     	                  Xinxi temxinxi=(Xinxi)it.next();
     	            
     	            %>
     	                 
     	            <li>
     	                <div class="pic">
     	                   <a><img src="<%=temxinxi.getTupian2() %>"/></a>
     	                </div>
     	                <div class="text">
     	                    <div class="text-title"><a href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=<%=temxinxi.getId()%>"><%=temxinxi.getTitle() %></a></div>
     	                    <div class="subtitle">
     	                                                                发布时间:<span><%=sdf.format(temxinxi.getPubtime()) %></span>
     	                                                                 发布人:<span><%=temxinxi.getPubren() %></span>  
     	                                                                浏览次数: <span><%=temxinxi.getClickcount() %></span>                                     
     	                                                                
     	                    
     	                    </div>
     	                    <div class="text-content">
                                   <%=HTMLUtil.subStringInFilter(temxinxi.getDcontent(), 1, 300) %>                                                           
                             </div>
     	                </div>
     	            </li>
     	            <%} %>
     	         </ul>
     	        
     	     </div>
		  
		</div>
		   <div class="fn-left" style="width:310px;">
	          <div class="blue-box" >
                <div class="blue-box-title">推荐资讯</div>
			    <%=lmb.buildTuijianTextContent("blue-box-content") %>
            </div>
            <div class="blue-box" >
                <div class="blue-box-title">最新资讯</div>
			     <%=lmb.buildZuixinTextContent("blue-box-content") %>
            </div>
	     </div>

	</div>
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>