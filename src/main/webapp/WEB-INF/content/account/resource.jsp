<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
	<div class="pageHeader">
	</div>
	
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<li class="toolBar-btn"><a class="icon" href="#">导出EXCEL</a></li>
			</ul>
		</div>
	
		<table class="list" width="100%" layoutH="66">
			<thead>
				<tr>
					<th width="50%">顺序</th>
					<th width="50%">URL</th>
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