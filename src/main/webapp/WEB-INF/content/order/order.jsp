<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
    <div class="pageHeader">
        <form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/order/order.action" method="post">
            <input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
            <input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
            <input type="hidden" name="page.order" id="order" value="${page.order}"/>

            <div class="searchBar">
                <ul class="searchContent">
                    <%--<li>--%>
                    <%--<label>区域名称:</label><input type="text" name="filter_EQS_areaName"--%>
                    <%--value="${param['filter_EQS_areaName']}" size="9"/>--%>
                    <%--</li>--%>

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
                <li><a class="add" href="${ctx}/order/order!input.action" target="dialog"><span>添加</span></a></li>
                <li><a class="delete" href="${ctx}/order/order!delete.action?id={sid_user}" target="ajaxTodo"
                       title="确定要删除吗？" warn="请选择一条订单"><span>删除</span></a></li>
                <li><a class="edit" href="${ctx}/order/order!input.action?id={sid_user}" target="dialog"
                       warn="请选择一条订单"><span>查看/修改</span></a></li>
            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="98%">
                <thead>
                <tr>
                    <th width="80">ID</th>
                    <th width="80">产品名称</th>
                    <th width="80">产品型号</th>
                    <th width="80">产品颜色</th>
                    <th width="80">单产品销售价格</th>
                    <th width="80">购买数量</th>
                    <th width="80">总价款</th>
                    <th width="80">产品参数</th>
                    <th width="80">详细的配送地址</th>
                    <th width="80">姓名</th>
                    <th width="80">电话</th>
                    <th width="80">创建时间</th>
                    <th width="80">配送时间</th>
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
                        <td>${para}</td>
                        <td>${address}</td>
                        <td>${customName}</td>
                        <td>${phone}</td>
                        <td>${orderTime}</td>
                        <td>${assignTime}</td>
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