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
                            <option value="0">全部</option>
                            <s:iterator value="provinces">
                                <option value="${id}" <c:if test="${provinceId ==id}">
                                    selected
                                </c:if>>${provinceName}</option>
                            </s:iterator>
                        </select>
                    </li>

                    <li>
                        <label>城市:</label>
                        <select name="filter_EQL_cityId" id="cityId">
                            <option value="">全部</option>
                            <c:if test="${not empty cities}">
                                <s:iterator value="cities">
                                    <option value="${id}" <c:if test="${param['filter_EQL_cityId'] ==id}">
                                        selected
                                    </c:if>>${cityName}</option>
                                </s:iterator>
                            </c:if>

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
                <li><a class="toolBar-btn" href="${ctx}/area/area!input.action" target="dialog">添加</a></li>
                <li><a class="toolBar-btn2" href="${ctx}/area/area!delete.action?id={sid_user}" target="ajaxTodo"
                       title="确定要删除吗？" warn="请选择一个区县">删除</a></li>
                <li><a class="toolBar-btn" href="${ctx}/area/area!input.action?id={sid_user}" target="dialog"
                       warn="请选择一个用户">查看/修改</a></li>
            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="100%">
                <thead>
                <tr>
                    <th width="25%">区域ID</th>
                    <th width="25%">区域名称</th>
                    <th width="25%">所属城市</th>
                    <th width="25%">所属省份</th>
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
<script>
    $(function () {
        //根据省份获取城市列表
        $("#provinceId").change(function () {
            var provinceId = $(this).val();
            if (provinceId != '0') {
                $.post("city/city!getCities.action", {
                    provinceId: provinceId
                }, function (result) {
                    $("#cityId").empty();
                    var option;
                    for (var i = 0; i < result.length; i++) {
                        option = '<option value="' + result[i].id + '">' + result[i].cityName + '</option>'
                        $("#cityId").append(option);
                    }
                })
            }
        })
    })


</script>