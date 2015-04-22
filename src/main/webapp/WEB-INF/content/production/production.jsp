<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
    <div class="pageHeader">
        <form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/production/production.action"
              method="post">
            <input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
            <input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
            <input type="hidden" name="page.order" id="order" value="${page.order}"/>

            <div class="searchBar">
                <ul class="searchContent">
                    <li>
                        <label>产品名称:</label><input type="text" class="textInput" name="filter_EQS_productionName"
                                                   value="${param['filter_EQS_productionName']}" size="9"/>
                    </li>

                    <li>
                        <label>规格:</label><input type="text" class="textInput" name="filter_EQS_version"
                                                 value="${param['filter_EQS_version']}" size="9"/>
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
                <li><a class="toolBar-btn" href="${ctx}/production/production!input.action" target="dialog"
                       height="500">添加</a>
                </li>
                <li><a class="toolBar-btn2" href="${ctx}/production/production!delete.action?id={sid_user}"
                       target="ajaxTodo"
                       title="确定要删除吗？" warn="请选择一个产品">删除</a></li>
                <li><a class="toolBar-btn" href="${ctx}/production/production!input.action?id={sid_user}"
                       target="dialog"
                       warn="请选择一个产品" height="500">查看/修改</a></li>
            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="100%">
                <thead>
                <tr>
                    <th width="10%">ID</th>
                    <th width="15%">产品名称</th>
                    <th width="10%">产品规格</th>
                    <th width="10%">产品条形码</th>
                    <th width="10%">产品颜色</th>
                    <th width="10%">产品价格</th>
                    <th width="10%">产品参数</th>
                    <th width="15%">库存</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="page.result">
                    <tr target="sid_user" rel="${id}">
                        <td>${id}&nbsp;</td>
                        <td>${productionName}&nbsp;</td>
                        <td>${version}&nbsp;</td>
                        <td>${code}&nbsp;</td>
                        <td>${color}&nbsp;</td>
                        <td>${price}&nbsp;</td>
                        <td>${para}&nbsp;</td>
                        <td>${inventory}&nbsp;</td>
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