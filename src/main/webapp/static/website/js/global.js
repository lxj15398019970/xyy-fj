/**
 * Created by sfdeng on 14-2-17.
 */

$(function() {
	/*===========================分页开始====================================*/
	var initPagination = function() {
		var num_entries = $("#hiddenresult div.result").length;
		// 创建分页
		$("#Pagination").pagination(num_entries, {
			num_edge_entries : 1, //边缘页数
			num_display_entries : 4, //主体页数
			callback : pageselectCallback,
			items_per_page : 1, //每页显示1项
			prev_text : "上一页",
			next_text : "下一页"

		});
	}();
	function pageselectCallback(page_index, jq) {
		var new_content = $("#hiddenresult div.result:eq(" + page_index + ")").clone();
		$("#Searchresult").empty().append(new_content);
		//装载对应分页的内容
		return false;
	}

	/*===========================分页结束====================================*/
	/*===========================复选框开始====================================*/
	$('input[type="checkbox"]').iCheck({
		checkboxClass : 'icheckbox_square-blue',
		radioClass : 'iradio_square-blue',
		increaseArea : '20%' // optional
	});
	/*===========================复选框结束====================================*/
	/*===========================table全选，单选开始====================================*/
	var $checkBoxAll = $('#checkboxAll'), $checkBox = $('.table tbody .icon-checkbox');


	/*===========================table全选，单选结束====================================*/

	//手风琴菜单初始化
	$(".accordion-title").on("click", function() {
		var $this = $(this);
		var $parent = $this.parent();

		//展开的收缩
		if ($this.hasClass("active")) {
			$this.removeClass("active");
			$parent.find(".accordion-content").slideUp();
			return;
		}
		$this.addClass("active");
		$parent.find(".accordion-content").slideDown();
		$this.closest(".accordion-main").siblings().find(".accordion-title").removeClass("active").parent().find(".accordion-content").slideUp();
	});

	//字菜单样式调整
	$(".left-nav-cursor.sub").on("click", function() {
		//清除所有选中的
		$('#siderbar').find('li.active').removeClass('active');
		
		//添加当前为选中
		$(this).parent().addClass('active');
		
		
		$(".left-nav-cursor.sub").removeClass("active");
		$(this).addClass("active");
	});

});

/**
 * 页面公共常量
 * @type {{separated: string}}
 */
var Contants = {
	separated : ","
}