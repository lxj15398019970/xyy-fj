<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="net.esoar.modules.security.springsecurity.SpringSecurityUtils" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=7"/>
    <title>分拣系统平台DEMO显示</title>

    <link href="themes/default/style.css" rel="stylesheet" type="text/css"/>
    <link href="themes/css/core.css" rel="stylesheet" type="text/css"/>
    <link href="uploadify/css/uploadify.css" rel="stylesheet" type="text/css"/>
    <!--[if IE]>
    <link href="themes/css/ieHack.css" rel="stylesheet" type="text/css"/>
    <![endif]-->
    <link href="themes/default/font-awesome.css"
          rel="stylesheet" type="text/css" media="screen" />

    <script src="javascripts/speedup.js" type="text/javascript"></script>
    <script src="javascripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="javascripts/jquery.cookie.js" type="text/javascript"></script>
    <script src="javascripts/jquery.validate.js" type="text/javascript"></script>
    <script src="javascripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="xheditor/xheditor-zh-cn.min.js" type="text/javascript"></script>

    <script src="javascripts/dwz.core.js" type="text/javascript"></script>
    <script src="javascripts/dwz.scrollCenter.js" type="text/javascript"></script>
    <script src="javascripts/dwz.validate.method.js" type="text/javascript"></script>
    <script src="javascripts/dwz.regional.zh.js" type="text/javascript"></script>
    <script src="javascripts/dwz.barDrag.js" type="text/javascript"></script>
    <script src="javascripts/dwz.drag.js" type="text/javascript"></script>
    <script src="javascripts/dwz.tree.js" type="text/javascript"></script>
    <script src="javascripts/dwz.accordion.js" type="text/javascript"></script>
    <script src="javascripts/dwz.ui.js" type="text/javascript"></script>
    <script src="javascripts/dwz.theme.js" type="text/javascript"></script>
    <script src="javascripts/dwz.switchEnv.js" type="text/javascript"></script>
    <script src="javascripts/dwz.alertMsg.js" type="text/javascript"></script>
    <script src="javascripts/dwz.contextmenu.js" type="text/javascript"></script>
    <script src="javascripts/dwz.navTab.js" type="text/javascript"></script>
    <script src="javascripts/dwz.tab.js" type="text/javascript"></script>
    <script src="javascripts/dwz.resize.js" type="text/javascript"></script>
    <script src="javascripts/dwz.jDialog.js" type="text/javascript"></script>
    <script src="javascripts/dwz.dialogDrag.js" type="text/javascript"></script>
    <script src="javascripts/dwz.cssTable.js" type="text/javascript"></script>
    <script src="javascripts/dwz.stable.js" type="text/javascript"></script>
    <script src="javascripts/dwz.taskBar.js" type="text/javascript"></script>
    <script src="javascripts/dwz.ajax.js" type="text/javascript"></script>
    <script src="javascripts/dwz.pagination.js" type="text/javascript"></script>
    <!--
    <script src="javascripts/dwz.datepicker.js" type="text/javascript"></script>
    -->
    <!-- 用My97DatePicker代替dwz.datepicker -->
    <script src="javascripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="javascripts/dwz.effects.js" type="text/javascript"></script>
    <script src="javascripts/dwz.panel.js" type="text/javascript"></script>
    <script src="javascripts/dwz.checkbox.js" type="text/javascript"></script>
    <script src="javascripts/dwz.history.js" type="text/javascript"></script>
    <script src="javascripts/dwz.combox.js" type="text/javascript"></script>

    <!--
    <script src="bin/dwz.min.js" type="text/javascript"></script>
    -->

    <script src="javascripts/dwz.regional.zh.js" type="text/javascript"></script>

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
    <div id="container">
        <div id="navTab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                    <ul class="navTab-tab">
                        <li tabid="main" class="main"><a href="javascript:void(0)"><span><span
                                class="home_icon">我的主页</span></span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft">left</div>
                <!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
                <div class="tabsRight">right</div>
                <!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
                <div class="tabsMore">more</div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:void(0)">我的主页</a></li>
            </ul>
            <div class="navTab-panel tabsPageContent">
                <div>
                    <div class="accountInfo">
                        <div class="right">
                            <p><a href="#" target="_blank" style="line-height:19px">欢迎使用</a></p>
                        </div>
                        <p><a href="#" target="dialog">欢迎使用</a></p>
                    </div>


                    <div class="divider"></div>
                    <h2>联系方式:</h2>

                    <p style="color:red"></p>
                </div>

            </div>
        </div>
    </div>
</div>


<div id="footer">Copyright &copy; 2010 <a href="http://www.jlusoft.com" target="dialog">JluSoft</a></div>


</body>
</html>