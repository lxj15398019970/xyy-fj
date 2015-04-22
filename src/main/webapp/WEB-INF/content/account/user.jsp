<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
    <div class="pageHeader">
        <form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/account/user.action" method="post">
            <input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
            <input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
            <input type="hidden" name="page.order" id="order" value="${page.order}"/>

            <div class="searchBar">
                <ul class="searchContent">
                    <li>
                        <label>登录名:</label><input type="text" name="filter_EQS_loginName"
                                                  value="${param['filter_EQS_loginName']}" size="9"/>
                    </li>
                    <li>
                        <label>姓名或Email:</label><input type="text" name="filter_LIKES_name_OR_email"
                                                       value="${param['filter_LIKES_name_OR_email']}"/>
                    </li>
                    <li>
                        <div class="buttonActive">
                            <div class="buttonContent">
                                <button type="submit" class="fjsearch-btn">检索</button>
                            </div>
                        </div>
                    </li>
                </ul>

            </div>
        </form>
    </div>
    <div class="dashed-line"></div>
    <div class="pageContent">
        <div class="panelBar">
            <ul class="toolBar">
                <li><a class="toolBar-btn" href="${ctx}/account/user!input.action" target="dialog" width="600" height="400">添加</a></li>
                <li><a class="toolBar-btn2" href="${ctx}/account/user!delete.action?id={sid_user}" target="ajaxTodo"
                       title="确定要删除吗？" warn="请选择一个用户">删除</a></li>
                <li><a class="toolBar-btn" href="${ctx}/account/user!input.action?id={sid_user}" target="dialog" width="600" height="400"
                       warn="请选择一个用户">查看/修改</a></li>
            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="100%">
                <thead>
                <tr>
                    <th width="20%">登录名</th>
                    <th width="20%">姓名</th>
                    <th width="20%">电邮</th>
                    <th width="20%">用户类型</th>
                    <th width="20%">角色</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="page.result">
                    <tr target="sid_user" rel="${id}">
                        <td>${loginName}&nbsp;</td>
                        <td>${name}&nbsp;</td>
                        <td>${email}&nbsp;</td>
                        <td>
                            <c:if test="${userType == 1}">工厂管理员</c:if>
                            <c:if test="${userType == 2}">代理商</c:if>
                            <c:if test="${userType == 3}">产品管理员</c:if>

                        </td>
                        <td>${roleNames}&nbsp;</td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>

        <div class="panelBar">
            <div class="pages">
                <span>共${page.totalCount}条,共${page.totalPages}页</span>
            </div>

            <div class="pagination" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.pageSize}"
                 pageNumShown="10" currentPage="${page.pageNo}"></div>

        </div>

    </div>
</div>