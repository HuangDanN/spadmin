<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "../../common/include.ftl">
<script language="javascript">
$(function() {
	
	
	$("#dataForm").validate({
		rules: {
			"loginname": {
				validIllegalChar: true,
				maxlength: 40,
				required: true,
				lettersonly: true
			},
			"password": {
				validIllegalChar: true,
				required: true,
				minlength: 8,
				maxlength: 16,
				validPwd: true
			},
			"repassword": {
				validIllegalChar: true,
				required: true,
				minlength: 8,
				maxlength: 16,
				validPwd: true,
				equalTo: "#password"
			},
			"realname":{
				validIllegalChar: true,
				required: true,
				maxlength: 20
			},
			"roleId":{
				required: true
			},
			"idcard":{
	//			required: true,
				idcard: true
			},
			"groupId":{
				required: true
			},
			"mobile":{
				isMobile: true
			},
			"note": {
				validIllegalChar: true,
				maxlength:500
			}
		},
		messages: {
			"repassword": {
				equalTo: "密码不相同"
			}
		}
	});
});


function save(){
	
	if(!$("#dataForm").valid()) {return false;}
	var datas = $("#dataForm").serialize(); 
	showAjaxHtml({"wait": true});
	
	$.ajax({
		url:'${ctxPath}/admin/user/add',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '添加用户出错!'});
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
function clearinfoBoxDiv(){
	$("#infoBoxDiv").html("").css("display","none");
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
								<span class="required">*</span>用户名
							</td>
							<td class="td-value">
								<input type="text" style="width:160px;" id="loginname"  name="loginname" title="最多10个字" maxlength="10" onkeyup="this.value=this.value.replace(/[, ]/g,'')" onmousedown="clearinfoBoxDiv()"/>
							</td>
							<td class="td-label">
								<span class="required">*</span>姓名
							</td>
							<td class="td-value">
								<input type="text" style="width:160px;" id="realname" name="realname" onkeyup="this.value=this.value.replace(/[, ]/g,'')"/>
							</td>
						</tr>
						<tr>
							<td class="td-label">
								<span class="required">*</span>密码
							</td>
							<td class="td-value">
								<input type="password" style="width:160px;" name="password" id="password"/>
							</td>
							<td class="td-label">
								<span class="required">*</span>重复密码
							</td>
							<td class="td-value">
								<input type="password" style="width:160px;" id="repassword" name="repassword" />
							</td>
						</tr>
						<tr>
							<td class="td-label">
								<span class="required">*</span>用户角色
							</td>
							<td class="td-value">
								<#if roleList ??>
									<select name="roleId" id="roleId" style="width:167px;">
									<#list roleList as role>
										<option value="${role.roleId}">${role.roleName!''}</option>
									</#list>
									</select>
									<#else>
									请先添加角色
								</#if>
							</td>
							<td class="td-label">
								<span class="required">*</span>组织机构
							</td>
							<td class="td-value">
							
							<@yirong.zTree  nodes="${groupJSON!'[]'}" id="groupId" value="1" nodeName="groupName" nodeId="groupId" nodePId="parentId" afterLoadTree="afterLoadTree" />
							</td>
						</tr>
						<tr>
							<td class="td-label">
								<span class="required">*</span>性别
							</td>
							<td class="td-value">
								<select name="sex" style="width:167px;" >
									<option value="1" selected="selected">男</option>
									<option value="2" >女</option>
								</select>
							</td>
							<td class="td-label">
								手机号码
							</td>
							<td class="td-value">
								<input type="text" style="width:160px;" id="mobile" name="mobile" onkeydown="if(event.keyCode==32||event.keyCode==188||event.keyCode==222){return false;}"  />
							</td>
						</tr>
						<tr>
							 <td class="td-label">
								身份证号
							</td>
							<td class="td-value" >
								<input type="text" style="width:160px;" id="idcard" name="idcard"  />
							</td>
						</tr>
						<tr>
							<td class="td-label" >地址</td>
							<td class="td-value" colspan="3" >
								<input type="text" id="address" name="address" maxlength="100"/>
							</td>
						</tr>
						<tr>
							<td class="td-label" >备注</td>
							<td class="td-value" colspan="3" >
								<textarea  rows="10" name="note" id="note" style="border: 0;" title="最多500个字"></textarea>
							</td>
						</tr> 
					</tbody>
				</table>
			</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>