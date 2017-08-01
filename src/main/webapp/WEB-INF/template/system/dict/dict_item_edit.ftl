<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>编辑字典元素</title>
	<#include "../../common/include.ftl">
<script language="javascript">
$(function(){
	new ToolBar({items:[
		{id:"saveBut", className:"save", func:"save()", text:"保存"},
		{id:"closeBut", className:"close", func:"$.closeWin();return false;", text:"关闭"}
	]});
});

function save(w){
	if(!$("#dataForm").valid()) {return false;}
	
	toolBar.disableBut("saveBut");
	showAjaxHtml({"wait": true});
	$.ajax({
		url:'${ctxPath}/admin/dictItem/doupdate',
		type: 'post',
		data: $("#dataForm").serialize(),
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false, "msg": '保存数据出错~'});
			toolBar.enableBut("saveBut");
	    },
	    success: function(obj){
	    	showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
	    	if(obj.rs){
				$.info(obj.msg, function(){
					if($.getWinOpener().isDetail){
						$.getWinOpener().location.href="${ctxPath}/admin/dictItem/godetail?itemId=${dictItem.itemId}&dictType=${dictType}";
					}else{
						$.getWinOpener().grid.reload();
					}
					$.getWindow().close();
				});
	    	}else{
	    		toolBar.enableBut("saveBut");
	    	}
	    }
	 });
}

//校验函数
$(function() {
	$("#dataForm").validate({
		rules: {
			"itemName": {
				validIllegalChar: true,
				maxlength: 100,
				required: true
			},
			"itemValue": {
				validIllegalChar: true,
				maxlength: 150,
				required: true
			},
			"note": {
				validIllegalChar: true,
				maxlength: 150
			}
		}
	});
});
</script>
</head>
<body>
<div class="body-box-form" >
	<div class="content-form">
		<div class="panelBar" id="panelBarDiv"></div>
		<div class="infoBox" id="infoBoxDiv"></div>
		<div class="edit-form">
			<form action="" method="post" id="dataForm" enctype="multipart/form-data">
				<input type="hidden" id="itemId" name="itemId" value="${dictItem.itemId!''}"/>
				<input type="hidden" id="dictId" name="dictId" value="${dictItem.dictId!''}"/>
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label"><span class="required">*</span>元素文本</td>
							<td class="td-value"><input type="text" style="width:160px;" id="itemName" name="itemName" value="${dictItem.itemName }"  maxlength="100" title="最多50个字"  onmousedown="clearinfoBoxDiv()"/></td>
							<td class="td-label"><span class="required">*</span>元素编码</td>
							<td class="td-value" title="编码不能修改">${dictItem.itemCode!''}</td>
						</tr>
						<tr>
							<td class="td-label">元素值</td>
							<td class="td-value">
								<#if dictItem.itemCode=='DICT_ITEM_OCX_LIVE'>
									<select id="itemValue" name="itemValue" style="width:160px;">
										<option value="true" <#if dictItem.itemValue=='true'>selected</#if>>true</option>
										<option value="false" <#if dictItem.itemValue=='false'>selected</#if>>false</option>
									</select>
									<#else>
									<input type="text" style="width:160px;" id="itemValue" name="itemValue" value="${dictItem.itemValue!''}" maxlength="150"/>
								</#if>
							</td>
						</tr>
						<tr>
							<td class="td-label">备注</td>
							<td class="td-value" colspan="3">
								<textarea  rows="8" id="note" name="note" title="最多150个字">${dictItem.note!''}</textarea>
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