(function($) {
	$.fn.extend({
		// 全选处理函数
		checkboxCtrl : function(parent) {
			return this.each(function() {
				var $trigger = $(this);
				$trigger.click(function() {
					var group = $trigger.attr("group");
					if ($trigger.is(":checkbox")) {
						var type = $trigger.is(":checked") ? "all" : "none";
						if (group)
							$.checkbox.select(group, type, parent);
					} else {
						if (group)
							$.checkbox.select(group, $trigger
									.attr("selectType")
									|| "all", parent);
					}
				});
			});
		}
	});
	$.checkbox = {
		selectAll : function(_name, _parent) {
			this.select(_name, "all", _parent);
		},
		unSelectAll : function(_name, _parent) {
			this.select(_name, "none", _parent);
		},
		selectInvert : function(_name, _parent) {
			this.select(_name, "invert", _parent);
		},
		select : function(_name, _type, _parent) {
			// console.log("select....");

			$parent = $(_parent || document);
			$checkboxLi = $parent.find(":checkbox[name='" + _name + "']");
			switch (_type) {
			case "invert":
				$checkboxLi.each(function() {
					$checkbox = $(this);
					$checkbox.attr('checked', !$checkbox.is(":checked"));
				});
				break;
			case "none":
				$checkboxLi.attr('checked', false);
				break;
			default:
				$checkboxLi.attr('checked', true);
				break;
			}
		}
	};
	/**
	 * 将所有弹出层水平居中 通过js计算 sherlock
	 */
	$(".modelcalc").unbind().bind('show', function() {
		var $this = $(this);
		// 计算偏移量
		// console.log($this.width());
		var marginWidth = $this.width() / 2;
		// console.log(marginWidth);
		$this.css("margin-left", "-" + marginWidth + "px");
	});
})(jQuery);

var Apps = {
	statusCode : {
		ok : 200,
		error : 300,
		timeout : 301
	},
	pageInfo : {
		pageNum : "pageNum",
		numPerPage : "numPerPage",
		orderField : "orderField",
		orderDirection : "orderDirection"
	},
	_set : {
		loginUrl : "login", // session timeout
		loginTitle : "", // if loginTitle open a login dialog
		debug : false
	},
	debug : function(msg) {
		if (this._set.debug) {
			if (typeof (console) != "undefined") {
				// console.log(msg);
			}

			else
				alert(msg);
		}
	},
	msg : function(key, args) {
		var _format = function(str, args) {
			args = args || [];
			var result = str || "";
			for ( var i = 0; i < args.length; i++) {
				result = result.replace(new RegExp("\\{" + i + "\\}", "g"),
						args[i]);
			}
			return result;
		}
		return _format(this._msg[key], args);
	},
	redirectLogin : function() {
		window.location.href = this._set.loginUrl;
	},
	ajaxError : function(xhr, ajaxOptions, thrownError) {
		if (alertMsg) {
			alertMsg.error("<div>Http status: " + xhr.status + " "
					+ xhr.statusText + "</div>" + "<div>ajaxOptions: "
					+ ajaxOptions + "</div>" + "<div>thrownError: "
					+ thrownError + "</div>" + "<div>" + xhr.responseText
					+ "</div>");
		} else {
			alert("Http status: " + xhr.status + " " + xhr.statusText
					+ "\najaxOptions: " + ajaxOptions + "\nthrownError:"
					+ thrownError + "\n" + xhr.responseText);
		}
	},
	ajaxDone : function(json) {
		if (json.statusCode == Apps.statusCode.error) {
			if (json.message && alertMsg)
				alertMsg.error(json.message);
		} else if (json.statusCode == Apps.statusCode.timeout) {
			Apps.redirectLogin();
		} else {
			// 其它成功的处理
		}
		;
	},
	/**
	 * 全选 bool：是否选中； childClass：所控制的节点ID，注意本函数不能选中不可选状态的节点；
	 */
	checkAll : function(bool, childClass) {
		if (bool) {
			$("input[type=checkbox]." + childClass + ":enabled").attr(
					"checked", true);
		} else {
			$("input[type=checkbox]." + childClass + ":enabled").attr(
					"checked", false);
		}
	},
	/**
	 * 设置是否值 bool：是否选中，toEleId：值所在的节点ID
	 */
	checkValTo : function(bool, toEleId) {
		if (true == bool) {
			$("#" + toEleId).val(1);
		} else {
			$("#" + toEleId).val(0);
		}
	},
	checkHtmlToLogin : function(date) {
		if (data.indexOf("loginPage") > 0) {
			window.location.href = Apps._set.loginUrl;
		}
	}
};

var App = function() {
	$.setRegional = function(key, value) {
		if (!$.regional)
			$.regional = {};
		$.regional[key] = value;
	};
	/**
	 * @param selectedIds
	 *            多选name
	 * @param _box
	 *            选择的区域
	 */
	function _getIds(selectedIds, _box) {
		var ids = "";
		var $box = $(_box || document);
		;
		$box.find("input:checked").filter("[rel='" + selectedIds + "']").each(
				function(i) {
					var val = $(this).val();
					ids += i == 0 ? val : "," + val;
				});
		return ids;
	}
	// 弹出层处理
	var handleDialogLink = function(_box) {
		var $p = $(_box || document);
		// 左侧菜单点击处理-开始
		$("a.dialog", $p).on('click', function(e) {
			e.preventDefault();
			var url = $(this).attr("href");
			var title = $(this).attr("title");

			$.post(url, {}, function(data) {
				var jsonObj;
				try {
					jsonObj = jQuery.parseJSON(data);
				} catch (err) {
				} finally {
					if (typeof jsonObj == 'undefined') {
						// 响应登录页面时跳转到登录页面
						if (data.indexOf("loginPage") > 0) {
							window.location.href = Apps._set.loginUrl;
						} else {
							var $mainModel = $("#mainModal");
							$mainModel.html(data);
							App.initUI($mainModel);
							$("#mainModal .modal-title").html(title);
							$mainModel.modal({
								keyboard : false,
								backdrop : "static",
								show : true
							});
						}
					} else {
						alertMsg.warn(jsonObj.message);
					}
				}

			});
		});// 左侧菜单点击处理-结束
	}
	// 确认连接处理
	var handleConfirmLink = function(_box) {
		$('.xheditor')
				.xheditor(
						{
							width : "100%",
							tools : 'Fontface,FontSize,Bold,Italic,Underline,FontColor,BackColor,Align'
						});
		var $p = $(_box || document);
		// 左侧菜单点击处理-开始
		$("a.ajaxTodo", $p).unbind().on('click', function(e) {
			e.preventDefault();
			var url = $(this).attr("rel");
			var title = $(this).attr("title");
			var op = $(this).attr("op") || "delete";
			var selectedIds = $(this).attr("postName") || "ids";
			var postType = $(this).attr("postType") || "map";
			var warn = $(this).attr("warn") || "请确认您的操作";
			var ids = _getIds(selectedIds, $(".result"));

			alertMsg.confirm(warn, function() {
				// Json响应处理
				$.ajax({
					type : 'POST',
					url : url,
					data : function() {
						if (op == 'delete') {
							return {};
						}
						if (postType == 'map') {
							return $.map(ids.split(','), function(val, i) {
								return {
									name : selectedIds,
									value : val
								};
							})
						} else {
							var _data = {};
							_data[selectedIds] = ids;
							return _data;
						}
					}(),
					dataType : "json",
					cache : false,
					success : function(response) {
						// 响应登录页面时跳转到登录页面
						// 解析JSON
						if (response.statusCode == "200") {
							alertMsg.info(response.message, "操作成功");
							loadSearchForm();
							//
						} else {
							alertMsg.error(response.message);
						}
					},
					error : function(response) {
						// 这里会出现
						alertMsg.error("网络或者系统故障!", "操作失败");
					}
				});
			});
			// $("#mainConfirmModal .modal-title").text(title);
			// $("#mainConfirmModal .modal-body").text(warn);
			// // 绑定确认按钮时间
			// $("#mainConfirmModal .btn-primary").unbind().click(function(btnE)
			// {
			// btnE.preventDefault();
			// // Json响应处理
			// $.ajax({
			// type : 'POST',
			// url : url,
			// data : function() {
			// if (op == 'delete') {
			// return {};
			// }
			// if (postType == 'map') {
			// return $.map(ids.split(','), function(val, i) {
			// return {
			// name : selectedIds,
			// value : val
			// };
			// })
			// } else {
			// var _data = {};
			// _data[selectedIds] = ids;
			// return _data;
			// }
			// }(),
			// dataType : "json",
			// cache : false,
			// success : function(response) {
			// // 响应登录页面时跳转到登录页面
			// // 解析JSON
			// if (response.statusCode == "200") {
			// $("#mainConfirmModal").modal("hide");
			// alertMsg.info("操作成功", response.message);
			// loadSearchForm();
			// //
			// } else {
			// alertMsg.error("操作失败", response.message);
			// }
			// },
			// error : function(response) {
			// // 这里会出现
			// alertMsg.error("操作失败", "网络或者系统故障!");
			// }
			// });
			// });
			// $("#mainConfirmModal").modal('show');

		});// 左侧菜单点击处理-结束
	}
	// 右侧刷新处理
	var handleRightTabLink = function(_box) {
		var $p = $(_box || document);
		// 左侧菜单点击处理-开始
		$("a.ajaxify", $p).on('click', function(e) {
			e.preventDefault();
			var url = $(this).attr("href");
			var pageContent = $('#pageContent');
			$.post(url, {}, function(data) {
				// 响应登录页面时跳转到登录页面
				Apps.checkHtmlToLogin(data);
				pageContent.html(data);
			});
		});// 左侧菜单点击处理-结束
	}
	// 分页处理
	var handlePagination = function(_box) {
		var $p = $(_box || document);
		$(".pagination", $p).each(
				function() {
					var $pDiv = $(this);
					var totalCount = $pDiv.attr("totalCount");
					var numPerPage = $pDiv.attr("numPerPage");
					var currentPage = $pDiv.attr("currentPage");
					var pageNumShown = $pDiv.attr("pageNumShown");
					var totalPages = $pDiv.attr("totalPages");

					// 传递页数
					$pDiv.parent().find(".go-pagination-num span").html(
							"共" + totalPages + "页，去第 ");
					$pDiv.parent().find(".go-pagination").attr("totalCount",
							totalPages);

					// 创建分页
					$pDiv.pagination(totalCount, {
						maxentries : totalCount, // 边缘页数
						num_edge_entries : 1, // 边缘页数
						current_page : currentPage - 1, // 边缘页数
						num_display_entries : pageNumShown, // 主体页数
						items_per_page : numPerPage, // 每页显示1项
						callback : function pageselectCallback(index) {
							$("#pageNum").val(parseInt(index) + 1);
							loadSearchForm();
						},
						prev_text : "上一页",
						next_text : "下一页"
					});
					if (totalPages == 0) {
						$pDiv.hide();
						$pDiv.parent().find(".go-pagination").hide();
					}
				});
	}

	// 绑定全选事件
	var handlerCheckAll = function(_html) {
		var $p = $(_html || document);
		$(".checkboxCtrl", $p).each(
				function() {
					$(this).click(
							function() {
								var checked = this.checked;
								var target = $(this).attr("rel") || '.result';
								var group = $(this).attr("group") || "ids";
								var ckList = $(target).find(
										"input[type='checkbox'][rel='" + group
												+ "']");
								WebPage.toggleCheckBox(ckList, checked);
							});
				});
	}

	// 对表单进行数据校验
	var handlerValidateForm = function(_html) {
		var $p = $(_html || document);
		$("form.required-validate", $p)
				.each(
						function() {
							var $form = $(this);
							$form
									.validator({
										rules : {
											numeric : [
													/^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/,
													'请输入数字(xx.xx)' ]
										},
										valid : function(form) {
											var me = this;
											// 提交表单之前，hold住表单，防止重复提交
											me.holdSubmit();

											// 检测
											if ($(".checkIdsRes") != undefined
													&& $(".checkIdsRes").length != 0) {
												handleCheckIds();
											}

											var options = {
												dataType : "json",
												beforeSubmit : function() {

												},
												success : function(json) {
													// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
													me.holdSubmit(false);
													var jsonObj;
													try {
														jsonObj = jQuery
																.parseJSON(json);
													} catch (err) {
													} finally {
														if (typeof jsonObj == 'undefined') {
															// 响应登录页面时跳转到登录页面
															window.location.href = Apps._set.loginUrl;
														} else {
															// 是Json
															if (json.statusCode == Apps.statusCode.error) {
																if (json.message
																		&& alertMsg) {
																	alertMsg
																			.error(json.message);
																	return false;
																}
															}
															alertMsg
																	.info(json.message);
															if ('noReload' != json.callbackType) {
																loadSearchForm();
															}
															$("#mainModal")
																	.modal(
																			'hide');
														}
													}
												},
												error : function(result) {
													// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
													me.holdSubmit(false);
													alertMsg.warn("网络错误!");
												}
											};
											$form.ajaxSubmit(options);
										}
									});
						});
		// $("form.required-validate", $p).each(
		// function() {
		// var $form = $(this);
		// $form
		// .validate({
		// onsubmit : false,
		// focusInvalid : false,
		// focusCleanup : true,
		// errorElement : "span",
		// ignore : ".ignore",
		// invalidHandler : function(form, validator) {
		// var errors = validator.numberOfInvalids();
		// if (errors) {
		// var message = Apps
		// .msg("validateFormError",
		// [ errors ]);
		// alertMsg.error("您提交的数据存在问题，请更正后再提交:"
		// + message);
		// }
		// }
		// });
		//
		// $form.find('input[customvalid]').each(function() {
		// var $input = $(this);
		// $input.rules("add", {
		// customvalid : $input.attr("customvalid")
		// })
		// });
		// });
	}

	return {
		init : function() {
			handleRightTabLink();
			handleConfirmLink();
			handleDialogLink();
		},
		initUI : function(_box) {
			var $p = $(_box || document);
			handlerValidateForm($p);
			handleRightTabLink($p);
			handleConfirmLink($p);
			handleDialogLink($p);
			handlePagination($p);

			handlerCheckAll($p);
			// $(":button.checkboxCtrl, :checkbox.checkboxCtrl",
			// $p).checkboxCtrl($p);

		},
		// 对主页左侧菜单进行事件绑定
		initSiderbar : function() {
			jQuery('.siderbar')
					.on(
							'click',
							'.accordion-main  .ajaxify',
							function(e) {
								e.preventDefault();
								var url = $(this).attr("href");
								if (url === '#') {
									alertMsg.warn("正在努力开发中，敬请期待");
									return false;
								}
								var pageContent = $('#pageContent');
								// 清除已选中的状态
								// var menuContainer = jQuery('#siderbar');
								// menuContainer.children('li.active').removeClass('active');
								// 标识当前为选中状态
								// $(this).parents('li').addClass('active');

								$
										.ajax({
											type : 'POST',
											url : url,
											data : {},
											dataType : "html",
											cache : false,
											success : function(data,
													textStatus, jqXHR) {
												var jsonObj;
												try {
													jsonObj = jQuery
															.parseJSON(data);
												} catch (err) {
												} finally {
													if (typeof jsonObj == 'undefined') {
														// 响应登录页面时跳转到登录页面
														if (data
																.indexOf("loginPage") > 0) {
															window.location.href = Apps._set.loginUrl;
														} else {
															pageContent
																	.html(data);
															App
																	.initUI(pageContent);
														}
													} else {
														alertMsg
																.warn(jsonObj.message);
													}
												}
											},
											error : function(xhr, status, text) {
											},
											statusCode : {
												404 : function() {
													alertMsg
															.error("您请求的页面不存在！");
												},
												500 : function() {
													alertMsg.error("网络或者系统故障!");
												},
												502 : function() {
													alertMsg.error("网络或者系统故障!");
												}
											}
										});
							});
		}
	};
}();

function loadContentToDom(form, domSpe, checkUN) {
	var $dom = $(domSpe);
	var $form = $(form);
	var datas = $form.serialize();
	var url = $form.attr("action");

	if (checkUN) {
		var temp = checkUN();
		if (temp == false)
			return false;
	}
	$.ajax({
		type : 'POST',
		url : url,
		data : datas,
		dataType : "html",
		cache : false,
		success : function(data, textStatus, jqXHR) {
			$dom.html(data);
		},
		error : function(xhr, status, text) {
		},
		statusCode : {
			404 : function() {
				alert("您请求的页面不存在！");
			},
			502 : function() {
				alert("网络或者系统故障!");
			}
		}
	});

	return false;
}

// ckbox 选中赋值
$(document).on("click", ".check-rules", function() {
	var $this = $(this);
	var st = $this.val();
	if ($this.is(":checked")) {
		st = 1;
	} else {
		st = 0;
	}
	$this.val(st);
});

// hack ie 不支持change
function inputChange(_this) {
	var $this = $(_this);
	var result = $this.closest(".fileMain").find(".fileResult");
	result.html($this.val());
};

function handleCheckIds() {
	$(".checkIdsRes").each(function(i) {
		var $this = $(this);
		var name = $this.attr("check-name");
		var hidden = $this.find("[type='hidden']");
		var ids = _getIds(name, $this);
		hidden.val(ids);
	});

};

function _getIds(selectedIds, _box) {
	var ids = "";
	var $box = $(_box);

	var checkeds = $box.find("input:checked");
	for ( var i = 0; i < checkeds.length; i++) {
		var ck = checkeds[i];
		ids += ck.value + ",";
	}
	if (checkeds.length > 0) {
		ids = ids.substring(0, ids.length - 1);
	}
	return ids;
}
