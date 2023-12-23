<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="com.daowen.util.*" %>
<%@page import="com.daowen.entity.*"%>
<%@page import="com.daowen.service.*"%>
<%@page import="com.daowen.uibuilder.*"%>
 <%   
   
      String gcommentbelongid=request.getParameter("id");
      
      String commenttype=request.getParameter("commenttype");
 
 
  %>
  
      <script type="text/javascript">
         
              $(function(){
                
            	  $("[name=dcontent]").keydown(function(){
            		 
            		  var maxLength= $(this).attr("maxlength");
            		  
            		  var hasInputed=$(this).val().length;
            		  
            		  if(hasInputed<maxLength);{
            			  
            			  $("#hasInputedCount").html(hasInputed);
            			  $("#removeCount").html(maxLength-hasInputed);
            			  
            			  
            		  }
            		  
            		  
            	  });
                  $("#btnComment").click(function(){
                      var temaccountname= $("#hidCurrenthy").val();
                      var temreturnurl=$("#commentresurl").val();
                     
                      var temdcontent=$("[name=dcontent]").val();
                      $("#forwardurl").val(temreturnurl);
                     
                      
                      if(temaccountname==""){
                         
                         window.location.href="${pageContext.request.contextPath}/e/login.jsp?reurl="+temreturnurl;
                         return false;
                        
                      }
                    
                      if(temdcontent==""){
                          alert("请填写评论内容");
                          return false;
                      }
                      if(temdcontent.length<8){
                       
                           alert("评论内容至少8个字符");
                           return false;
                      }
                     
                  });

              })
        
     </script>



   <div class="comment-box">
			<div class="comment-list">
				
				<%=new CommentBuilder(request).getComments(commenttype,gcommentbelongid) %>
				
			</div>

			<div class="comment-container">
			   <div class="inner-container">
			    <form id="commentForm" method="post"
					action="${pageContext.request.contextPath}/admin/commentmanager.do">
			     
					
					<input type="hidden" name="actiontype" value="save"/>
					 <input type="hidden"   name="belongid"  value="<%=gcommentbelongid%>"/>
                     <input type="hidden"  name="type"   value="<%=commenttype%>"/>
					<input type="hidden" id="hidCurrenthy" name="currenthy" value="${huiyuan.accountname}"/>
					<input type="hidden" name="photo" value="${huiyuan.touxiang}"/>
			        <input name="forwardurl" type="hidden" id="forwardurl"  value=""/>
			       <div class="comment-message">
			          
					
			           <textarea class="gray-color" name="dcontent" maxlength="200"  placeholder="简短评论"  style="background-color:rgb(255, 255, 255); "></textarea>
			         
			       </div>
			       <div class="comment-action-box">
			          
			           <span class="white-color"><span id="hasInputedCount">0</span>/<strong id="removeCount">210</strong>字</span>
			           <button id="btnComment" class="btn btn-default">评论</button>
			       </div>
			   </form>
			   </div>
			
			</div>
			
			


	</div>
    