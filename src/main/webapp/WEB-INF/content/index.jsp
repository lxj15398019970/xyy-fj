<%@ page import="net.esoar.modules.security.springsecurity.SpringSecurityUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"/>

    <meta charset="UTF-8">

    <title>分拣系统平台DEMO显示</title>

    <!-- Dwz start -->
    <link href="${ctx }/static/dwz/themes/default/style.css?var=${jsTime}"
          rel="stylesheet" type="text/css" media="screen"/>
    <link href="${ctx }/static/dwz/themes/css/core.css?var=${jsTime}" rel="stylesheet"
          type="text/css" media="screen"/>
    <link href="${ctx }/static/dwz/themes/css/print.css?var=${jsTime}" rel="stylesheet"
          type="text/css" media="print"/>
    <link href="${ctx }/static/dwz/uploadify/css/uploadify.css?var=${jsTime}"
          rel="stylesheet" type="text/css" media="screen"/>
    <link href="${ctx }/static/dwz/themes/default/font-awesome.css?var=${jsTime}"
          rel="stylesheet" type="text/css" media="screen"/>
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
        <div id="navMenu">
            <h1 id="logo">直销管家</h1>
            <ul>
                <security:authorize ifAnyGranted="ROLE_系统管理">
                    <li class="top-menu"><a href="${ctx}/main.action?type=user"><span>系统管理</span></a></li>
                </security:authorize>

                <security:authorize ifAnyGranted="ROLE_代理商管理">
                    <li class="top-menu"><a href="${ctx}/main.action?type=agent"><span>代理商管理</span></a></li>
                </security:authorize>
                <security:authorize ifAnyGranted="ROLE_行政区管理">
                    <li class="top-menu"><a href="${ctx}/main.action?type=dict"><span>行政区域管理</span></a></li>
                </security:authorize>

                <security:authorize ifAnyGranted="ROLE_产品管理">
                    <li class="top-menu"><a href="${ctx}/main.action?type=production"><span>产品管理</span></a></li>
                </security:authorize>

                <security:authorize ifAnyGranted="ROLE_订单管理">
                    <li class="top-menu"><a href="${ctx}/main.action?type=order"><span>订单管理</span></a></li>
                </security:authorize>

                <security:authorize ifAnyGranted="ROLE_订单配送管理">
                    <li class="top-menu"><a href="${ctx}/main.action?type=assign"><span>订单配送管理</span></a></li>
                </security:authorize>

                <security:authorize ifAnyGranted="ROLE_退货管理">
                    <li class="top-menu"><a href="${ctx}/main.action?type=tui"><span>退货管理</span></a></li>
                </security:authorize>


                <security:authorize ifAnyGranted="ROLE_订单备份管理">
                    <li class="top-menu"><a href="${ctx}/main.action?type=backup"><span>订单备份管理</span></a></li>
                </security:authorize>

                <security:authorize ifAnyGranted="ROLE_直销统计">
                    <li class="top-menu"><a href="${ctx}/main.action?type=statistic"><span>直销统计</span></a></li>
                </security:authorize>
            </ul>
            <p class="text-right">
                欢迎您<%=SpringSecurityUtils.getCurrentUserName()%><a href="${ctx}/j_spring_security_logout"><span
                    style="color:#fff">[退出登陆]</span></a>
            </p>
        </div>
    </div>

    <div id="leftside">

        <div id="sidebar">

            <%@include file="dwz-menu.jsp" %>

        </div>
    </div>
    <%--<div id="container">--%>
    <%--<div id="navTab" class="tabsPage">--%>
    <%--<ul class="tabsMoreList">--%>
    <%--<li><a href="javascript:;">我的主页</a></li>--%>
    <%--</ul>--%>
    <%--<div class="navTab-panel tabsPageContent layoutBox">--%>
    <%--<div class="page unitBox">--%>
    <%--<div class="accountInfo">--%>
    <%--<p>--%>
    <%--<span>欢迎使用分拣系统</span>--%>
    <%--</p>--%>
    <%--</div>--%>
    <%--<div class="pageFormContent" layoutH="80"--%>
    <%--style="margin-right: 230px"></div>--%>
    <%--<div style="width: 230px; position: absolute; top: 60px; right: 0"--%>
    <%--layoutH="80"></div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>

    <%--</div>--%>
    <div id="container">
        <div id="navTab" class="tabsPage">
            <div class="tabsPageHeader" style="display: none;">
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


<div id="footer">Copyright &copy; 2010 <a href="#" target="dialog">lxj</a></div>


</body>
</html>