<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">


    <div class="pageContent">
        <div class="panelBar">
            <ul class="toolBar">
                <li><a class="toolBar-btn" href="${ctx}/account/role!input.action" target="dialog" height="320">添加</a></li>
                <li><a class="toolBar-btn2" href="${ctx}/account/role!delete.action?id={sid_role}" target="ajaxTodo"
                       title="确定要删除吗？" warn="请选择一个角色">删除</a></li>
                <li><a class="toolBar-btn" href="${ctx}/account/role!input.action?id={sid_role}" target="dialog" height="320"
                       warn="请选择一个角色" height="600">查看/修改</a></li>
            </ul>
        </div>

        <table class="list" width="100%" layoutH="66">
            <thead>
            <tr>
                <th width="50%">名称</th>
                <th width="50%">授权</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="allRoleList">
                <tr target="sid_role" rel="${id}">
                    <td>${name}</td>
                    <td>${authNames}</td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
        <div class="panelBar">

        </div>
    </div>
</div>