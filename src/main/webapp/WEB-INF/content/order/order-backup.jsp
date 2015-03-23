<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
    <div class="pageHeader">
        <form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/order/order-backup.action"
              method="post">
            <input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
            <input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
            <input type="hidden" name="page.order" id="order" value="${page.order}"/>

            <%--<div class="searchBar">--%>
                <%--<ul class="searchContent">--%>
                    <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<label>区域名称:</label><input type="text" name="filter_EQS_areaName"&ndash;%&gt;--%>
                    <%--&lt;%&ndash;value="${param['filter_EQS_areaName']}" size="9"/>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</li>&ndash;%&gt;--%>

                <%--</ul>--%>
                <%--<div class="subBar">--%>
                    <%--<ul>--%>
                        <%--<li>--%>
                            <%--<div class="buttonActive">--%>
                                <%--<div class="buttonContent">--%>
                                    <%--<button type="submit">检索</button>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
        </form>
    </div>

    <div class="pageContent">
        <div class="panelBar">
            <ul class="toolBar">
            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="98%">
                <thead>
                <tr>
                    <th width="5%">ID</th>
                    <th width="10%">产品名称</th>
                    <th width="5%">产品型号</th>
                    <th width="5%">产品颜色</th>
                    <th width="5%">单产品销售价格</th>
                    <th width="5%">购买数量</th>
                    <th width="5%">总价款</th>
                    <th width="5%">产品参数</th>
                    <th width="10%">详细的配送地址</th>
                    <th width="10%">姓名</th>
                    <th width="10%">代理商</th>
                    <th width="5%">电话</th>
                    <th width="5%">创建时间</th>
                    <th width="5%">配送时间</th>
                    <th width="5%">备份时间</th>
                    <th width="5%">状态</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="page.result">
                    <tr target="sid_user" rel="${id}">
                        <td>${id}</td>
                        <td>${production.productionName}</td>
                        <td>${production.version}</td>
                        <td>${production.color}</td>
                        <td>${production.price}</td>
                        <td>${buyCount}</td>
                        <td>${totalMoney}</td>
                        <td>${production.para}</td>
                        <td>${address}</td>
                        <td>${customName}</td>
                        <td>${agentName}</td>
                        <td>${phone}</td>
                        <td>
                            <s:date name="orderTime" format="yyyy-MM-dd HH:mm:ss"></s:date>
                        </td>
                        <td>
                            <s:date name="assignTime" format="yyyy-MM-dd HH:mm:ss"></s:date>
                        </td>

                        <td>
                            <s:date name="backupTime" format="yyyy-MM-dd"></s:date>
                        </td>

                        <td>
                            <c:if test="${status ==0}">未配送</c:if>
                            <c:if test="${status ==1}">正在配送</c:if>
                            <c:if test="${status ==2}">已配送</c:if>
                            <c:if test="${status ==3}">退货</c:if>

                        </td>

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