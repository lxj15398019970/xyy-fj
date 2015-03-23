<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/area/area!save.action" class="pageForm required-validate"
              onsubmit="return validateCallback(this, dialogAjaxDone)">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="70">

                <div class="unit">
                    <label>区域名称:</label>
                    <input type="text" name="areaName" size="40" id="areaName" class="required" value="${areaName}"/>
                </div>

                <div class="unit">
                    <label>所属省份:</label>
                    <select name="provinceId" id="province">
                        <s:iterator value="provinces">
                            <option value="${id}" <c:if test="${provinceId ==id}">
                                selected
                            </c:if>>${provinceName}</option>
                        </s:iterator>
                    </select>
                </div>


                <div class="unit">
                    <label>所属城市:</label>
                    <select name="cityId" id="city">
                        <c:if test="${not empty cities}">
                            <s:iterator value="cities">
                                <option value="${id}" <c:if test="id ==cityId}">
                                    selected
                                </c:if>>${cityName}</option>
                            </s:iterator>
                        </c:if>
                    </select>
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
        $("#province").change(function () {
            var provinceId = $(this).val();
            if (provinceId != '') {
                $.post("city/city!getCities.action", {
                    provinceId: provinceId
                }, function (result) {
                    $("#city").empty();
                    var option;
                    for (var i = 0; i < result.length; i++) {
                        option = '<option value="' + result[i].id + '">' + result[i].cityName + '</option>'
                        $("#city").append(option);
                    }


                })


            }

        })

    })


</script>