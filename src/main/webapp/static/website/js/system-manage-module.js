/**
 * @description : 系统设置
 * @autor : sherlock
 */


var  ModelListUI = {};


var ModelListEvent = {

    init : function(){

        ModelListUI  = {
            SaveBtn : $("#saveBtn"),
            ModeList : $("#configurationList"),
            Form     : $("#searchForm"),
            HiddenModel : $("#moduleCodes")
        };

        ModelListEvent.form();
    },
    form : function(){

        // bind 'myForm' and provide a simple callback function
        $('form.navForm ').ajaxForm(function() {
        	alert("sff");
            $(".alert-success").show();
            setTimeout('$(".alert-success").hide()', 3000);
        });



        $("ul:first").dragsort();
        $('input').iCheck({
            radioClass : 'iradio_square-blue',
            increaseArea : '20%' // optional
        });

        $("#configurationList").dragsort({
            dragSelector : "div",
            dragBetween : true,
            dragEnd : saveOrder,
            placeHolderTemplate : "<li class='placeHolder'><div></div></li>",
            dragEnd : function() {
                $('#configurationList li').each(function() {
                    var n = $('#configurationList li').index($(this)[0]);
                    $('#configurationList li').eq(n).attr('id', n);
                    $(this).find('.badge').text(1 + parseFloat($(this).attr('id')))
                });
            }
        });
        function saveOrder() {
            var data = $("#configurationList li").map(function() {
                return $(this).children().html();
            }).get();
            $("input[name=list1SortOrder]").val(data.join("|"));
        }


      
		//保存配置
        ModelListUI.SaveBtn.click(function(){

            //获得到当前 排序的集合
            var checkList = ModelListUI.ModeList.find("li .radio-hide .moduleChecked").filter(":checked");
            var  codeIds = WebPage.sliceName(checkList);
            ModelListUI.HiddenModel.val(codeIds);

        });
    }

};


