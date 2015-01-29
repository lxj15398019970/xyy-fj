<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<c:choose>
	<c:when test="${menu eq 'stat' }">
		<ul class="nav nav-tabs nav-stacked siderbar" id="siderbar">
			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="${ctx}/step/serach"> <i class="icon-link"></i>环节办理查询
					</a>
				</div>
			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="#"><i class="icon-groupQuery"></i>汇总统计</a>
				</div>
			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a href="#"><i class="icon-detail"></i>明细统计</a>
				</div>
			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="#"> <i class="icon-studentInfo"></i>学生信息查询
					</a>
				</div>
			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="#"><i class="icon-dormitoryCheckIn"></i>宿舍入住查询</a>
				</div>
			</li>

			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="#"><i class="icon-finance"></i>财务交费查询</a>
				</div>
			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="#"><i class="icon-mobile"></i>手机办理查询</a>
				</div>
			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="#"><i class="icon-live"></i>生活用品查询</a>
				</div>
			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="#"><i class="icon-selectClass"></i>选班查询</a>
				</div>
			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="#"><i class="icon-mealCard"></i>饭卡查询</a>
				</div>
			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="#"><i class="icon-militaryTraining"></i>军训查询</a>
				</div>
			</li>

			<li class="accordion-main">
				<div class="accordion-title  left-nav-cursor">
					<a class="ajaxify" href="#"><i class="icon-addressBook"></i>通讯录查询</a>
				</div>
			</li>

		</ul>
	</c:when>

	<c:when test="${menu eq 'stuAdmin' }">
		<ul class="nav nav-tabs nav-stacked siderbar" id="siderbar">

			<shiro:hasPermission name="PRE_stu_hostel">
				<li class="accordion-main">
					<div class="accordion-title left-nav-cursor">
						<a class="ajaxify_default "> <i class="icon-dormitory"></i>宿舍管理<i
							class="icon-18 icon-add"></i>
						</a>
					</div>
					<ul class="accordion-content">
						<li><a class="left-nav-cursor sub ajaxify"
							href="${ctx }/manage/hostel/hostelFloor"><i class="icon-dormitory"></i>宿舍楼维护</a>
						</li>
						<li><a class="left-nav-cursor sub ajaxify"
							href="${ctx }/manage/hostel/hostelType"><i class="icon-dormitory"></i>宿舍类型维护</a>
						</li>
						<li><a class="left-nav-cursor sub ajaxify"
							href="${ctx }/manage/hostel/hostelRoom"><i class="icon-dormitory"></i>宿舍维护</a>
						</li>
						<li><a class="left-nav-cursor sub ajaxify"
							href="${ctx }/manage/hostel/hostelBed"><i class="icon-dormitory"></i>床位维护</a>
						</li>
					</ul>
				</li>
			</shiro:hasPermission>

			<shiro:hasPermission name="PRE_stu_faculty">
				<li class="accordion-main">
					<div class="accordion-title left-nav-cursor">
						<a class="ajaxify_default "><i class="icon-dormitory"></i>组织机构 <i
							class="icon-18 icon-add"></i></a>
					</div>
					<ul class="accordion-content">
						<li><a class="ajaxify left-nav-cursor sub"
							href="${ctx}/manage/dict/dictFaculty"><i class="icon-studentInfo"></i>院系管理</a>
						</li>
						<li><a class="ajaxify left-nav-cursor sub"
							href="${ctx}/manage/dict/dictSpecialty"><i class="icon-studentInfo"></i>专业管理</a>
						</li>
						<li><a class="ajaxify left-nav-cursor sub"
							href="${ctx}/manage/dict/dictClasses"><i class="icon-studentInfo"></i>班级管理</a>
						</li>
						<li><a class="ajaxify left-nav-cursor sub"
							href="${ctx}/manage/dict/dictCounsellor"><i class="icon-studentInfo"></i>辅导员管理</a>
						</li>
					</ul>
				</li>
			</shiro:hasPermission>

			<!-- 缴费管理 -->
			<shiro:hasPermission name="PRE_stu_payment">
				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx}/manage/pay/"> <i
							class="icon-finance"></i>缴费项目管理
						</a>
					</div>

				</li>
				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx}/manage/payset/"> <i
							class="icon-finance"></i> 缴费院系管理
						</a>
					</div>
				</li>
			</shiro:hasPermission>
			<!-- 物品管理 -->
			<shiro:hasPermission name="PRE_stu_goods">
				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx}/manage/goods"><i
							class="icon-live"></i>物品管理</a> </a>
					</div>
				</li>
			</shiro:hasPermission>
			<!-- 服装管理 -->
			<shiro:hasPermission name="PRE_stu_clothing">
				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx}/manage/clothing"><i
							class="icon-live"></i>服装管理</a> </a>
					</div>
				</li>
			</shiro:hasPermission>
			
			<!-- 学生信息 -->
			<shiro:hasPermission name="PRE_stu_stuInfo">
				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx}/manage/student"><i
							class="icon-studentInfo"></i>学生信息</a> </a>
					</div>
				</li>
			</shiro:hasPermission>

			<!-- 手机维护 -->
			<shiro:hasPermission name="PRE_stu_mobile">
				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a href="${ctx}/manage/mobile" class="ajaxify"><i
							class="icon-mobileManagement"></i>手机维护</a> </a>
					</div>
				</li>
			</shiro:hasPermission>

		</ul>

	</c:when>

	<c:when test="${menu eq 'sysAdmin' }">
		<ul class="nav nav-tabs nav-stacked siderbar" id="siderbar">
			<shiro:hasPermission name="PRE_system_sysconfig">
				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx }/system/sysconfig"> <i
							class="icon-SystemSettings"></i>系统设置
						</a>
					</div>
				</li>
			</shiro:hasPermission>
			<shiro:hasPermission name="PRE_system_sysnotice">

				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx }/system/sysnotice"> <i
							class="icon-SystemSettings"></i>系统通知
						</a>
					</div>
				</li>

			</shiro:hasPermission>
			<shiro:hasPermission name="PRE_system_user">

				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx }/system/user"><i
							class="icon-rightsManagement"></i>账号管理</a>
					</div>
				</li>

			</shiro:hasPermission>
			<shiro:hasPermission name="PRE_system_role">

				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx }/system/role"><i
							class="icon-rightsManagement"></i>角色管理</a>
					</div>
				</li>

			</shiro:hasPermission>
			<shiro:hasPermission name="PRE_system_sys_module">

				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx }/system/sysmodule"><i
							class="icon-configuration"></i>系统环节配置</a>
					</div>
				</li>

			</shiro:hasPermission>
			<shiro:hasPermission name="PRE_system_tel_module">

				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx }/system/telmodule"><i
							class="icon-configuration"></i>电信环节配置</a>
					</div>
				</li>

			</shiro:hasPermission>
			<shiro:hasPermission name="PRE_system_sch_module">

				<li class="accordion-main">
					<div class="accordion-title  left-nav-cursor">
						<a class="ajaxify" href="${ctx }/system/schmodule"><i
							class="icon-configuration"></i>学校环节配置</a>
					</div>
				</li>

			</shiro:hasPermission>
			<!-- <li><a class="ajaxify" href="#"><i
            class="icon-systemTesting"></i>系统检测</a></li>
            <li><a class="ajaxify" href="#"><i
            class="icon-logManagement"></i>日志管理</a></li>
            <li><a class="ajaxify" href="#"><i class="icon-dataImport"></i>数据导入</a></li >-->
		</ul>
	</c:when>
</c:choose>
