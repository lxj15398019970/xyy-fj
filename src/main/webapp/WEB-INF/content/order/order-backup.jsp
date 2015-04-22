<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
    <div class="pageHeader">
        <form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/order/order-backup.action"
              method="post">
            <input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
            <input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
            <input type="hidden" name="page.order" id="order" value="${page.order}"/>

        </form>
    </div>
    <div class="pageContent">
        <div class="panelBar">
            <ul class="toolBar">
                <li><a class="toolBar-btn" href="${ctx}/order/order-backup!backup.action"
                       target="ajaxTodo">备份订单</a></li>
            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="98%">
                <thead>
                <tr>
                    <th width="5%">ID</th>
                    <th width="5%">文件名</th>
                    <th width="10%">备份时间</th>
                    <th width="10%">查看</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="page.result">
                    <tr target="sid_user" rel="${id}">
                        <td>${id}</td>
                        <td>${fileName}</td>
                        <td>
                            <s:date name="backTime" format="yyyy-MM-dd HH:mm:ss"></s:date>
                        </td>

                        <td><a href="${saveUrl}">查看</a></td>


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