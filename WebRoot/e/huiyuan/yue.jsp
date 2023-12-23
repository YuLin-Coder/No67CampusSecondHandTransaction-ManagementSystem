
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    HuiyuanService huiyuanSrv=BeansUtil.getBean("huiyuanService",HuiyuanService.class);
    Huiyuan huiyuan=(Huiyuan)request.getSession().getAttribute("huiyuan");
    if(huiyuan!=null){
    	huiyuan=huiyuanSrv.load("where id="+huiyuan.getId());
    	request.getSession().setAttribute("huiyuan", huiyuan);
    }

%>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/web2table.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>

	<script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
	<script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
	<script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
<script type="text/javascript">
     
   $(function(){
	   
	   $("#btnChongzhi").click(function(){
		   $(".shang_box").fadeToggle();
	   });
	   
	   $(".pay_item").click(function(){
   		  $(this).addClass('checked').siblings('.pay_item').removeClass('checked');
   		   var dataid=$(this).attr('data-id');
   		   $(".shang_payimg img").attr("src","${pageContext.request.contextPath}/e/images/"+dataid+"img.jpg");
   		  $("#shang_pay_txt").text(dataid=="alipay"?"支付宝":"微信");
   	   });
	   $("#btnClose").click(function(){
		   $(".shang_box").fadeToggle();
	   });
       $.metadata.setType("attr","validate");
       $("#chongzhiForm").validate();
	   
	   
   });
   
</script>




</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
    <div class="fn-clear"></div>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 账户余额
		</div>
	
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					
					
				    <div style="padding:30px;font-size:18px;">
				                   当前账户余额<span style="font-size:24px;font-weight:800;color:#f00;">${huiyuan.yue}￥</span>
				                   
				                  <a id="btnChongzhi" class="btn btn-primary">我要充值</a>
				                   
				    </div>

				<div class="shang_box">
				   <form name="chongzhiForm"
							action="${pageContext.request.contextPath}/admin/huiyuanmanager.do"
							id="chongzhiForm" method="post">
					<a class="shang_close" href="javascript:void(0)" id="btnClose"
						title="关闭"><img
						src="${pageContext.request.contextPath}/e/images/close.jpg"
						alt="取消" /></a> <img class="shang_logo"
						src="${pageContext.request.contextPath}/e/images/logos.png"
						alt="金林苑" />
					<div class="shang_tit">
						<p> 充值金额:<input name="jine" style="width:80px" validate="{required:true,number:true,messages:{required:'请填写充值金额',number:'请填写正确充值金额'}}" type="text"id="txtJine" class="input-txt" />元</p>
					</div>
					<div class="shang_payimg">
						<img
							src="${pageContext.request.contextPath}/e/images/alipayimg.jpg"
							alt="扫码支持" title="扫一扫" />
					</div>
					<div class="pay_explain">扫码充值,充多少就多少</div>
					<div class="shang_payselect">
						<div class="pay_item checked" data-id="alipay">
							<span class="radiobox"></span> <span class="pay_logo"><img
								src="${pageContext.request.contextPath}/e/images/alipay.jpg"
								alt="支付宝" /></span>
						</div>
						<div class="pay_item" data-id="weipay">
							<span class="radiobox"></span> <span class="pay_logo"><img
								src="${pageContext.request.contextPath}/e/images/wechat.jpg"
								alt="微信" /></span>
						</div>
					</div>
					<div class="shang_info">
						<p>
							打开<span id="shang_pay_txt">支付宝</span>扫一扫，即可进行充值
						</p>
					</div>
					<div>
						
							<input type="hidden" name="id" value="${huiyuan.id}" /> <input
								type="hidden" name="actiontype" value="chongzhi" /> 
								<input type="hidden"
								name="forwardurl" value="/e/huiyuan/chongzhiresult.jsp" /> <input
								type="submit" value="充值" class="dashang">
						
					</div>

                  </form>

				</div>





			</div>
			
		</div>
		
   </div>
   

	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>