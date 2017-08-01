<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>添加字典元素</title>
	<#include "../../common/include.ftl">
<script language="javascript">
$(function(){
	new ToolBar({items:[
		{id:"saveBut", className:"save", func:"save(1)", text:"保存"},
		{id:"continueBut", className:"copy", func:"save(2)", text:"保存并继续"},
		{id:"closeBut", className:"close", func:"$.closeWin();return false;", text:"关闭"}
	]});
});


function save(type){
	if(!$("#dataForm").valid()) {return false;}
	
	toolBar.disableBut("saveBut");
	showAjaxHtml({"wait": true});
	$.ajax({
		url:'${ctxPath}/admin/dictItem/dosave',
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
					if(type == 1){
						$.getWinOpener().parent.treeFrame.location.href = "${ctxPath}/admin/dict/gotree?defaultId=${dictId}&dictType=${dictType}";
						$.getWinOpener().location.href="${ctxPath}/admin/dictItem/golist?dictId=${dictId}&dictType=${dictType}";
						$.getWindow().close();
					}else{
						$.getWinOpener().parent.treeFrame.location.href = "${ctxPath}/admin/dict/gotree?defaultId=${dictId}&dictType=${dictType}";
						$.getWinOpener().location.href="${ctxPath}/admin/dictItem/golist?dictId=${dictId}&dictType=${dictType}";
						window.location.reload();
					}
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
			"itemCode": {
				alphabet: true,
				maxlength: 30,
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
				<input type="hidden" id="dictId" name="dictId" value="${dictId}"/>
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label"><span class="required">*</span>元素文本</td>
							<td class="td-value"><input type="text" style="width:160px;" id="itemName" name="itemName" maxlength="100" title="最多100个字" onkeyup="this.value=this.value.replace(/[, ]/g,'')" onmousedown="clearinfoBoxDiv()"/></td>
							<td class="td-label"><span class="required">*</span>元素编码</td>
							<td class="td-value"><input type="text" style="width:160px;" id="itemCode" name="itemCode" value="DICT_ITEM_"  maxlength="30" title="最多30个字"  onkeyup="this.value=this.value.replace(/[, ]/g,'');this.value=this.value.toUpperCase();"  onmousedown="clearinfoBoxDiv()"/></td>
						</tr>
						<tr>
							<td class="td-label"><span class="required">*</span>元素值</td>
							<td class="td-value"><input type="text" style="width:160px;" id="itemValue" name="itemValue" maxlength="150"/></td>
						</tr>
						<tr>
							<td class="td-label">备注</td>
							<td class="td-value" colspan="3">
								<textarea  rows="8" id="note" name="note" title="最多150个字"></textarea>
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