<%@ include file="import.jsp" %>
<%@ page import="com.daowen.dto.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <%
	    
	    ShopcartService shopcartSrv=BeansUtil.getBean("shopcartService", ShopcartService.class);
	    
	    Shopcart shopcart=shopcartSrv.getCart("shopcart");
	    HashMap<Integer,ShopcartItem> carts=null;
	    int size=0;
	    if(shopcart!=null){
	       carts=shopcart.getCartItems();
	       request.setAttribute("cartitem", carts.values());
	       if(carts!=null)
	    	   request.setAttribute("cartsize", carts.size());
	    }
	    
	    
	    
	%>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">
            $(function(){
            	$(".btn-remove").click(function(){
                     var key=$(this).data("id");
            		 $.ajax({
	        				url:'${pageContext.request.contextPath}/admin/shopcart/remove',
	        				datatype:'JSON',
	        				method:'POST',
	        				data:{
	        				   'id':key
	        				},
	        				success:function(resData){
	        					window.location.reload();
	        				},
	        				error: function (XMLHttpRequest, textStatus, errorThrown) {
	                          alert(XMLHttpRequest.status + errorThrown);
	                       }
	        				 
	        		  });
            		
            	});//end 
            	
            	$(".change-count").click(function(){
       			
       			 var id=$(this).data("id");
       			 var xtype=$(this).data("xtype");
       			 var count=$(this).closest(".input-group").find("[name=spcount]").val();
       			 
       			 if(xtype=="add"){
       			     count++;
       				 $(this).closest(".input-group").find("[name=spcount]").val(count);
       			 }
       			 if(xtype=="sub"){
       			     if(count<2)
       			    	 return;
       				 count--;
       				 $(this).closest(".input-group").find("[name=spcount]").val(count);
       			 }
       			 
       			$.ajax({
    				url:'${pageContext.request.contextPath}/admin/shopcart/update',
    				datatype:'JSON',
    				method:'POST',
    				data:{
    				   'id':id,
    				   'count':count
    				},
    				success:function(resData){
    				   window.location.reload();
    					
    				},
    				error: function (XMLHttpRequest, textStatus, errorThrown) {
                      alert(XMLHttpRequest.status + errorThrown);
                   }
    				 
    			 });
       			 
       		 });//end changeout
       		 
       		 
       		$(".check-all").click(function(){
       			$(".check-item[type=checkbox]").prop("checked", $(this).is(":checked"));
		    });
       		 
       		$("#btnRemove").click(function(){
       			var ids=[];
       		    $(".check-item[type=checkbox]:checked").each(function(){
       		    	
       		    	ids.push($(this).val());
       		    });
		       	$.ajax({
		 				url:'${pageContext.request.contextPath}/admin/shopcart/removes',
		 				datatype:'JSON',
		 				method:'POST',
		 				traditional: true,
		 				data:{
		 				   'ids':ids
		 				},
		 				success:function(resData){
		 					window.location.reload();
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

	<jsp:include page="head.jsp"></jsp:include>
	
	<div style="min-height:600px;" class="wrap round-block">
	  <div class="line-title">
                   当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 购物车
      </div>
      
      
      <div class="shopcart-panel">
         <div class="title">我的商品</div>
         <div class="content">
         
             <table class="table table-bordered">
						<thead>
							<tr>
								<th width="150">
									<label class="checked-label"><input type="checkbox" name="checkall" class="check-all"><i></i> 全选</label>
								</th>
								<th width="300">商品信息</th>
								<th width="150">单价</th>
								<th width="200">数量</th>
								<th width="200">现价</th>
								<th width="80">操作</th>
							</tr>
						</thead>
						<tbody>
						   <%for(ShopcartItem sci :carts.values()) {%>
						   
							<tr>
								<th scope="row">
									<label class="checked-label"><input name="check<%=sci.getId() %>" class="check-item" value="<%=sci.getId() %>" type="checkbox"><i></i>
										<div class="img"><img src="${pageContext.request.contextPath}<%=sci.getImgurl() %>"  class="cover"></div>
									</label>
								</th>
								<td>
									<div class="name ep3"><%=sci.getTitle() %></div>
									<div class="type c9">颜色分类：深棕色  尺码：均码</div>
								</td>
								<td>¥<%=sci.getPrice() %></td>
								<td>
								   
								    <div style="width:120px;" class="input-group">
										  <span class="input-group-addon pointer change-count" data-id="<%=sci.getId() %>"  data-xtype="sub">-</span>
										  <input type="text" name="spcount" class="form-control" value="<%=sci.getCount() %>" />
										  <span class="input-group-addon pointer change-count " data-id="<%=sci.getId() %>"  data-xtype="add" >+</span>
								    </div>
									
								</td>
								<td><%=sci.getPrice()*sci.getCount() %></td>
								<td><span data-id="<%=sci.getId()%>" class="btn btn-primary btn-sm btn-remove">删除</span>
							</tr>
							<%} %>
							<c:if test="${fn:length(cartitem)==0}">
							   <tr>
							      <td style="text-align:center;font-size:18px;height:40px;" colspan="6">暂无商品信息</td>
							   </tr>
							</c:if>
						</tbody>
					</table>
         
         </div>
      </div>
      
      <c:if test="${fn:length(cartitem)>0}">
      <div class="checkbox shopcart-total">
						<label><input type="checkbox" class="check-all"><i></i> 全选</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="btnRemove" class="pointer"><i class="fa fa-remove "></i>移除</span>
						<div class="pull-right">
							已选商品 <span>${cartsize}</span> 件
							合计（不含运费）
							<b class="cr">¥<span class="fz24"><%=shopcart.getTotalPrice() %></span></b>
							 <span class="dw-btn required-login" data-url="${pageContext.request.contextPath }/e/xiadan.jsp">
                                       <i class="fa fa-check"></i>提交订单 
                             </span>
                             <a class="dw-btn" href="${pageContext.request.contextPath}/e/index.jsp">
                                    <i class="fa fa-shopping-cart"></i>   继续逛逛</a>
						</div>
					</div>
	
         </c:if>
	
	
	</div>
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>
    
	<jsp:include page="loginmodal.jsp"></jsp:include>
    


</body>
</html>