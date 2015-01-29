<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="net.esoar.modules.security.springsecurity.SpringSecurityUtils" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=7"/>
    <title>分拣系统平台DEMO显示</title>

    <!-- Dwz start -->
    <link href="${ctx }/static/dwz/themes/default/style.css?var=${jsTime}"
          rel="stylesheet" type="text/css" media="screen" />
    <link href="${ctx }/static/dwz/themes/css/core.css?var=${jsTime}" rel="stylesheet"
          type="text/css" media="screen" />
    <link href="${ctx }/static/dwz/themes/css/print.css?var=${jsTime}" rel="stylesheet"
          type="text/css" media="print" />
    <link href="${ctx }/static/dwz/uploadify/css/uploadify.css?var=${jsTime}"
          rel="stylesheet" type="text/css" media="screen" />
    <link href="${ctx }/static/dwz/themes/default/font-awesome.css?var=${jsTime}"
          rel="stylesheet" type="text/css" media="screen" />
    <!-- Dwz end -->

    <!--[if IE]>
    <link href="${ctx }/static/dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
    <![endif]-->
    <!--[if lte IE 9]>
    <script src="${ctx }/static/dwz/js/speedup.js" type="text/javascript"></script>
    <script src="${ctx}/static2/bootstrap/2.3.2/js/html5shiv.js"></script>
    <![endif]-->

    <script src="${ctx }/static/dwz/js/jquery-1.7.2.js"
            type="text/javascript"></script>
    <script src="${ctx }/static/dwz/js/jquery.cookie.js?var=${jsTime}"
            type="text/javascript"></script>
    <script src="${ctx }/static/dwz/js/jquery.validate.js?var=${jsTime}"
            type="text/javascript"></script>
    <script src="${ctx }/static/dwz/js/jquery.bgiframe.js?var=${jsTime}"
            type="text/javascript"></script>
    <script src="${ctx }/static/dwz/js/dwz.min.js" type="text/javascript"></script>
    <script src="${ctx }/static/dwz/js/dwz.regional.zh.js?var=${jsTime}"
            type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap/2.3.2/js/jquery-print.js"></script>


    <!--底部结束-->
    <script src="${ctx }/static/dwz/xheditor/xheditor-1.2.1.min.js"
            type="text/javascript"></script>
    <script src="${ctx }/static/dwz/xheditor/xheditor_lang/zh-cn.js"
            type="text/javascript"></script>
    <script
            src="${ctx }/static/dwz/uploadify/scripts/jquery.uploadify.min.js"
            type="text/javascript"></script>
    <script type="text/javascript"
            src="${ctx }/static/sea-modules/My97DatePicker/WdatePicker.js"></script>
    <!-- 来自百度CDN -->
    <script src="${ctx }/static/sea-modules/esl.js?var=${jsTime}" type="text/javascript"></script>



    <script type="text/javascript">
        $(function () {
            DWZ.init("dwz.frag.xml", {
//		loginUrl:"loginsub.html", loginTitle:"登录",	// 弹出登录对话框
                loginUrl: "login.action",	// 跳到登录页面
                debug: false,	// 调试模式 【true|false】
                callback: function () {
                    initEnv();
                    $("#themeList").theme({themeBase: "themes"});
                }
            });
        });
        //清理浏览器内存,只对IE起效,FF不需要
        if ($.browser.msie) {
            window.setInterval("CollectGarbage();", 10000);
        }
    </script>
</head>

<body scroll="no">
<div id="layout">
    <div id="header">
        <div class="headerNav">
            <!-- LOGO图片 -->
            <!--
            <a class="logo" href="javascript:void(0)">标志</a>
            -->
            <ul class="nav">
                <li><a>你好, <%=SpringSecurityUtils.getCurrentUserName()%>
                </a></li>
                <li><a href="#" target="dialog">设置</a></li>
                <li><a href="${ctx}/j_spring_security_logout">退出</a></li>
            </ul>

        </div>
    </div>

    <div id="leftside">
        <div id="sidebar_s">
            <div class="collapse">
                <div class="toggleCollapse">
                    <div></div>
                </div>
            </div>
        </div>
        <div id="sidebar">
            <div class="toggleCollapse">

                <div>收缩</div>
            </div>
            <%@include file="dwz-menu.jsp"%>
            <%--<div class="accordion" fillSpace="sideBar">--%>
                <%--<div class="accordionHeader">--%>
                    <%--<h2><span>Folder</span>系统权限</h2>--%>
                <%--</div>--%>
                <%--<div class="accordionContent">--%>
                    <%--<ul class="tree treeFolder">--%>
                        <%--<li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">角色管理</a></li>--%>
                        <%--<li><a href="${ctx}/account/user.action" target="navTab" rel="w_user">用户管理</a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>


                <%--<div class="accordionHeader">--%>
                    <%--<h2><span>Folder</span>行政区信息管理</h2>--%>
                <%--</div>--%>
                <%--<div class="accordionContent">--%>
                    <%--<ul class="tree treeFolder">--%>
                        <%--<li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">行政区信息</a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>


                <%--<div class="accordionHeader">--%>
                    <%--<h2><span>Folder</span>产品信息管理</h2>--%>
                <%--</div>--%>
                <%--<div class="accordionContent">--%>
                    <%--<ul class="tree treeFolder">--%>
                        <%--<li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">产品信息信息</a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>


            <%--</div>--%>

        </div>
    </div>
    <%--<div id="container">--%>
        <%--<div id="navTab" class="tabsPage">--%>
            <%--<div class="tabsPageHeader">--%>
                <%--<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->--%>
                    <%--<ul class="navTab-tab">--%>
                        <%--<li tabid="main" class="main"><a href="javascript:void(0)"><span><span--%>
                                <%--class="home_icon">我的主页</span></span></a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
                <%--<div class="tabsLeft">left</div>--%>
                <%--<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->--%>
                <%--<div class="tabsRight">right</div>--%>
                <%--<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->--%>
                <%--<div class="tabsMore">more</div>--%>
            <%--</div>--%>
            <%--<ul class="tabsMoreList">--%>
                <%--<li><a href="javascript:void(0)">我的主页</a></li>--%>
            <%--</ul>--%>
            <%--<div class="navTab-panel tabsPageContent">--%>
                <%--<div>--%>
                    <%--<div class="accountInfo">--%>
                        <%--<div class="right">--%>
                            <%--<p><a href="#" target="_blank" style="line-height:19px">欢迎使用</a></p>--%>
                        <%--</div>--%>
                        <%--<p><a href="#" target="dialog">欢迎使用</a></p>--%>
                    <%--</div>--%>


                    <%--<div class="divider"></div>--%>
                    <%--<h2>联系方式:</h2>--%>

                    <%--<p style="color:red"></p>--%>
                <%--</div>--%>

            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div id="container">
        <div id="navTab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent">
                    <!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                    <ul class="navTab-tab">
                        <li tabid="main" class="main"><a href="javascript:;"><span>我的主页</span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft">left</div>
                <!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
                <div class="tabsRight">right</div>
                <!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
                <div class="tabsMore">more</div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">我的主页</a></li>
            </ul>
            <div class="navTab-panel tabsPageContent layoutBox">
                <div class="page unitBox">
                    <div class="accountInfo">
                        <p>
                            <span>欢迎使用分拣系统</span>
                        </p>
                    </div>
                    <div class="pageFormContent" layoutH="80"
                         style="margin-right: 230px"></div>
                    <div style="width: 230px; position: absolute; top: 60px; right: 0"
                         layoutH="80"></div>
                </div>
            </div>
        </div>

    </div>
</div>


<div id="footer">Copyright &copy; 2010 <a href="http://www.jlusoft.com" target="dialog">JluSoft</a></div>


</body>
</html>