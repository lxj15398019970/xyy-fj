<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/account/role!save.action" class="pageForm required-validate"
              onsubmit="return validateCallback(this, dialogAjaxDone)">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="70">

                <div class="unit">
                    <label>角色名:</label>
                    <input type="text" id="name" name="name" size="40" value="${name}" class="required"/>
                </div>
                <div class="unit">
                    <label>授权:</label>
                    <s:checkboxlist name="checkedAuthIds" list="allAuthorityList" listKey="id"
                                    listValue="name" theme="custom"/>
                </div>
            </div>

            <div class="formBar modal-footer">
                <ul>
                    <li>
                        <div class="buttonActive">
                            <div class="buttonContent">
                                <button type="submit" class="btn toolBar-btn">提交</button>
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
