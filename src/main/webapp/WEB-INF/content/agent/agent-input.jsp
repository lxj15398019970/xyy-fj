<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/agent/agent!save.action" class="pageForm required-validate"
              onsubmit="return validateCallback(this, dialogAjaxDone)">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="70">

                <div class="unit">
                    <label>代理商称:</label>
                    <c:if test="${id > 0}">
                        <input type="text" name="agentName" value="${agentName}" readonly>
                    </c:if>

                    <c:if test="${id == null}">
                        <select name="agentName" required="required">
                            <option value="">--请选择--</option>
                            <c:forEach items="${users}" var="item">
                                <option value="${item.loginName}"
                                        <c:if test="${item.loginName == agentName}">selected</c:if>>${item.loginName}</option>
                            </c:forEach>

                        </select>
                    </c:if>
                </div>

                <div class="unit">
                    <label>所属省份:</label>
                    <select name="provinceId" id="province" required="required">
                        <option value="">--请选择--</option>
                        <c:forEach items="${provinces}" var="item">
                            <option value="${item.id}" <c:if test="${provinceId ==item.id}">
                                selected
                            </c:if>>${item.provinceName}</option>
                        </c:forEach>
                    </select>
                </div>


                <div class="unit">
                    <label>所属城市:</label>
                    <select name="cityId" id="city" required="required">
                        <option value="">--请选择--</option>
                        <c:forEach items="${cities}" var="item">
                            <option value="${item.id}" <c:if test="${cityId ==item.id}">
                                selected
                            </c:if>>${item.cityName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="unit">
                    <label>代理产品:</label>
                    <select name="productionId" id="productionId" required="required">
                        <option value="">--请选择--</option>
                        <c:forEach items="${productions}" var="item">
                            <option value="${item.id}" <c:if test="${productionId ==item.id}">
                                selected
                            </c:if>>${item.productionName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="unit">
                    <label>配送范围:</label>

                    <div id="area">
                        <c:forEach items="${areas}" var="item">
                            ${item.areaName}<input type="checkbox" name="areaIds" value="${item.id}" id="${item.id}"
                                                   checked>
                        </c:forEach>
                    </div>
                </div>


            </div>

            <div class="formBar">
                <ul>
                    <li>
                        <div class="buttonActive">
                            <div class="buttonContent">
                                <button type="submit" class="toolBar-btn">提交</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="button">
                            <div class="buttonContent">
                                <button type="button" class="close toolBar-btn2">取消</button>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

        </form>

    </div>
</div>

<script>
    $(function () {
        //根据省份获取城市列表
        var id = "${id}";

        $("#province").change(function () {
            var provinceId = $(this).val();
            if (provinceId != '') {
                $.post("city/city!getCities.action", {
                    provinceId: provinceId
                }, function (result) {
                    $("#city").empty();
                    var option = "<option value=''>--请选择--</option>";
                    $("#city").append(option);
                    for (var i = 0; i < result.length; i++) {
                        option = '<option value="' + result[i].id + '">' + result[i].cityName + '</option>'
                        $("#city").append(option);
                    }

                })
            }

        });


        $("#city").change(function () {
            var cityId = $(this).val();
            if (id == "") {
                if (cityId != '') {
                    $.post("area/area!getAreas.action", {
                        cityId: cityId
                    }, function (result) {
                        $("#area").empty();
                        for (var i = 0; i < result.length; i++) {
                            var inputCheckbox = result[i].areaName + '<input type="checkbox" checked name="areaIds" value="' + result[i].id + '" id="' + result[i].id + '">'
                            $("#area").append(inputCheckbox);
                        }

                    })
                }
            }

        })

    })


</script>