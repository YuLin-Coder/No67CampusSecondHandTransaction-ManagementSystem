<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <header>

        <div class="topbar-head" role="navigation">

            <div class="fn-clear">

                <div class="topbar-left">


                    <div style="width: 550px; height: 50px;padding-left:50px;">
                        <span style="font-family: 微软雅黑; font-weight: bold; line-height: 50px; font-size: 20px; color: #fff; letter-spacing: 3px; border: 0px;">
                                                                    河洛大学城二手系统(管理员)
                        </span>
                    </div>
                    

                </div>

                <div class="topbar-left">
                    <div style="width: 450px;padding-left:50px; height: 50px;line-height:50px;color:white;font-size:16px">
                      
                            
                        

                    </div>
                </div>
                <div class="topbar-right fn-clear">
                   
                  
                 
                    <div class="topbar-item-info">
                        
                        <a class="white" target="_blank" href="${pageContext.request.contextPath}/e/index.jsp">网站预览</a>
                    </div>
                    <div class="topbar-item-info">
                        
                        <a class="white" href="#">帮组与文档</a>
                    </div>
                       <div class="topbar-item-info">
                        <span class="dropdown">

                          
                            <span class="dropdown-toggle" style="cursor:pointer;" data-toggle="dropdown">
                                
                                ${users.username }
                                <i class="caret"></i>
                            </span>
                            <ul class="dropdown-menu" style="z-index:10000" role="menu">
                                <li id="btnExit"><a role="menuitem" tabindex="-1" href="login.jsp">退出</a></li>
                                <li><a role="menuitem" target="main" tabindex="-1" href="${pageContext.request.contextPath}/admin/modifypw.jsp">修改密码</a></li>
                                <li><a role="menuitem" target="main" tabindex="-1" href="${pageContext.request.contextPath}/admin/modifyinfo.jsp">账户信息</a></li>

                            </ul>

                        </span>
                    </div>
                    

                </div>
            </div>

        </div>


    </header>
