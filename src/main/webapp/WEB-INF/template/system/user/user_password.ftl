<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>修改密码</title>
<#include "../../common/include.ftl">
<script language="javascript">
$(function() {
	new ToolBar({items:[
		{id:"saveBut", className:"save", func:"save()", text:"保存"},
		{id:"closeBut", className:"close", func:"$.closeWin();return false;", text:"关闭"}
	]});
});


function save(){
	if(!$("#dataForm").valid()) {return false;}

	toolBar.disableBut("saveBut");
	showAjaxHtml({"wait": true});
	
	var datas = $("#dataForm").serialize();
	$.ajax({
		url:'${ctxPath}/admin/user/updatepassword',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false, "msg": '保存数据出错~'});
			toolBar.enableBut("saveBut");
	    },
	    success: function(obj){
	    	showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
	    	if(obj.rs){
				$.info('修改密码成功!', function(){
					$.getWindow().close();
					window.location.reload(true);
				});
	    	}else{
	    		toolBar.enableBut("saveBut");
	    	}
	    }
	 });
}

$(function() {
	$("#dataForm").validate({
		rules: {
			"oldpassword": {
				validIllegalChar: true,
				required: true
			},
			"password": {
				validIllegalChar: true,
				maxlength: 12,
				minlength: 6,
				required: true
			},
			"repassword": {
				validIllegalChar: true,
				maxlength: 12,
				minlength: 6,
				required: true,
				equalTo: "#password"
			}
		},
		messages:{
			"repassword": {
				equalTo: "密码不一致"
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
			<form action="" method="post" id="dataForm" enctype="multipart/form-data" >
				<input type="hidden" name="loginname" value="${Session["sessionUserName"]!''}" />
				<table width="100%">
					<col  width="100"/>
					<col  width="350"/>
					<tbody>
						<tr>
							<td class="td-label"><span class="required">*</span>旧密码</td>
							<td class="td-value"><input type="password" id="oldPassword" name="oldpassword" maxlength="12" style="width:160px;"  title="请输入密码,6~12位."/></td>
						</tr>
						<tr>
							<td class="td-label"><span class="required">*</span>新密码</td>
							<td class="td-value"><input type="password" style="width:160px;" id="password" maxlength="12" name="password" title="请输入密码,6~12位." /></td>
						</tr>
						<tr>
							<td class="td-label"><span class="required">*</span>确认新密码</td>
							<td class="td-value"><input type="password" style="width:160px;" id="repassword" maxlength="12" name="repassword" title="请输入密码,6~12位." /></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>