<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/main!changePassword.action" class="pageForm required-validate"
              onsubmit="return validateCallback(this, dialogAjaxDone)">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="70">
                <div class="unit">
                    <label>旧密码：</label>
                    <input name="oldPassword" size="30" minlength="3" maxlength="20" class="required textInput" type="password">
                </div>
                <div class="unit">
                    <label>新密码：</label>
                    <input id="cp_newPassword" name="newPassword" size="30" minlength="3" maxlength="20" class="required alphanumeric textInput" type="password">
                </div>
                <div class="unit">
                    <label>重复输入新密码：</label>
                    <input name="rnewPassword" size="30" equalto="#cp_newPassword" class="required alphanumeric textInput" type="password">
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
