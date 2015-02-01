<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/province/province!save.action" class="pageForm required-validate"
              onsubmit="return validateCallback(this, dialogAjaxDone)">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="58">

                <div class="unit">
                    <label>省份名称:</label>
                    <input type="text" name="provinceName" size="40" id="provinceName" class="required" value="${provinceName}"/>
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
