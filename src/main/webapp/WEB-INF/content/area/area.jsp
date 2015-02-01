<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
    <div class="pageHeader">
        <form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/area/area.action" method="post">
            <input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
            <input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
            <input type="hidden" name="page.order" id="order" value="${page.order}"/>

            <div class="searchBar">
                <ul class="searchContent">
                    <li>
                        <label>区域名称:</label><input type="text" name="filter_EQS_areaName"
                                                   value="${param['filter_EQS_areaName']}" size="9"/>
                    </li>

                    <li>
                        <label>省份:</label>
                        <select name="provinceId" id="provinceId">
                            <option value="">全部</option>
                            <s:iterator value="provinces">
                                <option value="${id}" <c:if test="${provinceId ==id}">
                                    selected
                                </c:if>>${provinceName}</option>
                            </s:iterator>
                        </select>
                    </li>

                    <li>
                        <label>城市:</label>
                        <select name="filter_EQL_cityId">
                            <option value="">全部</option>
                        </select>
                    </li>


                </ul>
                <div class="subBar">
                    <ul>
                        <li>
                            <div class="buttonActive">
                                <div class="buttonContent">
                                    <button type="submit">检索</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </form>
    </div>

    <div class="pageContent">
        <div class="panelBar">
            <ul class="toolBar">
                <li><a class="add" href="${ctx}/area/area!input.action" target="dialog"><span>添加</span></a></li>
                <li><a class="delete" href="${ctx}/area/area!delete.action?id={sid_user}" target="ajaxTodo"
                       title="确定要删除吗？" warn="请选择一个用户"><span>删除</span></a></li>
                <li><a class="edit" href="${ctx}/area/area!input.action?id={sid_user}" target="dialog"
                       warn="请选择一个用户"><span>查看/修改</span></a></li>
            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="98%">
                <thead>
                <tr>
                    <th width="80">区域ID</th>
                    <th width="80">区域名称</th>
                    <th width="80">所属城市</th>
                    <th width="80">所属省份</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="page.result">
                    <tr target="sid_user" rel="${id}">
                        <td>${id}&nbsp;</td>
                        <td>${areaName}&nbsp;</td>
                        <td>${cityName}&nbsp;</td>
                        <td>${provinceName}&nbsp;</td>
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