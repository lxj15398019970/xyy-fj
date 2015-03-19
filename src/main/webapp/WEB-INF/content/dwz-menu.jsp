<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script src="${ctx}/static/dwz/js/app.js" type="text/javascript"></script>
<div class="accordion" fillSpace="sidebar">
    <div class="accordionContent page-sidebar">
        <ul class="page-sidebar-menu">


            <security:authorize ifAnyGranted="ROLE_系统管理">
                <li <c:if test="${type == 'user'}">
                    class = "active"
                </c:if>
                        >
                    <a href="javascript:;">
                        <i class="icon-user"></i>
                        <span class="title">系统管理</span>
                        <span class="selected"></span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="${ctx}/account/user.action" target="navTab" rel="w_user">用户管理</a></li>
                        <li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">角色管理</a></li>

                    </ul>
                </li>
            </security:authorize>


            <security:authorize ifAnyGranted="ROLE_行政区管理">
                <li    <c:if test="${type == 'dict'}">
                    class = "active"
                </c:if>
                        >
                    <a href="javascript:;">
                        <i class="icon-table"></i>
                        <span class="title">行政区管理</span>
                        <span class="selected"></span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="${ctx}/province/province.action" target="navTab" rel="w_province">省数据管理</a></li>
                        <li><a href="${ctx}/city/city.action" target="navTab" rel="w_city">市数据管理</a></li>
                        <li><a href="${ctx}/area/area.action" target="navTab" rel="w_area">区县数据管理</a></li>
                    </ul>
                </li>

            </security:authorize>


            <security:authorize ifAnyGranted="ROLE_代理商管理">
                <li    <c:if test="${type == 'agent'}">
                    class = "active"
                </c:if>
                        >
                    <a href="javascript:;">
                        <i class="icon-bar-chart"></i>
                        <span class="title">代理商管理</span>
                        <span class="selected"></span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="${ctx}/agent/agent.action" target="navTab" rel="w_agent">代理商管理</a></li>
                    </ul>
                </li>
            </security:authorize>


            <security:authorize ifAnyGranted="ROLE_订单配送">
                <li  <c:if test="${type == 'orderps'}">
                    class = "active"
                </c:if>>
                    <a href="javascript:;">
                        <i class="icon-bar-chart"></i>
                        <span class="title">订单配送</span>
                        <span class="selected"></span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="${ctx}/order/order.action" target="navTab" rel="w_role">未配送订单</a></li>
                        <li><a href="${ctx}/order/order.action" target="navTab" rel="w_role">已配送订单统计</a></li>
                    </ul>
                </li>

            </security:authorize>


            <li <c:if test="${type == 'orderps'}">
                class = "active"
            </c:if>>
                <a href="javascript:;">
                    <i class="icon-bar-chart"></i>
                    <span class="title">订单管理</span>
                    <span class="selected"></span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li><a href="${ctx}/order/order.action" target="navTab" rel="w_order">订单管理</a></li>
                    <li><a href="${ctx}/order/order-backup.action" target="navTab" rel="w_order">订单备份管理</a></li>
                </ul>
            </li>


            <security:authorize ifAnyGranted="ROLE_产品管理">
                <li>
                    <a href="javascript:;">
                        <i class="icon-bar-chart"></i>
                        <span class="title">产品管理</span>
                        <span class="selected"></span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="${ctx}/production/production.action" target="navTab" rel="w_production">产品管理</a>
                        </li>
                    </ul>
                </li>


            </security:authorize>


            <security:authorize ifAnyGranted="ROLE_直销统计">
                <li  <c:if test="${type == 'statistic'}">
                    class = "active"
                </c:if>>
                    <a href="javascript:;">
                        <i class="icon-bar-chart"></i>
                        <span class="title">直销统计</span>
                        <span class="selected"></span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="${ctx}/agent/agent.action" target="navTab" rel="w_role">直销统计</a></li>
                    </ul>
                </li>

            </security:authorize>
        </ul>

    </div>
</div>
