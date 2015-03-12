<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/production/production!save.action" class="pageForm required-validate"
              onsubmit="return validateCallback(this, dialogAjaxDone)">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="58">

                <div class="unit">
                    <label>产品名称:</label>
                    <input type="text" name="productionName" size="40" id="productionName" class="required"
                           value="${productionName}"/>
                </div>

                <div class="unit">
                    <label>规格:</label>
                    <input type="text" name="version" size="40" id="version" class="required" value="${version}"/>
                </div>


                <div class="unit">
                    <label>颜色:</label>
                    <input type="text" name="color" size="40" id="color" class="required" value="${color}"/>
                </div>

                <div class="unit">
                    <label>价格:</label>
                    <input type="text" name="price" size="40" id="price" class="required" value="${price}"/>
                </div>

                <div class="unit">
                    <label>条形码:</label>
                    <input type="text" name="code" size="40" id="code" class="required" value="${code}"/>
                </div>

                <div class="unit">
                    <label>确认条形码:</label>
                    <input type="text" name="codeConfirm" size="40" id="codeConfirm" class="required" value="${code}"/>
                </div>

                <div class="unit">
                    <label>库存:</label>
                    <input type="text" name="inventory" size="40" id="inventory" class="required" value="${inventory}"/>
                </div>

                <div class="unit">
                    <label>描述:</label>
                    <textarea name="description" cols="40" rows="5">${description}</textarea>
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