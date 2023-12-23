<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script  type="text/javascript">
     
   $(function(){

      $("#side-menu .menu-group li").removeClass("current");
     
      var seedid='<%=request.getParameter("seedid")%>';
      
      if(seedid!="null")
         $("#"+seedid).addClass("current");
      else
        $("#m1").addClass("current");
      
   })

</script>
<div id="side-menu">




    
	<div class="menu-group">
		<h2><i class="fa fa-cog"></i>商品管理</h2>
		<ul>
		
		
		
		    <li id="304" >
				<a  href="${pageContext.request.contextPath}/admin/shangpinmanager.do?actiontype=load&seedid=304&forwardurl=/e/huiyuan/shangpinadd.jsp">发布商品</a>
			</li>
		   
		   
		     <li id="305" >
				<a  href="${pageContext.request.contextPath}/admin/shangpinmanager.do?actiontype=get&pubren=${huiyuan.accountname}&seedid=305&forwardurl=/e/huiyuan/shangpinmanager.jsp">我的商品</a>
			</li>
			
			  
		    <li id="306" >
				<a  href="${pageContext.request.contextPath}/admin/qiugoumanager.do?actiontype=get&pubren=${huiyuan.accountname}&forwardurl=/e/huiyuan/qiugoumanager.jsp?seedid=306">我的求购信息</a>
			</li>
			
			<li id="307" >
				<a  href="${pageContext.request.contextPath}/admin/qiugoumanager.do?actiontype=load&forwardurl=/e/huiyuan/qiugouadd.jsp?seedid=307">发布求购信息</a>
			</li>
			
		   
			 <li id="301" >
				<a  href="${pageContext.request.contextPath}/admin/dingdanmanager.do?actiontype=get&shaccount=${huiyuan.accountname}&seedid=301&forwardurl=/e/huiyuan/dingdanmanager.jsp">我的订单</a>
			</li>
			
		</ul>
	</div>
	<div class="menu-group">
		<h2><i class="fa fa-cog"></i>与我相关</h2>
		<ul>
		
		   
		    <li id="401" >
				<a  href="${pageContext.request.contextPath}/admin/dingdanmanager.do?seedid=401&xiadanren=${huiyuan.accountname}&actiontype=get&forwardurl=/e/huiyuan/shopingorder.jsp">购物订单</a>
			</li>
		
			
		
			<li id="402" >
				<a  href="${pageContext.request.contextPath}/admin/leavewordmanager.do?actiontype=get&lwren=${huiyuan.accountname}&forwardurl=/e/huiyuan/leavewordmanager.jsp?seedid=402">我的留言</a>
			</li>
			
			
		    <li id="404" >
				<a  href="${pageContext.request.contextPath}/admin/leavewordmanager.do?actiontype=get&replyren=${sessionScope.huiyuan.accountname}&forwardurl=/e/huiyuan/recemsglist.jsp?seedid=404">我收到的消息</a>
			</li>
				
		    <li id="403" >
				<a  href="${pageContext.request.contextPath}/admin/shoucangmanager.do?actiontype=get&scren=${huiyuan.accountname}&seedid=403&forwardurl=/e/huiyuan/shoucangmanager.jsp">我的收藏夹</a>
			</li>
			
			
			
		</ul>
	</div>
	
		
<div class="menu-group">
		<h2><i class="fa fa-cog"></i>安全中心 </h2>
		<ul>
			<li id="203">
				<a href="${pageContext.request.contextPath}/e/huiyuan/modifypw.jsp?seedid=203" target="_self">登录密码修改</a>
			</li>
		
		    <li id="201">
				<a href="${pageContext.request.contextPath}/admin/secquestionmanager.do?seedid=201&actiontype=load&forwardurl=/e/huiyuan/secquestionadd.jsp" target="_self">录入密保问题</a>
			</li>
			
			<li id="202">
				<a href="${pageContext.request.contextPath}/admin/secquestionmanager.do?seedid=202&accountname=${huiyuan.accountname }&actiontype=get&forwardurl=/e/huiyuan/secquestionmanager.jsp" target="_self">我的密保问题</a>
			</li>
			
		</ul>
	</div>
	
	<div class="menu-group">
		<h2>
			<i class="fa fa-info"></i>账户信息
		</h2>
		<ul>
			<li id="101" class="current">
				<a  href="${pageContext.request.contextPath }/e/huiyuan/accountinfo.jsp?seedid=101">账户信息</a>
			</li>
			<li id="104" >
				<a  href="${pageContext.request.contextPath }/admin/receaddressmanager.do?actiontype=get&hyaccount=${sessionScope.huiyuan.accountname}&forwardurl=/e/huiyuan/receaddressmanager.jsp&seedid=104">收货地址</a>
			</li>
			<li id="102">
				<a href="${pageContext.request.contextPath }/e/huiyuan/yue.jsp?seedid=102" target="_self">账户余额</a>
			</li>
			<li id="103">
				<a href="${pageContext.request.contextPath }/e/huiyuan/modifyinfo.jsp?seedid=103" target="_self">信息修改</a>
			</li>
         
		</ul>
	</div>




</div>