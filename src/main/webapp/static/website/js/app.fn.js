
/**
 * 普通ajax表单提交
 * 
 * @param {Object}
 *            form
 * @param {Object}
 *            callback
 */
function validateCallback(form, callback) {
	
	var $form = $(form);
	return false;
	var _submitFn = function() {
//		$.ajax({
//			type : form.method || 'POST',
//			url : $form.attr("action"),
//			data : $form.serializeArray(),
//			dataType : "json",
//			cache : false,
//			success : callback || Apps.ajaxDone,
//			error : Apps.ajaxError
//		});
		var options = {
				dataType : "json",
				success : function(json) {
					console.log(8)
					if (json.statusCode == Apps.statusCode.error) {
						if (json.message && alertMsg) {
							alertMsg.error(json.message);
							return false;
						}
					}
					console.log(json.message)
					alertMsg.info(json.message);
					loadSearchForm();
					$("#mainModal").modal('hide');
					
				},
				error : function(result) {
					alertMsg.warn("网络错误!");
				}
			};
			$form.ajaxSubmit(options);
	};
	 $form.bind('valid.form', function() {
	 _submitFn();
	 // 错误不再执行
	 instance.holdSubmit(false);
	 });
	// 方法二：使用form插件提交方式
//	$form.validator({
//		valid : function(form) {
//			var me = this;
//			// 提交表单之前，hold住表单，防止重复提交
//			me.holdSubmit();
//			var options = {
//				dataType : "json",
//				beforeSubmit : function() {
//
//				},
//				success : function(json) {
//					// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
//					me.holdSubmit(false);
//					if (json.statusCode == Apps.statusCode.error) {
//						if (json.message && alertMsg) {
//							alertMsg.error(json.message);
//							return false;
//						}
//					}
//					alertMsg.info(json.message);
//					loadSearchForm();
//					$("#mainModal").modal('hide');
//				},
//				error : function(result) {
//					alertMsg.warn("网络错误!");
//				}
//			};
//			$form.ajaxSubmit(options);
//		}
//	});
//	return false;
	// 方式一
	// $form.validator({
	// valid : function(form) {
	// // 提交表单之前，hold住表单，防止重复提交
	// $.ajax({
	// type : form.method || 'POST',
	// url : $form.attr("action"),
	// data : $form.serializeArray(),
	// dataType : "json",
	// cache : false,
	// success : callback || Apps.ajaxDone,
	// error : Apps.ajaxError
	// });
	// this.holdSubmit(false);
	// },
	// invalid : function(e, form, errors) {
	// return false;
	// }
	// });
	// 方式二 接收表单验证通过的事件
	// var instance = $form.validator({debug:true}).data("validator");
	// if(!instance.isFormValid()){
	// return false;
	// }
	// return false;

	// var instance = $form.validator().data('validator');
	// if(instance.isFormValid()){
	// alert("ko");
	// return false;
	// }
	// return false;
}
/**
 * Dialog上的form提交成功后的处理函数
 * 
 * @param json
 */
function dialogAjaxDone(json) {
	Apps.ajaxDone(json);
	if (json.statusCode == Apps.statusCode.ok) {
		alertMsg.info(json.message);
		loadSearchForm();
		$("#mainModal").modal('hide');
	}
}

/**
 * 处理navTab上的查询, 会重新载入当前navTab
 * 
 * @param {Object}
 *            form
 */
function navTabSearch(form, navTabId) {
	var $form = $(form);
	if (form[Apps.pageInfo.pageNum])
		form[Apps.pageInfo.pageNum].value = 1;

	loadRightPage($form.attr('action'), $form.serializeArray());
	return false;
}
function loadSearchForm() {
	var $form = $("#searchForm");
	loadRightPage($form.attr('action'), $form.serializeArray());
}
function loadRightPage(url, data) {
	var pageContent = $('#pageContent');
	$.post(url, data, function(response) {
		// 响应登录页面时跳转到登录页面
		// if (response.indexOf("loginPage") > 0) {
		// window.location.href = "${ctx}/login";
		// } else {
		pageContent.html(response);
		App.initUI(pageContent);
		// }
	});
}

/**
 * form文件上传 使用方式 在需要上传的form上添加 class formUpload 按上传钮上面添加 class formUploadBtn
 * 
 * @param form
 * @returns {boolean}
 */
function uploadFile(form) {
	var $form = $(form);
	return false;
//	var _submitFn = function() {
//		var options = {
//				dataType : "json",
//				success : function(json) {
//					if (json.statusCode == Apps.statusCode.error) {
//						if (json.message && alertMsg) {
//							alertMsg.error(json.message);
//							return false;
//						}
//					}
//					alertMsg.info(json.message);
//					loadSearchForm();
//					$("#mainModal").modal('hide');
//				},
//				error : function(result) {
//					alertMsg.warn("网络错误!");
//				}
//			};
//			$form.ajaxSubmit(options);
//	};
//	 $form.bind('valid.form', function() {
//	 _submitFn();
//	 // 错误不再执行
//	 instance.holdSubmit(false);
//	 });
	// 接收表单验证通过的事件
//	$form.bind('valid.form', function() {
//		var options = {
//			dataType : "json",
//			beforeSubmit : function() {
//
//			},
//			success : function(json) {
//				if (json.statusCode == Apps.statusCode.error) {
//					if (json.message && alertMsg) {
//						alertMsg.error(json.message);
//						return false;
//					}
//				}
//				alertMsg.info(json.message);
//				loadSearchForm();
//				$("#mainModal").modal('hide');
//			},
//			error : function(result) {
//				alertMsg.warn("网络错误!");
//			}
//		};
//		$form.ajaxSubmit(options);
//		return false;
//	});
//	return false;
}

/**
 * 分页按钮事件
 * 
 * @param _this
 * @returns {boolean}
 */
function goPage(_this) {
	var $this = $(_this);
	var goPagination = $this.closest(".go-pagination");
	var index = goPagination.find(":text").val();
	var total = parseInt(goPagination.attr("totalCount"));

	if (index < 1)
		index = 1;
	else if (index > total)
		index = total;

	$("#pageNum").val(index);

	loadSearchForm();
	return false;
}

/**
 * 下拉选择设置值 selectValue：选中的值； beforeUrl：请求的URL前缀，实际使用为beforeUrl + selectValue；
 * toSelectId:选择项绑定到的节点ID； defName：默认显示名称
 */
function appSelectTo(selectValue, beforeUrl, toSelectId, defName,nextName) {
	var optStr = '<option value="#value#" >#name#</option>';
	if (selectValue !== '') {
		$.get(beforeUrl + selectValue, function(data) {
			
			var dStr = nextName == undefined ? "" : "<option value='' >"+nextName+"</option>";
			
			$.each(data, function(i) {
				dStr += optStr.replace("#value#", data[i].key).replace(
						"#name#", data[i].value);
			});// each end

			if ('' == dStr) {
				if (defName) {
					$("#" + toSelectId).html(
							optStr.replace("#value#", '').replace("#name#",
									defName));
				} else {
					$("#" + toSelectId).html('');
				}
			} else {
				$("#" + toSelectId).html(dStr);
			}
		});
	} else {
		if (defName) {
			$("#" + toSelectId).html(
					optStr.replace("#value#", '').replace("#name#", defName));
		} else {
			$("#" + toSelectId).html('');
		}
	
	
	}
}


function addHiddenFromSelect(_this,hiddenId){
         var hidden = $(hiddenId);
          var $this = $(_this);
         var option  =$this.find("[value='"+$this.val()+"']");
         console.log(option.html());
         hidden.val(option.html());
     }




function addSize(_this){
    var $this = $(_this);
    var $parent  = $this.closest(".clothing-main");
    var nameCode = $parent.find("[name='code']");
    var tag = $.trim(nameCode.val());



    var tagList = $parent.find("#tag-list");

    if(tag == undefined || tag ==""){
        alertMsg.warn("请输入尺寸!","警告");
        return;
    }

    var $template = $("#addSizeTempalte");
    var data ={
        tagName : tag
    };
    WebPage.refreshTemplate(tagList,data,$template,true);
    nameCode.val("");

    var tagHidden = $("#tagHidden");

    var hiddenVal = tagHidden.val();
    if(JString.isEmpty(hiddenVal)){
        tagHidden.val(tag);
    }
    else{
        tagHidden.val(tagHidden.val() + "," +tag);
    }

    return false;
};

function removeSize(_this){
    var $this = $(_this);
    var tagHidden = $("#tagHidden");
    var hiddenVal = tagHidden.val();
    var currentVal = $this.prev().html();

    if(!JString.isEmpty(hiddenVal)){

        var array = hiddenVal.split(",");
        var i = array.indexOf(currentVal);
        array.remove(i);

        tagHidden.val(array.join(","));
    }
    $this.parent().remove();
};