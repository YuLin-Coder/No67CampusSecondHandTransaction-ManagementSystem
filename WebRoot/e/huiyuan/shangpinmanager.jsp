<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>商品信息</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
 <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
		<script type="text/javascript">
		$(function() {
		    
			$("#btnShangjia").click(function(){
				var spids = $(".check[type=checkbox]:checked").serialize();
				
				 if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要上架的商品");
			           return;
			        } 
				if(!confirm("你确定要上架这个商品吗")){
					return;
				}
				 $.ajax({
                        url: "${pageContext.request.contextPath}/admin/shangpinmanager.do?actiontype=shangjia",
                        method: 'post',
                        data: spids,

                        success: function (data) {
                           
                             window.location.reload();
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status + errorThrown);
                        }
                    });
				
				
			});
			
			$("#btnXiajia").click(function(){
				var spids = $(".check[type=checkbox]:checked").serialize();
				 if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要下架的商品");
			           return;
			        } 
				if(!confirm("你确定要下架选择的商品吗")){
					return;
				}
				 $.ajax({
                        url: "${pageContext.request.contextPath}/admin/shangpinmanager.do?actiontype=xiajia",
                        method: 'post',
                        data: spids,

                        success: function (data) {
                           
                           window.location.reload();
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status + errorThrown);
                        }
                    });
				
				
			});
			$(".ui-record-table").recordTable();
			$("#btnDelete").click(function(){
			       var ids = $(".check[type=checkbox]:checked").serialize();
					 if($(".check:checked").length<1)
				        {
				           $.dialog.alert("请选择需要删除条目");
				           return;
				        } 
					if(!confirm("你确定要删除吗")){
						return;
					}
					$.ajax({
			                     url: "${pageContext.request.contextPath}/admin/shangpinmanager.do?actiontype=delete",
			                     method: 'post',
			                     data: ids,
			                     success: function (data) {
			                          window.location.reload();
			                     },
			                     error: function (XMLHttpRequest, textStatus, errorThrown) {
			                         alert(XMLHttpRequest.status + errorThrown);
			                     }
			                 });
			    });
		    $("#btnCheckAll").click(function(){
		           var ischeck=false;
		           $(".check").each(function(){
		               if($(this).is(":checked"))
		               {
		                  $(this).prop("checked","");
		                  ischeck=false;
		                }
		               else
		               {
		                  $(this).prop("checked","true");
		                  ischeck=true;
		                }
		           });
		           if($(this).text()=="选择记录")
		              $(this).text("取消选择");
		           else
		              $(this).text("选择记录");
		    });
           var temsptypeid='${sptypeid}';
           if(temsptypeid!=''){
     			$("#sptype").val(temsptypeid);
			}
			$("[name='sptypeid']").val($("#sptype").children('option:selected').val());
        	$("[name='sptype']").val($("#sptype").children('option:selected').text());
            $("#sptype").change(function(){
            	
            	$("[name='sptypeid']").val($(this).children('option:selected').val());
            	$("[name='sptype']").val($(this).children('option:selected').text());
            });
           
            $("#sptype").val("${sptypeid}");
		});
   </script>
   <style type="text/css">
   
       .dropdown{min-width:120px;height:40px;font-size:16px;}
   </style>
	</head>
	 <body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 商品管理
		</div>
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<!-- 搜索控件开始 -->
				<div class="search-options">
					<form id="searchForm"
						action="${pageContext.request.contextPath}/admin/shangpinmanager.do"
						method="post">
						<input type="hidden" name="actiontype" value="search" />
						 <input type="hidden" name="pubren" value="${huiyuan.accountname }"/>
			             <input type="hidden" name="forwardurl" value="/e/huiyuan/shangpinmanager.jsp"/>
						 <input
							type="hidden" name="seedid" value="${seedid}" />
						<table cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td>商品名称 <input name="name" value="${name}"
										class="input-txt" type="text" /> 商品分类:<input type="hidden"
										name="sptype" /> <input type="hidden" name="sptypeid" /> <web:dropdownlist
											id="sptype" cssclass="dropdown"
											datasource="${sptype_datasource}" textfieldname="mingcheng"
											valuefieldname="id">
										</web:dropdownlist>

										<div class="ui-button">
											<input type="submit" value="搜索" id="btnSearch"
												class="ui-button-text" />
										</div>

									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="action-details">
					<span id="btnCheckAll" class="orange-href">选择</span>
					 <span
						id="btnShangjia" class="orange-href">上架</span> <span
						id="btnXiajia" class="orange-href">下架</span> <span id="btnDelete"
						class="orange-href">删除</span>

				</div>
				<table id="module" width="100%" border="0" cellspacing="0"
					cellpadding="0" class="ui-record-table">
					<thead>
						<tr>
							<th>选择</th>
							<th width="260px;"><b>名称</b></th>

							<th><b>市场价(元)</b></th>

							<th><b>商城价(元)</b></th>
							<th><b>折扣</b></th>
							<th><b>打折</b></th>
							<th><b>状态</b></th>
							<th><b>商品类别</b></th>
							<th><b>库存</b></th>


							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${listshangpin== null || fn:length(listshangpin) == 0}">
							<tr>
								<td colspan="20">没有相关商品信息</td>
							</tr>
						</c:if>
						<c:forEach var="temshangpin" items="${listshangpin}">
							<tr>
								<td>&nbsp<input id="chk${temshangpin.id}" class="check"
									name="ids" type="checkbox" value='${temshangpin.id}' /></td>
								<td>${temshangpin.name}(${temshangpin.spno})</td>

								<td>${temshangpin.jiage}￥</td>
								<td>${temshangpin.hyjia}￥</td>
								<td><fmt:formatNumber
										value="${temshangpin.hyjia/temshangpin.jiage}"
										maxFractionDigits="2" pattern="0.00" /> 折</td>
								<td>${temshangpin.dazhe==1?"打折":"不打折"}</td>
								<td>
								<c:if test="${temshangpin.state==1}">
									已上架
								</c:if> <c:if test="${temshangpin.state==2}">
									已下架
								</c:if>
						
						     </td>
								<td>${temshangpin.sptype}</td>
								<td>${temshangpin.kucun}${temshangpin.danwei}</td>

								<td><a class="orange-href"
									href="${pageContext.request.contextPath}/admin/shangpinmanager.do?actiontype=load&id=${temshangpin.id}&forwardurl=/e/huiyuan/shangpinadd.jsp">修改</a>
                                 <a class="orange-href"
									href="${pageContext.request.contextPath}/e/huiyuan/spcaigou.jsp?seedid=305&id=${temshangpin.id}">采购</a>
									
									<a target="_blank" class="orange-href"
									href="${pageContext.request.contextPath}/e/shangpininfo.jsp?id=${temshangpin.id}">查看</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="clear"></div>
				<daowen:pager id="pager1" attcheform="searchForm" />
			</div>
		</div>
                 </div>
	</body>
	
	<jsp:include page="bottom.jsp"></jsp:include>

	
</html>
