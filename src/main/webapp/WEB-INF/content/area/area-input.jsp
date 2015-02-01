<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/area/area!save.action" class="pageForm required-validate"
              onsubmit="return validateCallback(this, dialogAjaxDone)">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="58">


                <%--<div class="unit">--%>
                    <%--<label>所属省份:</label>--%>
                     <%--<select name="provinceId">--%>
                         <%--<s:iterator value="provinces">--%>
                             <%--<option value="${id}" <c:if test="${id==provinceId}">--%>
                                 <%--selected--%>
                             <%--</c:if>>${provinceName}</option>--%>
                         <%--</s:iterator>--%>

                     <%--</select>--%>
                <%--</div>--%>
                <div class="unit">
                    <label>区域名称:</label>
                    <input type="text" name="areaName" size="40" id="areaName" class="required" value="${areaName}"/>
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
