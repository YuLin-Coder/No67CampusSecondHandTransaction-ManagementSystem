
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="import.jsp"%>
 <div class="fn-clear"></div>
		<div class="frendlink wrap">
			<strong>友情链接：</strong>
			<%=new FriendlinkBuilder().build() %>
			 
		</div>


	<div class="fn-clear"></div>
	<div>
		<div id="footer_bg">
			<div id="footer">河洛大学城二手系统</div>
		</div>
	</div>
	
	


<script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/webui/combo/dropdownaction.js'></script>
<script src="${pageContext.request.contextPath}/webui/jquery-confirm/jquery-confirm.min.js"></script>
<script src="${pageContext.request.contextPath}/webui/jquery-confirm/jquery-confirmex.js"></script>