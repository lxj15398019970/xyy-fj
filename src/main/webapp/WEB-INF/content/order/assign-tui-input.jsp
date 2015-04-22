<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/order/assign!tuiConfirm.action" class="pageForm required-validate"
              onsubmit="return validateCallback(this, dialogAjaxDone)">
            <input type="hidden" name="orderId" value="${orderId}"/>

            <div class="pageFormContent" layoutH="70">

                <div class="unit">
                    <label>退货理由:</label>
                    <textarea name="tuiReason" rows="5" cols="30"></textarea>

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
