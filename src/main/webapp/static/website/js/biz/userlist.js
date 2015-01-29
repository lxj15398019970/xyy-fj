/**
 * Created by gbdai on 14-3-5.
 */


$(function(){

    //绑定全选事件
    $("#ckUserAll").click(function(){
        var checked = this.checked;
        var ckList = $("#tableListMain").find("input[type='checkbox']");
        WebPage.toggleCheckBox(ckList,checked);
    });


    //批量删除用户
//    var removeUser = $("#removeUser");
//    removeUser.click(function(){
//
//        //获得id集合
//        var checkList =  $("#tableList").find("input[type='checkbox']").filter(":checked");
//
//        if(checkList.length <= 0){
//            alert("请选择要删除的用户!");
//            return;
//        }
//
//        var array = [];
//        for(var i =0;i<checkList.length;i++){
//            var ck = $(checkList[i]);
//            var id = ck.attr("data-id");
//            array.push(id);
//        }
//
//
//
//      	
//       
//
//        var url = $(this).attr("rel");
//        var title = $(this).attr("title");
//        var warn = $(this).attr("warn");
//        $("#mainConfirmModal .modal-title").text(title);
//        $("#mainConfirmModal .modal-body").text(warn);
//        // 绑定确认按钮时间
//        $("#mainConfirmModal .btn-primary").unbind().click(function(btnE) {
//        	   var json = [{ids : "1"},{"ids":"2"}];
//            btnE.preventDefault();
//            // Json响应处理
//            $.ajax({
//                type : 'POST',
//                url : url,
//                data : {"ids" : [20,30,40] },
//                dataType : "json",		
//                cache : false,
//
//                success : function(result){
//                    alert(result);
//                },
//                error : function(response) {
//                    // 这里会出现
//                    alertMsg.error("操作失败", "网络或者系统故障!");
//                }
//            });
//        });
//        $("#mainConfirmModal").modal('show');
//    });





});
//@ sourceURL=test.js
