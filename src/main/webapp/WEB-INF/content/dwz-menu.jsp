<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script src="${ctx}/static/dwz/js/app.js" type="text/javascript"></script>
<div class="accordion" fillSpace="sidebar">
<div class="accordionContent page-sidebar">
    <ul class="page-sidebar-menu">
        <li>
            <a href="javascript:;">
                <i class="icon-user"></i>
                <span class="title">系统管理</span>
                <span class="selected"></span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">角色管理</a></li>
                <li><a href="${ctx}/account/user.action" target="navTab" rel="w_user">用户管理</a></li>
            </ul>
        </li>

        <li>
            <a href="javascript:;">
                <i class="icon-table"></i>
                <span class="title">行政区管理</span>
                <span class="selected"></span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">省数据管理</a></li>
                <li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">市数据管理</a></li>
                <li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">区域数据管理</a></li>
            </ul>
        </li>



        <li>
            <a href="javascript:;">
                <i class="icon-bar-chart"></i>
                <span class="title">代理商管理</span>
                <span class="selected"></span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">代理商管理</a></li>
            </ul>
        </li>



        <li>
            <a href="javascript:;">
                <i class="icon-bar-chart"></i>
                <span class="title">产品管理</span>
                <span class="selected"></span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">产品管理</a></li>
            </ul>
        </li>


    </ul>



</div>
</div>
