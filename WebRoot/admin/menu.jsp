<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

    $(function () {

       
        $(".sidebar-content .sidebar-item .sidebar-title").click(function () {

            var $this = $(this);
            
            //内容面板
            var target = $this.closest(".sidebar-item").children(".sidebar-trans");
            var iconbar =$this.find(".sidebar-title-icon");
            
            if (target.is(":visible")) {
                
                if (iconbar.hasClass("fa-arrow-circle-down"))
                    iconbar.removeClass("fa-arrow-circle-down");
                if (!iconbar.hasClass("fa-arrow-circle-up"))
                    iconbar.addClass("fa-arrow-circle-up");
                
            } else {
                if (iconbar.hasClass("fa-arrow-circle-up"))
                    iconbar.removeClass("fa-arrow-circle-up");
                if (!iconbar.hasClass("fa-arrow-circle-down"))
                    iconbar.addClass("fa-arrow-circle-down");
                
            }
            target.toggle();
            $(".sidebar-content .sidebar-item .sidebar-trans").not(target).hide();

        });
        $(".sidebar-content .sidebar-item .nav-title a").click(function () {
        	$(".sidebar-content .sidebar-item li").removeClass("active");
        	$(this).closest("li").addClass("active");
        	
        });
        
       
          
         $(".sidebar-trans").hide().eq(0).show();
          
        

    });

</script>
<div id="accordion" class="sidebar-content">

   <div class="sidebar-item">
        <div class="sidebar-title">


            <span class="sidebar-title-icon  fa fa-arrow-circle-down"></span>
            <span class="sider-bar-title-text">商品管理</span>

        </div>
        <ul class="sidebar-trans fn-show">
            <li>

                <div class="sidebar-navtext">
                    <div class="nav-icon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <span class="nav-title">
                       <a target="main" href="${pageContext.request.contextPath}/admin/shangpinmanager.do?actiontype=get">商品管理</a>

                    </span>

                </div>
            </li>
           

            <li>

                <div class="sidebar-navtext">
                    <div class="nav-icon">
                        <span class="fa fa-user-plus"></span>
                    </div>
                    <span class="nav-title">

                        <a target="main" href="${pageContext.request.contextPath}/admin/dingdanmanager.do?actiontype=get">订单管理</a>

                    </span>

                </div>
            </li>
            
             <li>

                <div class="sidebar-navtext">
                    <div class="nav-icon">
                        <span class="fa fa-user-plus"></span>
                    </div>
                    <span class="nav-title">

                        <a target="main" href="${pageContext.request.contextPath}/admin/xiaoshoutongjitext.jsp">销售统计</a>

                    </span>

                </div>
            </li>
            
             
            <li>

                <div class="sidebar-navtext">
                    <div class="nav-icon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <span class="nav-title">
                       <a target="main" href="${pageContext.request.contextPath}/admin/caigoumanager.do?actiontype=get">采购管理</a>

                    </span>

                </div>
            </li>
             <li>

                <div class="sidebar-navtext">
                    <div class="nav-icon">
                        <span class="fa fa-user-plus"></span>
                    </div>
                    <span class="nav-title">

                        <a target="main" href="${pageContext.request.contextPath}/admin/supplyormanager.do?actiontype=get">供应商管理</a>

                    </span>

                </div>
            </li>
           

        </ul>


    </div>
    
    <div class="sidebar-item">
        <div class="sidebar-title">


            <span class="sidebar-title-icon  fa fa-arrow-circle-down"></span>
            <span class="sider-bar-title-text">字典管理</span>

        </div>
        <ul class="sidebar-trans fn-show">
            <li>

                <div class="sidebar-navtext">
                    <div class="nav-icon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <span class="nav-title">
                       <a target="main" href="${pageContext.request.contextPath}/admin/duixiangmanager.do?actiontype=get">适合对象管理</a>

                    </span>

                </div>
            </li>
            
             
            
            <li>

                <div class="sidebar-navtext">
                    <div class="nav-icon">
                        <span class="fa fa-user-plus"></span>
                    </div>
                    <span class="nav-title">

                        <a target="main" href="${pageContext.request.contextPath}/admin/spcategorymanager.do?actiontype=get&forwardurl=/admin/spcategorytreemanager.jsp">商品类别管理</a>

                    </span>

                </div>
            </li>
            
           
             <li>

                <div class="sidebar-navtext">
                    <div class="nav-icon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <span class="nav-title">
                       <a target="main" href="${pageContext.request.contextPath}/admin/sptagmanager.do?actiontype=get">商品标签管理</a>

                    </span>

                </div>
            </li>
            
           


        </ul>


    </div>


             <div class="sidebar-item">
                <div class="sidebar-title">


                    <span class="sidebar-title-icon fa fa-arrow-circle-up"></span>
                    <span class="sider-bar-title-text">网站信息</span>

                </div>
                <ul class="sidebar-trans">

                    <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa  fa-database"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/jiaodiantumanager.do?actiontype=get">首页轮播图设置</a>
                            </span>

                        </div>
                    </li>

                    <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa fa-cog"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/sitenavmanager.do?actiontype=get">网站导航设置</a>

                            </span>

                        </div>
                    </li>
                    
                     <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa fa-cog"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/indexcolumnsmanager.do?actiontype=get">首页栏目设置</a>

                            </span>

                        </div>
                    </li>
                    
                     <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa fa-cog"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=get">系统公告管理</a>

                            </span>

                        </div>
                    </li>
                    
                     <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa fa-cog"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/leavewordmanager.do?actiontype=get">留言管理</a>

                            </span>

                        </div>
                    </li>
                    
                    
                      <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa fa-cog"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/minganmanager.do?actiontype=get">敏感词管理</a>

                            </span>

                        </div>
                    </li>
                    
                    
                    <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa fa-cog"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/questionsetmanager.do?actiontype=get">密保问题设置</a>

                            </span>

                        </div>
                    </li>
                    
                     <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa fa-cog"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/friendlinkmanager.do?actiontype=get">友情链接</a>

                            </span>

                        </div>
                    </li>
                    
                    

                </ul>


            </div>
            
            
            <div class="sidebar-item">
                <div class="sidebar-title">


                    <span class="sidebar-title-icon fa fa-arrow-circle-up"></span>
                    <span class="sider-bar-title-text">账户设置</span>

                </div>
                <ul class="sidebar-trans">

                     <li>

                <div class="sidebar-navtext">
                    <div class="nav-icon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <span class="nav-title">
                        <a target="main"  href="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get">后台用户管理</a>

                    </span>

                </div>
            </li>

            <li>

                <div class="sidebar-navtext">
                    <div class="nav-icon">
                        <span class="fa fa-user-plus"></span>
                    </div>
                    <span class="nav-title">

                        <a target="main"  href="${pageContext.request.contextPath}/admin/huiyuanmanager.do?actiontype=get">会员管理</a>

                    </span>

                </div>
            </li>
            
              
                   
                    <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa  fa-database"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/modifypw.jsp">修改密码</a>
                            </span>

                        </div>
                    </li>

                    <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa fa-cog"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/modifyinfo.jsp">修改账户</a>

                            </span>

                        </div>
                    </li>
                    
                     <li>

                        <div class="sidebar-navtext">
                            <div class="nav-icon">
                                <span class="fa fa-cog"></span>
                            </div>
                            <span class="nav-title">
                                <a target="main" href="${pageContext.request.contextPath}/admin/accountinfo.jsp">账户查看</a>

                            </span>

                        </div>
                    </li>
                    
                   

                </ul>


            </div>
            
            

    </div>


