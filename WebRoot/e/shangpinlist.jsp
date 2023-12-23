<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="import.jsp" %>
  <% 
         ShangpinService shangpinSrv=BeansUtil.getBean("shangpinService", ShangpinService.class);
         SpcategoryService spcategorySrv=BeansUtil.getBean("spcategoryService", SpcategoryService.class);
         List<Shangpin> hotsaledList=shangpinSrv.getTopEntity(" where hot=1 order by id desc ",5);
		 request.setAttribute("hotsaledList", hotsaledList);
		 
		 String spcId=request.getParameter("spcid");
		 String tagId=request.getParameter("tagid");
		 String dxId=request.getParameter("dxid");
		 List<Spcategory> listSpcategory=spcategorySrv.getEntity("where parentid="+spcId);
		 if(listSpcategory!=null)
			 request.setAttribute("listSpcategory", listSpcategory);
		 
		 int nspcId=0,ndxId=0,ntagId=0;
		 if(spcId!=null){
			 nspcId=Integer.parseInt(spcId);
			 request.setAttribute("spcId", spcId);
			 Spcategory spcategory= spcategorySrv.load(nspcId);
			 if(spcategory!=null)
				 request.setAttribute("spcategory", spcategory);
			 
	     }
		 
		 if(dxId!=null)
			 ndxId=Integer.parseInt(dxId);
		 if(tagId!=null)
			 ntagId=Integer.parseInt(tagId);
		     
		 List<Shangpin> shangpinList=shangpinSrv.findShangpin(nspcId,ntagId,ndxId);
		 request.setAttribute("shangpinList", shangpinList);
		 
		 
		 
		 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>

<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {

        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
  
	<div class="fn-clear"></div>
	
	
	
	<div class="wrap round-block" style="min-height:600px;overflow:hidden;">
       
        <div class="line-title">
	                   当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 商品列表
	     </div>
       <div style="width:230px;float:left;overflow:hidden">
       
        <div class="box-bar clearfix">
            <div class="title">
                                    适合对象
            </div>
            <div class="content">
               <ul>
                  <c:forEach var="duixiang" items="${duixiangList}">
                      <li>
                          <a href="${pageContext.request.contextPath}/e/shangpinlist.jsp?dxid=${duixiang.id}">${duixiang.name}</a>
                      </li>
                  </c:forEach>
                  
               </ul>
            </div>
        </div>
        
      
        
      
        <div class="box-bar clearfix">
             <div class="title">今日热销</div>
              <div class="content">
              <div class="it-container">
                	
               <dl>
              <c:forEach var="shangpin" items="${hotsaledList}">
                 <dd>
                 <a href="${pageContext.request.contextPath}/e/shangpininfo.jsp?id=${shangpin.id}" target="self">
				     <img src="${pageContext.request.contextPath}${shangpin.tupian }" class="img"/>
				 </a>
				<div class="name">
				   <p>${shangpin.name}</p>
				   
				 </div>
				 <div class="weight-tip">
				       ${shangpin.hyjia}元
				  </div> 
				  </dd>
				</c:forEach>
				</dl>
				
                 </div> 
              </div>
        
        </div>
        </div>
        <div  style="float: right;width:950px;">
          
         <div class="filter-box">
           <c:if test="${fn:length(listSpcategory) > 0}">
             <div class="item">
                <div class="title">分类:</div>
                 <div class="content-list">
                    <ul>
                       <c:forEach var="spcategory" items="${listSpcategory}">
                          <li>
                             <a href="${pageContext.request.contextPath}/e/shangpinlist.jsp?spcid=${spcategory.id}">${spcategory.mingcheng}</a>
                          </li>
                       </c:forEach>
                    </ul>
                 </div>
             </div>
             </c:if>
              <div class="item">
                 <div class="title">价格:</div>
                 <div class="content-list">
                    <ul>
                        <c:forEach var="sptag" items="${listSptag}">
                          <li>
                             <a href="${pageContext.request.contextPath}/e/shangpinlist.jsp?tagid=${sptag.id}">${sptag.name}</a>
                          </li>
                         </c:forEach>
                      
                    </ul>
                 </div>
                </div>
                
         </div>
		 
		
		 <div style="min-height:600px;"   class="picture-list">
		     <div class="title">${spcategory.mingcheng}</div>
		     <c:if test="${fn:length(shangpinList)>0}">
		     <ul>
		       <c:forEach var="shangpin" items="${shangpinList}">
		        <li>
		           
		           <a href="${pageContext.request.contextPath}/e/shangpininfo.jsp?id=${shangpin.id}" class="item">
		             <c:if test="${shangpin.tuijian==1}">
			              <div class="tag">
			                 <span>推荐</span>
			              </div>
		              </c:if>
		              <c:if test="${shangpin.zuixin==1}">
			              <div class="tag">
			                 <span>最新</span>
			              </div>
		              </c:if>
		               <c:if test="${shangpin.hot==1}">
			              <div class="tag">
			                 <span>热卖</span>
			              </div>
		              </c:if>
		              <div class="img">
		                 <img src="${pageContext.request.contextPath}${shangpin.tupian}" />
		              </div>
		               
		               <div class="name">${shangpin.name}</div>
		               <div class="price">¥ ${shangpin.hyjia}</div>
		               <div class="discount"><fmt:formatNumber type="number" value="${shangpin.hyjia/shangpin.jiage}" maxFractionDigits="2" />折</div>
		           </a>
		           
		        </li>
		        </c:forEach>
		     </ul>
		   </c:if>
		   <c:if test="${shangpinList== null || fn:length(shangpinList) == 0}">
		      <div class="no-record-tip">
			    <div class="content">
			                  没有找到相关商品信息
			    </div>	
			 </div>
		       
		    </c:if>
		     
		     
		   </div>
		  
			
        
        </div>
			
	</div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>