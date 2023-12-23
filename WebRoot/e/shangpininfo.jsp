
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include  file="import.jsp" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  	ShangpinService shangpinSrv = BeansUtil.getBean("shangpinService",
  			ShangpinService.class);
  
    HuiyuanService huiyuanSrv=BeansUtil.getBean("huiyuanService", HuiyuanService.class);
  	String id = request.getParameter("id");
  	Shangpin shangpin = null;
  	if (id != null) {
  		shangpin = shangpinSrv.load(new Integer(id));
  		if (shangpin != null){
  			request.setAttribute("shangpin", shangpin);
  			Huiyuan shanghu=huiyuanSrv.load("where accountname='"+shangpin.getPubren()+"'");
  			if(shanghu!=null)
  				request.setAttribute("temshanghu", shanghu);
  			
  			
  		}

  	}
  %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/web2table.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/webui/jquery-toast/jquery.toast.js"></script>
 <script type="text/javascript">
            $(function(){
               
            	var isNumber=function(val) {
           			var re = /^[0-9]+.?[0-9]*$/; //判断字符串是否为数字 //判断正整数 /^[1-9]+[0-9]*]*$/ 
           			if (!re.test(val)) 
           			   return false;
           			return true;
            	};
            	$("#btnShoucang").click(function(){
       	    	  var temaccountname= $("#scren").val(); 
       	    	  var temshoucangbackurl=$("#hidShoucangbackurl").val();
       	    	  if(temaccountname==""){
                         window.location.href="login.jsp?returnurl="+temshoucangbackurl;
                         return false;
                  }
       	    	   return true;
       	      });
              $(".oper-shuliang").click(function(){
            		
            		var oper=$(this).data("oper");
            		if(!isNumber($("#txtShuliang").val())){
            			alert("商品数量非法");
            			return;
            		}
            		if(oper=="add"){
            		   $("#txtShuliang").val(parseInt($("#txtShuliang").val())+1);
            		}
            		if(oper=="sub"){
            		   var curCount=parseInt($("#txtShuliang").val());
            		   if(curCount>=2)
             		     $("#txtShuliang").val(curCount-1);
            		   else
            			  alert("最小购买数量为1");
             		}
            		
            	});
              
                $("#btnIncart").click(function(){
                	var spId=$(this).data("id");
                	var count=$("#txtShuliang").val();
                	$.ajax({
                		url:'${pageContext.request.contextPath}/admin/shopcart/add',
                		method:'POST',
                		datatype:'JSON',
                		data:{
                		  'spid':spId,
                		  'count':count
                		},
                		success:function(data){
                			window.location="${pageContext.request.contextPath}/e/shopcart.jsp";
                			$.toast({
                                text: '成功加入购物车...',
                                icon: 'success',
                                hideAfter: 1000,
                                allowToastClose: false,
                                position: 'mid-center',
                                loader: false,        // Change it to false to disable loader
                                loaderBg: '#9EC600'  // To change the background
                            });
                		},
                		error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status + errorThrown);
                        }
                		
                		
                	});
                	
                });
                 
            });
    
    
    </script>
    
  
   

    

</head>
<body>
    <input type="hidden" id="commentresurl" value="/e/shangpininfo.jsp?id=<%=id%>">
	
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="wrap round-block">
	  <div class="line-title">
                   当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> >> 商品信息>>${shangpin.name }
      </div>
	
	<input type="hidden" id="reUrl" name="reurl" value="/e/shangpininfo.jsp?id=<%=id%>"/>

	<div class="fn-clear"></div>
	<div class="shangpin-info">
	     <div class="pic">
	         <img src="${pageContext.request.contextPath}${requestScope.shangpin.tupian}"/>
	     </div>
	     <div class="props">
	        <div class="title">
	           ${requestScope.shangpin.name}
	        </div>
	        <div class="subtitle">
	           ${requestScope.shangpin.subtitle}
	        </div>
	        <div class="price-block clearfix">
	           <div class="bq">
	             <span class="tip">爆款</span>
	           </div>
	           <div class="market-price clearfix">
	               <span class="label">原价</span>
	               <span class="price">${requestScope.shangpin.jiage}</span>
	               <span class="discount"><fmt:formatNumber type="number" value="${shangpin.hyjia/shangpin.jiage}" maxFractionDigits="2" />折扣</span>
	           </div>
	           <div class="mall-price clearfix">
	               <div class="label">商城价</div>
	               <div class="price"> ¥ ${requestScope.shangpin.hyjia}</div>
	               
	           </div>
	           
	           
	        </div>
	        <div class="prop">
	           <dl class="clearfix">
	             <dt>产地</dt>
	             <dd>${requestScope.shangpin.chandi}</dd>
	           </dl>
	        </div>
	         <div class="prop">
	           <dl class="clearfix">
	             <dt>新旧程度</dt>
	             <dd>${requestScope.shangpin.baozhuang}</dd>
	           </dl>
	        </div>
	        <div class="prop">
	           <dl class="clearfix">
	             <dt>商户</dt>
	             <dd>${temshanghu.accountname}-${temshanghu.name }
	                   <span  class="required-login pointer dw-sm-btn"  data-url="${pageContext.request.contextPath}/e/leavewordadd.jsp?shaccount=${temshanghu.accountname}"><i class="fa fa-comment"></i>联系卖家</span>                         
	             </dd>
	           </dl>
	        </div>
	          <div class="prop">
	           <dl class="clearfix">
	             <dt>联系电话</dt>
	             <dd>${temshanghu.mobile }
	                                          
	             </dd>
	           </dl>
	        </div>
	       
	         <div class="prop">
	           <dl class="clearfix">
	             <dt>适合对象</dt>
	             <dd>${requestScope.shangpin.shdx}</dd>
	           </dl>
	        </div>
	         <div class="prop">
	          <div class="control-group">
	             <div class="label">数量</div>
	             <div data-oper="sub" class="group-btn oper-shuliang">-</div>
	             <input name="shuliang" id="txtShuliang" value="1" type="text" class="input-control"/>
	             <div data-oper="add" class="group-btn  oper-shuliang">+</div>
	          </div>   
	             
	        </div>
	        <div class="prop">
	        
	            <form method="post" action="${pageContext.request.contextPath}/admin/shoucangmanager.do">
                                         <input type="hidden" name="bookid" value="<%=id%>"/>
                                          <input type="hidden" name="bookname" value="${shangpin.name}"/>
                                          <input type="hidden" name="tupian" value="${shangpin.tupian}"/>
                                         <input type="hidden" name="actiontype" value="save"/>
                                         <input type="hidden" id="scren" name="scren" value="${huiyuan.accountname}"/>
                                         <input type="hidden" name="forwardurl" value="/e/shangpininfo.jsp?id=<%=id%>"/>
                                          <input type="hidden" name="errorurl" value="/e/shangpininfo.jsp?id=<%=id%>"/>
                                        <input type="hidden" name="href" value="/e/shangpininfo.jsp?id=<%=id%>"/>
                                 <%if(shangpin.getKucun()>=1){ %>   
	                                 <span id="btnIncart" class="dw-btn" data-id="${requestScope.shangpin.id}"  > 
	                                     <i class="fa fa-plus"></i>加入购买
	                                  </span>
                                   <%}else{ %>
                                     <span class="dw-btn">库存不足</span>
                                   <%} %>
                                   
                                         <button  id="btnShoucang" class="dw-btn"><i class="fa fa-star"></i>收藏商品</button>
                                    </form>
                                    
                                     ${sctip}
	        </div>
	        
	      
	     
	     </div>
	</div>
	
	 <%=new ShangpinBuilder(request).view(response, id).buildViewedList()%>
	 
	   <div class="brief-title clearfix">介绍</div>
		    
		    <div class="brief-content">${requestScope.shangpin.jieshao}</div>
	
                
           <jsp:include page="spcomment.jsp">
              <jsp:param value="shangpin" name="commenttype"/>
           </jsp:include>
		
		</div>
		
	
	
	
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>

    <jsp:include page="loginmodal.jsp"></jsp:include>

</body>
</html>