<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
    <div class="pageHeader">
        <form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/statistic/sale-statistic.action"
              method="post">
            <input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
            <input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
            <input type="hidden" name="page.order" id="order" value="${page.order}"/>

            <div class="searchBar">
                <ul class="searchContent">
                    <li>
                        <label>日期:</label><input type="text" name="date"
                                                 value="${date}" class="date textInput"/>
                    </li>

                    <li>
                        <label>代理商:</label>
                        <select name="agentName">
                            <option value="">请选择</option>
                            <c:forEach items="${agents}" var="item">
                                <option value="${item}"
                                        <c:if test="${item == agentName}">selected</c:if>>${item}</option>


                            </c:forEach>

                        </select>

                    </li>

                    <li>
                        <label>产品:</label>
                        <select name="productionId">
                            <option value="0">请选择</option>
                            <c:forEach items="${productions}" var="item">
                                <option value="${item.id}"
                                        <c:if test="${item.id == productionId}">selected</c:if>>${item.productionName}</option>
                            </c:forEach>
                        </select>
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
            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="100%">
                <thead>
                <tr>
                    <th width="10%">日期</th>
                    <th width="15%">销售总数量</th>
                    <th width="10%">销售总额</th>
                    <th width="10%">代理商</th>
                    <th width="10%">产品</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="page.result">
                    <tr target="sid_user" rel="${id}">
                        <td>${date}&nbsp;</td>
                        <td>${totalBuy}&nbsp;</td>
                        <td>${totalMoney}&nbsp;</td>
                        <td>${agentName}&nbsp;</td>
                        <td>${productionName}&nbsp;</td>

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