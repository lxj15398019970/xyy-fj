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

                    <li>
                        <label>订单号:</label><input type="orderNo" name="orderNo"
                                                   value="${orderNo}" size="9"/>
                    </li>


                    <li>
                        <label>订单电话:</label><input type="phone" name="phone"
                                                   value="${phone}" size="9"/>
                    </li>

                    <li>
                        <label>创建时间:</label><input type="text" name="createTime"
                                                   value="${createTime}" class="date " />
                    </li>

                    <%--/**--%>
                    <%--* 0 未配送--%>
                    <%--* 1	正在配送--%>
                    <%--* 2	已配送--%>
                    <%--* 3	退货--%>
                    <%--*/--%>



                    <li>
                        <label>订单状态</label>
                       <select name="status">
                           <option value="-1">请选择</option>
                           <option value="0" <c:if test="${status == 0}">selected</c:if> >未配送</option>
                           <option value="1" <c:if test="${status == 1}">selected</c:if>>正在配送</option>
                           <option value="2" <c:if test="${status == 2}">selected</c:if>>已配送</option>
                           <option value="3" <c:if test="${status == 3}">selected</c:if>>退货</option>



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
                <li><a class="toolBar-btn" href="${ctx}/order/order!input.action" target="dialog" height="600">录入订单</a></li>
                <li><a class="toolBar-btn2" href="${ctx}/order/order!delete.action?id={sid_user}" target="ajaxTodo"
                       title="确定要删除吗？" warn="请选择一条订单">删除订单</a></li>
                <li><a class="toolBar-btn" href="${ctx}/order/order!input.action?id={sid_user}" target="dialog"
                       warn="请选择一条订单" height="600">查看/修改订单</a></li>

                <li><a class="toolBar-btn" href="${ctx}/order/order!importOrderInput.action"
                       target="dialog">导入订单</a></li>
            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="100%">
                <thead>
                <tr>
                    <th width="5%">ID</th>
                    <th width="5%">订单号</th>
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
                    <th width="10%">状态</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="page.result">
                    <tr target="sid_user" rel="${id}">
                        <td>${id}</td>
                        <td>${orderNo}</td>
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