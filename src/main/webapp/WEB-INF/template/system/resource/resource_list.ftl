<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>资源列表 </title>
<#include "../common/include.ftl">
<link href="${adminPath}/css/list.css" rel="stylesheet" type="text/css" />
</head>
<body class="list">
	<div class="body">
		<div class="listBar">
			<h1><span class="icon">&nbsp;</span>资源管理&nbsp;<span class="pageInfo">总记录数: (共页)</span></h1>
		</div>
		<form id="listForm" action="" method="post">
			<div class="operateBar">
				<input type="button" class="addButton" onclick="javascript:location.href='${ctxPath}/admin/role/addResource" value="添加资源" />
				<label>查找:</label>
				<select name="">
					<option value="name">
						资源名称
					</option>
					<option value="value">
						资源值
					</option>
				</select>
				<label class="searchText"><input type="text" name="keyword" value="" /></label><input type="button" id="searchButton" class="searchButton" value="" />
				<label>每页显示:</label>
				<select name="" id="pageSize">
					<option value="10" >
						10
					</option>
					<option value="20" >
						20
					</option>
					<option value="50" >
						50
					</option>
					<option value="100" >
						100
					</option>
				</select>
			</div>
			<table class="listTable">
				<tr>
					<th class="check">
						<input type="checkbox" class="allCheck" />
					</th>
					<th>
						<span class="sort" name="name">资源名称</span>
					</th>
					<th>
						<span class="sort" name="value">资源值</span>
					</th>
					<th>
						<span class="sort" name="isSystem">系统内置</span>
					</th>
					<th>
						<span class="sort" name="orderList">排序</span>
					</th>
					<th>
						操作
					</th>
				</tr>
				<#--
				<#list pager.list as list>
					<tr>
						<td>
							<input type="checkbox" <#if list.isSystem>disabled title="系统内置资源不允许删除!"<#else>name="ids" value="${list.id}"</#if> />
						</td>
						<td>
							${list.name}
						</td>
						<td>
							${list.value}
							&nbsp;
						</td>
						<td>
							<#if list.isSystem == true>
								<img src="${base}/template/admin/images/list_true_icon.gif" />
							<#else>
								<img src="${base}/template/admin/images/list_false_icon.gif" />
							</#if>
						</td>
						<td>
							${list.orderList}
							&nbsp;
						</td>
						<td>
							<a href="resource!edit.action?id=${list.id}" title="编辑">[编辑]</a>
						</td>
					</tr>
				</#list>
				-->
			</table>
			<#--
			 <#if (pager.list?size > 0)>
				<div class="pagerBar">
					<input type="button" class="deleteButton" url="resource!delete.action" value="删 除" disabled hidefocus="true" />
					<#include "/WEB-INF/template/admin/pager.ftl" />
				</div>
			 <#else>
				<div class="noRecord">
					没有找到任何记录!
				</div>
			</#if>
			-->
		</form>
	</div>
</body>
</html>