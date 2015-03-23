<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/order/order!importOrder.action" class="pageForm required-validate"
              onsubmit="return iframeCallback(this,dialogAjaxDone)" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="58">

                <div class="unit">
                    <label>下载魔板:</label>
                    <a href="${ctx}/excel/order.xls"><span style="color: red">模板下载</span></a>
                    (注意:先下载模板，填写订单信息导入)

                </div>

                <div class="unit">
                    <label>选择文件:</label>
                    <input type="file" name="excel" class="required">

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

