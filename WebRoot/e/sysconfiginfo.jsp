
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
            SysconfigService sysconfigSrv=BeansUtil.getBean("sysconfigService", SysconfigService.class);
            SysconfigitemService syscfgitemSrv=BeansUtil.getBean("sysconfigitemService", SysconfigitemService.class);
            
            String id=request.getParameter("id");
            List<Sysconfigitem> listSysconfigitem=null;
            String itemid=request.getParameter("itemid");
            if(id!=null){
            
                Sysconfig sysconfig=sysconfigSrv.load("where id="+id);
                
                if(sysconfig!=null)
                   request.setAttribute("sysconfig",sysconfig);
                listSysconfigitem=syscfgitemSrv.getEntity("where cfgid="+id+" order by id asc ");
                if(listSysconfigitem!=null)
                	request.setAttribute("listSysconfigitem", listSysconfigitem);
                
            }
            if(itemid!=null){
                Sysconfigitem curCfgitem=syscfgitemSrv.load("where id="+itemid);
                if(curCfgitem!=null){
                	request.setAttribute("curCfgitem", curCfgitem);
                }
            }else{
            	
            	if(listSysconfigitem!=null&&listSysconfigitem.size()>0){
            		request.setAttribute("curCfgitem", listSysconfigitem.get(0));
            	}
            	
            }
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    
            $(function(){
               
            });
    
    
    </script>
    
    
    
   

    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	
	<div class="fn-clear"></div>
	
	<div class="wrap round-block" >
		
		  <div style="width:280px;float:left;min-height:600px;background:#fff;">
		      <div class="simple-category" >
		          <div class="title">
		                   ${sysconfig.name}
		          </div>
		          <div class="content">
		              <ul>
		                  <c:forEach var="sysconfigitem" items="${listSysconfigitem }">
		                  
		                      <li>
			                    <a href="${pageContext.request.contextPath}/e/sysconfiginfo.jsp?id=${sysconfig.id}&itemid=${sysconfigitem.id}">${sysconfigitem.title}</a>
			                 </li>
		                  </c:forEach>
		                
		              </ul>
		          </div>
		          
		      </div>
		  </div>
		   <div style="min-height:600px;width:800px;float:left;" class="info">
                    <h1>
                           ${curCfgitem.title}
                    </h1>
                    <h5>
                                                    
                    </h5>
                    <div class="news-content">
                       
                            ${curCfgitem.dcontent}  
                        
                       
                    </div>
                    
                        
                </div>
                
               
	
		

	</div>
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>