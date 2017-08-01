<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "../../common/include.ftl">
<script language="javascript">
$(function(){
	$("#dataForm").validate({
		rules: {
			"groupName": {
				validIllegalChar: true,
				maxlength: 10,
				required: true
			},
			"groupDesc": {
				validIllegalChar: true,
				maxlength: 500
			}
		}
	});
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
		url:'${ctxPath}/admin/group/add',
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
	    	toolBar.enableBut("saveBut");
	    	if(obj.rs){
				$.info(obj.msg, function(){
				    var selectGroupId = obj.datas.selectGroupId;
					var treeWindow = $.getWinOpener().parent.frames.treeFrame;
					var listWindow = $.getWinOpener().parent.frames.listFrame;
					treeWindow.location = '${ctxPath}/admin/group/tree?selectGroupId=' + selectGroupId;
					listWindow.location = '${ctxPath}/admin/group/go?groupId=' + selectGroupId + '&childrenNum=0';
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
		<div class="panelBar" id="panelBarDiv"></div>
		<div class="infoBox" id="infoBoxDiv"></div>
		<div class="edit-form">
			<form  method="post" id="dataForm">
				<input type="hidden" name="parentId" value="${parentId!'0'}" style="width:160px;"/>
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label">
								<span class="required">*</span>机构名称
							</td>
							<td class="td-value" colspan="3">
								<input type="text" style="width:160px;"  name="groupName" title="最多10个字" maxlength="10" onkeyup="this.value=this.value.replace(/[, ]/g,'')" onmousedown="clearinfoBoxDiv()"/>
							     <input style="display:none" />  
							</td>
						</tr>
						<tr>
							<td class="td-label" >备注</td>
							<td class="td-value" colspan="3" >
								<textarea  rows="10" name="groupDesc" style="border: 0;" title="最多500个字"></textarea>
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