<%@include file="law.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<% int pageId=2; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>用户管理</title>
   
    
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>

    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />

    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js"
			type="text/javascript"></script>
	<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要注销的用户");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             $.dialog.confirm("你确定要注销改用户信息?", function(){
				             window.location.href=encodeURI('${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=delete&id='+ id);
						  });
						});
					});
					$("#btnCheckAll").click(function() {
						var ischeck = false;
						$(".check").each(function() {
							if ($(this).is(":checked")) {
								$(this).prop("checked", "");
								ischeck = false;
							} else {
								$(this).prop("checked", "true");
								ischeck = true;
							}
						});
						if ($(this).text() == "选择记录")
							$(this).text("取消选择");
						else
							$(this).text("选择记录");
					})
	});
</script>
</head>
<body>


           <div class="search-title">
                <h2>
                                                后台用户管理
                </h2>
                <div class="description">
                    <a href="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=load&seedid=101">新建后台用户</a>
                </div>
            </div>
            
               <div class="search-options">
               <form id="searchForm" action="${pageContext.request.contextPath}/admin/usersmanager.do" method="post">
               <input type="hidden"  name="actiontype" value="get"/>
               
               
                <div class="pt-15 fn-clear">
                    <div class="search-form-item fn-left">
                        <label class="search-form-label">
                                                                用户名:</label>
                        <div class="search-form-item-content">
                            <input id="txtUsername" type="text" name="username" value="${username}" runat="server" class="input-txt" />
                        </div>
                    </div>
                    
                    <div class="search-form-item fn-left">
                       <div class="ui-button">
                        <input  class="ui-button-text" value="搜索"  type="submit" />
                        </div>
                    </div>
               </div>
                  
               
              </form>
            </div>
            <div class="action-details">

				<span id="btnCheckAll" class="orange-href">选择
				</span> 
				<span id="btnDelete" class="orange-href">删除
				</span>

			</div>
                
            
            <table id="module" width="100%" border="0" cellspacing="0"
						cellpadding="0" class="ui-record-table">
						<thead >
							<tr>
								<th>
									选择
								</th>
								<th>
									<b>用户名</b>
								</th>
								
								
								<th>
									<b>创建人</b>
								</th>
								<th>
									<b>创建时间</b>
								</th>
								<th>
									<b>绑定邮箱</b>
								</th>
								<th>
									<b>电话</b>
								</th>
								<th>
									<b>登录次数</b>
								</th>
								<th>
									<b>真名</b>
								</th>
								<th>
									<b>昵称</b>
								</th>
								<th>
									<b>性别</b>
								</th>
								
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${usersList== null || fn:length(usersList) == 0}">
								<tr>
									<td colspan="20">
										没有相关系统用户信息
									</td>
								</tr>
							</c:if>
							<c:forEach var="temusers" items="${usersList}">
								<tr>
									<td>
										&nbsp
										<input id="chk${temusers.id}" class="check"
											name="chk${temusers.id}" type="checkbox"
											value='${temusers.id}'>
									</td>
									<td>
										${temusers.username}
									</td>
									
									
									<td>
										${temusers.creator}
									</td>
									<td>
										  <fmt:formatDate  value="${temusers.createtime}" pattern="yyyy-MM-dd" />
									</td>
									<td>
										${temusers.email}
									</td>
									<td>
										${temusers.tel}
									</td>
									<td>
										${temusers.logtimes}
									</td>
									<td>
										${temusers.realname}
									</td>
									<td>
										${temusers.nickname}
									</td>
									<td>
										${temusers.sex}
									</td>
									
									<td>
										<a class="orange-href"
											href="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=load&id=${temusers.id}">修改</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="clear"></div>
					<daowen:pager id="pager1" attcheform="searchForm" />
     
    

</body>
</html>