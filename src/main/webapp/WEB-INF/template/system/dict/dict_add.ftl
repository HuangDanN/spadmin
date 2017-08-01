<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>添加字典</title>
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
		url:'${ctxPath}/admin/dict/dosave',
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
					$.getWinOpener().parent.location.reload();
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
			"dictName": {
				chineseonly: true,
				maxlength: 50,
				required: true
			},
			"dictCode": {
				alphabet: true,
				maxlength: 30,
				required: true
			},
			"note": {
				validIllegalChar: true,
				maxlength: 200
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
			
				<input type="hidden" id="dictType" name="dictType" value="${dictType}" />
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label"><span class="required">*</span>字典名称</td>
							<td class="td-value"><input type="text" style="width:160px;" id="dictName" name="dictName" maxlength="100" title="最多50个字" onkeyup="this.value=this.value.replace(/[, ]/g,'')" onmousedown="clearinfoBoxDiv()"/></td>
							<td class="td-label"><span class="required">*</span>字典编码</td>
							<td class="td-value"><input type="text" style="width:160px;" id="dictCode" name="dictCode" maxlength="30" title="最多30个字" onkeyup="this.value=this.value.replace(/[, ]/g,'');this.value=this.value.toUpperCase();" value="DICT_"   onmousedown="clearinfoBoxDiv()"/></td>
						</tr>
						<tr>
							<td class="td-label" >备注</td>
							<td class="td-value" colspan="3">
								<textarea  rows="8" id="note" name="note" title="最多200个字"></textarea>
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