<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="law.jsp"%>
<html>
  <head>
    <title>后台用户中心</title>
   <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
   <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
   <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
   <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/layout.css" rel="stylesheet" type="text/css" />
     <script  type="text/javascript">
             $(function(){
                    $.metadata.setType("attr","validate");
                    $("#form1").validate();
             });
    </script>
  </head>
  <body >
    	  <div class="search-title">
		      <h2>修改密码</h2>
		<div class="description">
		</div>
	</div>
	<form name="form1" class="form-horizontal" action="${pageContext.request.contextPath}/admin/usersmanager.do"  id="form1" method="post"  >
                  <input type="hidden" name="actiontype" value="modifyPw"/>
				  <input type="hidden"  name="id" value="${users.id}"/>
				  <input type="hidden"  name="forwardurl"  value="/admin/accountinfo.jsp?seedid=101"/>
				  <input type="hidden"  name="errorpageurl"  value="/admin/modifypw.jsp?seedid=101"/>
                <table border="0" cellspacing="1"  class="grid" cellpadding="0" width="100%" >
                <tr>
                   <td colspan="2">
                      ${errormsg}
                   </td>
                </tr>
                <tr>
                      <td align="right" >原始密码 :</td>
                      <td align="left" >
                        <input name="password1"  type="password" id="password1" class="input-txt" validate="{required:true,messages:{required:'请输入密码'}}" />
                      </td>
                  </tr>
                 <tr>
                      <td align="right">修改密码 :</td>
                      <td align="left" >
                        <input name="repassword1"   type="password" id="repassword1" class="input-txt" validate="{required:true,messages:{required:'请输入确定密码'}}" />
                      </td>
                  </tr>
                   <tr>
                      <td align="right" >确认密码 :</td>
                      <td align="left">
                        <input name="repassword2"  type="password" id="repassword2" class="input-txt" validate="{required:true,equalTo:'#repassword1',messages:{required:'请输入确定密码',equalTo:'两次密码不一致'}}" />
                      </td>
                  </tr>
                   <tr>
						        <td colspan="4">
						                <div class="ui-button">
											<button class="ui-button-text"><i class="icon-ok icon-white"></i>修改密码</button>
									     </div>
						       </td>
				  </tr>
              </table>
          </form>
  </body>
</html>
