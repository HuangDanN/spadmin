<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>查看字典元素</title>
	<#include "../../common/include.ftl">
<script language="javascript">
var isDetail = true;

$(function(){
	new ToolBar({items:[
		{id:"saveBut", className:"a1", func:"update()", text:"编辑"}
	]});
});

function update(){
	$.openWin({url: "${ctxPath}/admin/dictItem/goedit?dictId=${dictItem.dictId}&dictType=${dictType}&itemId=${dictItem.itemId!''}", title:'编辑字典元素'});
}
</script>
</head>
    
<body>
<div class="body-box-form" >
	<div class="content-form">
		<div class="panelBar" id="panelBarDiv"></div>
		<div class="edit-form">
			<form action="" method="post" id="dataForm" enctype="multipart/form-data">
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label">元素名称</td>
							<td class="td-value">${dictItem.itemName!'' }</td>
							<td class="td-label">元素编码</td>
							<td class="td-value">${dictItem.itemCode!'' }</td>
						</tr>
						<tr>
							<td class="td-label">元素值</td>
							<td class="td-value">${dictItem.itemValue!'' }</td>
							<td class="td-label">创建时间</td>
							<td class="td-value"><#if dictItem.createDate??>${dictItem.createDate?datetime}</#if></td>
						</tr>
						<tr>
							<td class="td-label" >备注</td>
							<td class="td-value" colspan="3">
								<div style="height:40px;" class="textAreaDiv">${dictItem.note!''}</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>