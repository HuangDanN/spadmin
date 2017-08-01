<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "../../common/include.ftl">
<script language="javascript">
$(function() {
	$("#dataForm").validate({
		rules: {
			"roleName": {
				chineseonly: true,
				maxlength: 40,
				required: true
			},
			"roleCode": {
				alphabet: true,
				maxlength: 40,
				required: true
			},
			"note": {
				validIllegalChar: true,
				maxlength: 500
			}
		}
	});
});


function save(){
	if(!$("#dataForm").valid()) {return false;}
	var datas = $("#dataForm").serialize();
	showAjaxHtml({"wait": true});
	$.ajax({
		url:'${ctxPath}/admin/role/add',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '添加角色出错!'});
	    },
	    success: function(obj){
			showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
	    	if(obj.rs){
				$.info(obj.msg, function(){
					$.getWinOpener().grid.reload();
					$.getWindow().close();
				});
	    	}

	    }
	 });
}
</script>
</head>
<body>
<div class="body-box-form" >
	<div class="content-form">
		<div class="panelBar" id="panelBarDiv">
		<ul>
			<li class="">
				<a class="save" onclick="javascript:save();" id="saveBut"><span>保存</span></a>
			</li>
			<li class="">
				<a class="close" onclick="javascript:$.closeWin();" id="closeBut"><span>关闭</span></a>
			</li>
		</ul>
		</div>
		<div class="infoBox" id="infoBoxDiv"></div>
		<div class="edit-form">
			<form  method="post" id="dataForm">
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label">
								<span class="required">*</span>角色名称
							</td>
							<td class="td-value">
								<input type="text" style="width:160px;"  name="roleName" title="最多10个字" maxlength="10" onkeyup="this.value=this.value.replace(/[, ]/g,'')"  onmousedown="clearinfoBoxDiv()"/>
							</td>
							<td class="td-label">
								<span class="required">*</span>角色编码
							</td>
							<td class="td-value">
								<input type="text" style="width:160px;" name="roleCode" value="ROLE_" onkeyup="this.value=this.value.replace(/[, ]/g,'');this.value=this.value.toUpperCase();"  onmousedown="clearinfoBoxDiv()"/>
							</td>
						</tr>
						<tr>
							<td class="td-label" >备注</td>
							<td class="td-value" colspan="3" >
								<textarea  rows="10" name="note" style="border: 0;" title="最多500个字"></textarea>
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