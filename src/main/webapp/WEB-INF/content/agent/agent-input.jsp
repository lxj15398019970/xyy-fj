<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/agent/agent!save.action" class="pageForm required-validate"
              onsubmit="return validateCallback(this, dialogAjaxDone)">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="58">

                <div class="unit">
                    <label>代理商称:</label>
                    <select name="agentName" required="required">
                        <option value="">--请选择--</option>
                        <c:forEach items="${users}" var="item">
                            <option value="${item.loginName}"
                                    <c:if test="${item.loginName == agentName}">selected</c:if>>${item.loginName}</option>
                        </c:forEach>

                    </select>
                </div>

                <div class="unit">
                    <label>所属省份:</label>
                    <select name="provinceId" id="province">
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
                    <select name="cityId" id="city">
                        <option value="">--请选择--</option>
                        <c:forEach items="${cities}" var="item">
                            <option value="${item.id}" <c:if test="${cityId ==item.id}">
                                selected
                            </c:if>>${item.cityName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="unit">
                    <label>所属区域:</label>
                    <select name="areaId" id="area">
                        <option value="">--请选择--</option>
                        <c:forEach items="${areas}" var="item">
                            <option value="${item.id}" <c:if test="${areaId ==item.id}">
                                selected
                            </c:if>>${item.areaName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="unit">
                    <label>代理产品:</label>
                    <select name="productionId" id="productionId">
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
                    <input type="text" name="areaScope" value="${areaScope}" required size="40">

                </div>


            </div>

            <div class="formBar">
                <ul>
                    <li>
                        <div class="buttonActive">
                            <div class="buttonContent">
                                <button type="submit">提交</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="button">
                            <div class="buttonContent">
                                <button type="button" class="close">取消</button>
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
            if (cityId != '') {
                $.post("area/area!getAreas.action", {
                    cityId: cityId
                }, function (result) {
                    $("#area").empty();
                    var option = "<option value=''>--请选择--</option>";
                    $("#area").append(option);
                    for (var i = 0; i < result.length; i++) {
                        option = '<option value="' + result[i].id + '">' + result[i].areaName + '</option>'
                        $("#area").append(option);
                    }

                })
            }

        })

    })


</script>