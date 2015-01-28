<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/account/user!save.action" class="pageForm required-validate"
              onsubmit="return validateCallback(this, dialogAjaxDone)">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="58">

                <div class="unit">
                    <label>登录名:</label>
                    <input type="text" name="loginName" size="40" id="loginName" class="required" value="${loginName}"/>
                </div>
                <div class="unit">
                    <label>用户名:</label>
                    <input type="text" id="name" name="name" size="40" class="required" value="${name}"/>
                </div>
                <div class="unit">
                    <label>密码:</label>
                    <input type="password" id="password" name="password" size="40" class="required"
                           value="${password}"/>
                </div>
                <div class="unit">
                    <label>确认密码:</label>
                    <input type="password" id="passwordConfirm" name="passwordConfirm" size="40" class="required"
                           value="${password}"/>
                </div>
                <div class="unit">
                    <label>邮箱:</label>
                    <input type="text" id="email" name="email" size="40" class="required email" value="${email}"/>
                </div>
                <div class="unit">
                    <label>角色:</label>
                    <s:checkboxlist name="checkedRoleIds" list="allRoleList" listKey="id" listValue="name"
                                    theme="custom"/>
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
