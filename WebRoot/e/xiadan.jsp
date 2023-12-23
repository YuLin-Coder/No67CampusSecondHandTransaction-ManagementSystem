<%@ include file="import.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ page import="com.daowen.dto.*" %>
<%@ include file="huiyuan/law.jsp"%>
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
	 double totalfee=shopcart.getTotalPrice();
	 
	
	 request.setAttribute("totalfee", totalfee);
 
     String filter="where 1=1 ";
     if(tem_huiyuan!=null) {
         filter = MessageFormat.format("where hyaccount=''{0}''", tem_huiyuan.getAccountname());
     }
     ReceaddressService addSrv=BeansUtil.getBean("receaddressService", ReceaddressService.class);
     List<Receaddress> listReceaddress=addSrv.getEntity(filter);
     if(listReceaddress!=null){
         request.setAttribute("listReceaddress", listReceaddress);
         if(listReceaddress.size()>0)
             request.setAttribute("defaultAddress", listReceaddress.get(0));
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
     <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <script type="text/javascript">
    
            $(function(){

                $(".address-list .address-info").on("click",function(){

                    $(".address-list .address-info").removeClass("selected");
                    var $this=$(this);
                    $this.addClass("selected");
                    $("[name=shrname]").val($this.data("shr"));
                    $("[name=shraddress]").val($this.data("addinfo"));
                    $("[name=shrtel]").val($this.data("mobile"));
                    $("[name=postcode]").val($this.data("postcode"));

                });
                $("#btnXiadan").click(function(){

                    var address=$("[name=shraddress]").val();

                    if(address==""){
                        alert("请新增收货地址");
                        return false;
                    }

                    return true;

                });
                $("#btnSave").click(function(){

                    var res=$("#newAddressForm").serialize();
                    $.ajax({
                        url:'${pageContext.request.contextPath}/admin/newaddress',
                        datatype:'JSON',
                        method:'POST',
                        data:res,
                        success:function(dataJson){
                            window.location.reload();
                        },
                        error:function(){

                        }

                    });

                });
            });
    
    
    </script>
    
    
    
   

    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	
	
	<div class="wrap round-block">
	  <div class="line-title">
                   当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 预约商户
      </div>
	
	  
	   <div class="shopcart-panel">
         <div class="title">在线预约</div>
         <div class="content">
         
             <table class="table table-bordered">
						<thead>
							<tr>
								<th width="150">
									图片
								</th>
								<th width="300">商品信息</th>
								<th width="150">单价</th>
								<th width="200">数量</th>
								<th width="200">现价</th>
							</tr>
						</thead>
						<tbody>
						   <%for(ShopcartItem sci :carts.values()) {%>
						   
							<tr>
								<th scope="row">
									<label class="checked-label">
										<div class="img"><img src="${pageContext.request.contextPath}<%=sci.getImgurl() %>"  class="cover"></div>
									</label>
								</th>
								<td>
									<div class="name ep3"><%=sci.getTitle() %></div>
									<div class="type c9">颜色分类：深棕色  尺码：均码</div>
								</td>
								<td>¥<%=sci.getPrice() %></td>
								<td>
								   
								   <%=sci.getCount() %>
									
								</td>
								<td><%=sci.getPrice()*sci.getCount() %></td>
								
							</tr>
							<%} %>
						</tbody>
					</table>
         
         </div>
      </div>
      
      <div class="total-price-panel">
         <div class="pull-left">
                         总金额:<span class="price">${requestScope.totalfee}¥</span>
         </div>
         <div class="pull-right">
            
         </div>
      </div>
      
	  
	    
        <!--addressBegin-->


        <form id="xiadanForm" method="post" action="${pageContext.request.contextPath}/admin/dingdanmanager.do" name="xiadanform">
           
            <div class="address-list clearfix">
                <div class="plus-address">
                    <span data-toggle="modal" data-target="#newAddressDlg" class="btn btn-primary custom-btn"><i class="fa fa-plus"></i>新增地址</span>
                </div>
                <c:forEach var="address" varStatus="status"  items="${listReceaddress}">
                    <c:if test="${status.index==0}">
                        <ul data-shr="${address.shr}" data-addinfo="${address.addinfo}" data-mobile="${address.mobile }" data-postcode="${address.postcode }" class="address-info selected">
                            <div class="add-title">
                                    ${address.title }
                            </div><!-- end title -->
                            <li>${address.shr}</li>
                            <li>${address.addinfo }</li>
                            <li>${address.mobile }</li>
                            <li>${address.postcode}</li>
                        </ul>
                    </c:if>
                    <c:if test="${status.index>0}">
                        <ul data-shr="${address.shr}" data-addinfo="${address.addinfo}" data-mobile="${address.mobile }" data-postcode="${address.postcode }" class="address-info">
                            <div class="add-title">
                                    ${address.title }
                            </div><!-- end title -->
                            <li>${address.shr}</li>
                            <li>${address.addinfo }</li>
                            <li>${address.mobile }</li>
                            <li>${address.postcode}</li>
                        </ul>
                    </c:if>
                </c:forEach>


                <c:if test="${listReceaddress==null||fn:length(listReceaddress)==0}">

                </c:if>

            </div>
            <input type="hidden"  name="forwardurl" value="/e/xiadanresult.jsp"/>
             <input type="hidden"  name="errorurl" value="/e/xiadan.jsp"/>
            <input type="hidden"  name="actiontype" value="save"/>
            <input type="hidden"  name="xdren" value="${sessionScope.huiyuan.accountname}"/>
            <input  name="shrname"    type="hidden" value="${defaultAddress.shr}"  />
            <input  name="shrtel"     type="hidden" value="${defaultAddress.mobile}" />
            <input  name="shraddress" type="hidden" value="${defaultAddress.addinfo }" />
            <input  name="postcode" type="hidden" value="${defaultAddress.postcode }" />
            <table class="grid" width="100%"   cellpadding="0" cellspacing="0">

                <tr>
                    <td width="15%" align="right" height="34px">
                        说明:
                    </td>
                    <td>
                         <textarea  style="width:500px;height:80px;" name="des">
                         </textarea>
                    </td>
                </tr>




                <tr>
                    <td colspan="2" height="34px">

                        <button id="btnXiadan"  class="btn btn-primary custom-btn"><i class="fa fa-plus"></i>下单结算</button>

                        <a class="btn btn-primary custom-btn" href="${pageContext.request.contextPath}/e/index.jsp">继续选物品</a>

                    </td>

                </tr>




            </table>


        </form>


        <!--addressEnd--->


	
	</div>
	
	
	
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



    <form id="newAddressForm">
        <input type="hidden" name="hyaccount" value="${sessionScope.huiyuan.accountname}"/>
        <div class="modal fade" id="newAddressDlg">
            <div class="modal-dialog">
                <div class="modal-content" >

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">新增地址</h4>
                    </div>
                    <div class="modal-body" >


                        <div class="form-group">
                            <label>收货人</label>
                            <input type="text" class="form-control" name="shr" value="${sessionScope.huiyuan.name}"  placeholder="收货人"/>
                        </div>



                        <div class="form-group">
                            <label>联系电话</label>
                            <input type="text" class="form-control" name="mobile" value="${sessionScope.huiyuan.mobile}"  placeholder="联系电话"/>
                        </div>



                        <div class="form-group">
                            <label>邮编</label>
                            <input type="text" class="form-control" name="postcode"   placeholder="邮编"/>
                        </div>



                        <div class="form-group">
                            <label>地址</label>
                            <input type="text" class="form-control" name="addinfo"   placeholder="地址"/>
                        </div>


                        <div class="form-group">
                            <label>备注标题</label>
                            <input type="text" class="form-control" name="title"   placeholder="请输入标题"/>
                        </div>




                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary custom-btn" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
                        <button type="button" id="btnSave"  class="btn btn-primary custom-btn"><i class="fa fa-save"></i>保存</button>
                    </div>
                </div>
            </div>
        </div>
    </form>


</body>
</html>