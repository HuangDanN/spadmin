<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "../../common/include.ftl">
<script language="javascript">
$(function(){
	new ToolBar({items:[
		{id:"saveBut", className:"save", func:"save()", text:"保存"},
		{id:"closeBut", className:"close", func:"$.closeWin();return false;", text:"关闭"}
	]});
});

function save(){
	if(!$("#dataForm").valid()) {return false;}
	
	var datas = $("#dataForm").serialize();
	showAjaxHtml({"wait": true});
	$.ajax({
		url:'${ctxPath}/admin/menu/add',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '添加菜单出错!'});
	    },
	    success: function(obj){
			showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
	    	if(obj.rs){
				$.info(obj.msg, function(){
					$.getWinOpener().parent.treeFrame.location.reload();
					$.getWindow().close();
				});
	    	}
	    }
	 });
}

$(function() {
	$("#menuUrl").css("visibility", "hidden");
		
	$("#menuType").change(function(){
		if(this.value == 3 ){
			$("#menuUrl").css("visibility", "visible").rules("add",{"required":true});
		}else{
			$("#menuUrl").val('');
			$("#menuUrl").css("visibility", "hidden").rules("remove","required");
		}
	})

	$("#dataForm").validate({
		rules: {
			"menuName": {
				validIllegalChar: true,
				maxlength: 100,
				required: true
			},
			"menuUrl": {
				validIllegalChar: true,
				maxlength: 200
			},
			"orderNo": {
				validIllegalChar: true,
				maxlength: 9,
				positiveInteger: true,
				required: true
			},
			"remark": {
				validIllegalChar: true,
				maxlength: 500
			},
			"note": {
				validIllegalChar: true,
				maxlength: 500
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
				<input type="hidden" name="menuLevel" value="${parentMenu.menuLevel!'1'}"/>
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label"><span class="required">*</span>菜单名称</td>
							<td class="td-value"><input type="text" style="width:160px;"  name="menuName" title="最多10个字" maxlength="10" class="required" onkeyup="this.value=this.value.replace(/[, ]/g,'')"  onmousedown="clearinfoBoxDiv()"/></td>
							<td class="td-label">父类菜单</td>
							<td class="td-value">
							<#if parentMenu??>
								<input type="hidden" name="parentId" value="${parentMenu.menuId!'0'}"/>
								<input type="text" name="parentName" value="${parentMenu.menuName!'无'}"  readonly="readonly" style="width:160px;"/>
							<#else>
								<input type="hidden" name="parentId" value="0"/>
								<input type="text" name="parentName" value="顶级菜单"  readonly="readonly" style="width:160px;"/>
							</#if>
							</td>
							
						</tr>
						<tr>
							<td class="td-label">菜单类型</td>
							<td class="td-value">
								<select name="menuType" id="menuType" style="width:167px;">
									<#if parentMenu.menuLevel == 1>
										<option value="1">Tab菜单</option>
									<#else>
										<option value="2">文件夹菜单</option>
										<option value="3">URL菜单</option>
									</#if>
								</select>
							</td>
							<td class="td-label">
								<span class="required" id="urlSign" style="visibility:hidden;">*</span>操作链接
							</td>
							<td class="td-value">
							<#if parentMenu.menuLevel != 1>
								<input type="text" name="menuUrl" id="menuUrl" style="width:160px;"/>
							</#if>
							</td>
						</tr>
						<tr>
							<td class="td-label">打开方式</td>
							<td class="td-value">
								<@yirong.dict id="openType" dictCode="DICT_MENU_OPEN_TYPE" width="167px";/>
							</td>
							<td class="td-label">排列顺序</td>
							<td class="td-value" >
								<input type="text" style="width:160px;" id="orderNo" name="orderNo" value="99" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength=5/>
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