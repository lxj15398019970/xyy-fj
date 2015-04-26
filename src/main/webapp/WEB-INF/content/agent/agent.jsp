<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
    <div class="pageHeader">
        <form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/agent/agent.action" method="post">
            <input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
            <input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
            <input type="hidden" name="page.order" id="order" value="${page.order}"/>

            <div class="searchBar">
                <ul class="searchContent">
                    <li>
                        <label>代理商名称:</label>
                        <input type="text" class="textInput" name="filter_EQS_agentName"
                               value="${param['filter_EQS_agentName']}" size="9"/>
                    </li>
                    <li>
                        <div class="buttonActive">
                            <div class="buttonContent">
                                <button type="submit">检索</button>
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
                <li><a class="toolBar-btn" href="${ctx}/agent/agent!input.action" target="navTab" rel="w_agent1">添加</a>
                </li>
                <li><a class="toolBar-btn2" href="${ctx}/agent/agent!delete.action?id={sid_user}" target="ajaxTodo"
                       title="删除代理商的时候,将会删除该代理商以及与该代理商有关的订单，确定要删除吗？" warn="请选择一个代理商">删除</a></li>
                <li><a class="toolBar-btn" href="${ctx}/agent/agent!input.action?id={sid_user}" target="navTab"
                       rel="w_agent1"
                       warn="请选择一个代理商">查看/修改</a></li>

                <li><a class="toolBar-btn" href="${ctx}/agent/agent!addArea.action?id={sid_user}" target="navTab"
                       rel="w_agent1"
                       warn="请选择一个代理商">增加更多配送范围</a>
                </li>

            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="98%">
                <thead>
                <tr>
                    <th width="5%">ID</th>
                    <th width="5%">代理商名称</th>
                    <th width="5%">代理产品名称</th>
                    <th width="5%">代理产品型号</th>
                    <th width="5%">代理产品颜色</th>
                    <th width="5%">所在省</th>
                    <th width="5%">所在市</th>
                    <%--<th width="80">所在区</th>--%>
                    <th width="65%">配送范围</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="page.result">
                    <tr target="sid_user" rel="${id}">
                        <td>${id}&nbsp;</td>
                        <td>${agentName}&nbsp;</td>
                        <td>${productionName}&nbsp;</td>
                        <td>${productionModel}&nbsp;</td>
                        <td>${color}&nbsp;</td>
                        <td>${provinceName}&nbsp;</td>
                        <td>${cityName}&nbsp;</td>
                            <%--<td>${areaName}&nbsp;</td>--%>
                        <td>${areaScope}&nbsp;</td>
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
