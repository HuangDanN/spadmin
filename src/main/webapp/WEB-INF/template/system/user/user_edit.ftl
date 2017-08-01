<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "../../common/include.ftl">
<script language="javascript">

$(function() {
	$("#dataForm").validate({
		rules: {
			
			"password": {
				validIllegalChar: true,
				required: true,
				minlength: 6,
				maxlength: 12,
				validPwd: true
			},
			"repassword": {
				validIllegalChar: true,
				required: true,
				minlength: 6,
				maxlength: 12,
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
			"groupId":{
				required: true
			},
			"idcard":{
	//			required: true,
				idcard: true
			},
			"mobile":{
				isMobile: true
			},
			"note": {
				validIllegalChar: true,
				maxlength: 500
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
		url:'${ctxPath}/admin/user/update',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '更新用户出错!'});
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
				<a class="save" onclick="javascript:save();" id="saveBut"><span>更新</span></a>
			</li>
			<li class="">
				<a class="close" onclick="javascript:$.closeWin();" id="closeBut"><span>关闭</span></a>
			</li>
		</ul>
		</div>
		<div class="infoBox" id="infoBoxDiv"></div>
		<div class="edit-form">
			<form  method="post" id="dataForm">
				<input type="hidden" id="userId" name="userId" value="${user.userId}" />
				<input type="hidden" name="loginname" value="${user.loginname}" />
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label">
								用户名
							</td>
							<td class="td-value">
								${user.loginname}
							</td>
							<td class="td-label">
								<span class="required">*</span>姓名
							</td>
							<td class="td-value">
								<input type="text" style="width:160px;" value="${user.realname!''}" class="required" name="realname" onkeyup="this.value=this.value.replace(/[, ]/g,'')"/>
							</td>
						</tr>
						<tr>
							<td class="td-label">
								<span class="required">*</span>用户角色
							</td>
							<td class="td-value">
								<#if roleList ??>
									<select name="roleId" style="width:167px;">
									<#list roleList as role>
										<option value="${role.roleId}" <#if user.role??><#if user.role.roleId==role.roleId>selected="selected"</#if></#if> >${role.roleName!''}</option>
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
							
							<@yirong.zTree  nodes="${groupJSON!'[]'}" id="groupId" value="${user.group.groupId!'1'}" nodeName="groupName" nodeId="groupId" nodePId="parentId" afterLoadTree="afterLoadTree" />
							</td>
						</tr>
						<tr>
						<td class="td-label">
								<span class="required">*</span>性别
							</td>
							<td class="td-value">
								<select name="sex" style="width:167px;" >
									<option value="1" <#if user.sex==1>selected="selected"</#if> >男</option>
									<option value="2" <#if user.sex==2>selected="selected"</#if> >女</option>
								</select>
							</td>
							<td class="td-label">
								手机号码
							</td>
							<td class="td-value">
								<input type="text" style="width:160px;" id="mobile" name="mobile" value="${user.mobile!''}" onkeydown="if(event.keyCode==32||event.keyCode==188||event.keyCode==222){return false;}"   />
							</td>
						</tr>
						<tr>
							<td class="td-label">
								身份证号
							</td>
							<td class="td-value" >
								<input type="text" style="width:160px;" id="idcard" name="idcard" value="${user.idcard!''}" />
							</td>
						</tr>
						<tr>
							<td class="td-label" >地址</td>
							<td class="td-value" colspan="3" >
								<input type="text" id="address" name="address" value="${user.address!''}" maxlength="100" />
							</td>
						</tr>
						<tr>
							<td class="td-label" >备注</td>
							<td class="td-value" colspan="3" >
								<textarea  rows="10" name="note" style="border: 0;" title="最多500个字">${user.note!''}</textarea>
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