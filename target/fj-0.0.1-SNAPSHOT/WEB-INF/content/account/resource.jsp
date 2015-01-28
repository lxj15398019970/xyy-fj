<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
	<div class="pageHeader">
	</div>
	
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<li class="line">line</li>
				<li class=""><a class="icon" href="#"><span>导出EXCEL</span></a></li>
			</ul>
		</div>
	
		<table class="list" width="98%" layoutH="66">
			<thead>
				<tr>
					<th width="80">顺序</th>
					<th width="80">URL</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="allResourceList">
				<tr target="sid_resource" rel="${id}">
					<td>${position}</td>
					<td>${value}</td>
				</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="panelBar" >

		</div>
	</div>
</div>