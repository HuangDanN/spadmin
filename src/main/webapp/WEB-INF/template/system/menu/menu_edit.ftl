<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "../../common/include.ftl">
<script language="javascript">

$(function() {

	<#if menu.menuType==2>
	$("#menuUrl").css("visibility", "hidden");
	</#if>
		
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

function update(){
    if(!$("#dataForm").valid()) {return false;}
	var datas = $("#dataForm").serialize();
	showAjaxHtml({"wait": true});
	$.ajax({
		url:'${ctxPath}/admin/menu/update',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '更新菜单出错!'});
	    },
	    success: function(obj){
			showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
	    	if(obj.rs){
				$.info(obj.msg, function(){
					$.getWinOpener().parent.treeFrame.location.reload();
					$.getWinOpener().parent.listFrame.location.reload();
					$.getWindow().close();
				});
	    	}
	    }
	 });
}

//关闭当前LigerUi的Dialog窗口
function closeDialog(){
	$.closeWin();
}
</script>
</head>
<body>
<div class="body-box-form" >
	<div class="content-form">
		<div class="panelBar" id="panelBarDiv">
		<ul>
			<li class="">
				<a class="save" onclick="javascript:update();" id="saveBut"><span>更新</span></a>
			</li>
			<li class="">
				<a class="close" onclick="javascript:closeDialog();" id="closeBut"><span>关闭</span></a>
			</li>
		</ul>
		</div>
		<div class="infoBox" id="infoBoxDiv"></div>
		<div class="edit-form">
			<form action="" method="post" id="dataForm" enctype="multipart/form-data">
			<input type="hidden" name="menuId" value="${menu.menuId}"/>
			<input type="hidden" name="parentId" value="${menu.parentId}"/>
			<input type="hidden" name="menuLevel" value="${menu.menuLevel}"/>
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label"><span class="required">*</span>菜单名称</td>
							<td class="td-value"><input type="text" style="width:160px;"  name="menuName" title="最多10个字" maxlength="10" value="${menu.menuName}" onkeyup="this.value=this.value.replace(/[, ]/g,'')" onmousedown="clearinfoBoxDiv()"/></td>
							<td class="td-label">父类菜单</td>
							<td class="td-value">
								<input type="text" name="parentName" value="${menu.parentName!'无'}"  readonly="readonly" style="width:160px;"/>
							</td>
							
						</tr>
						<tr>
							<td class="td-label">菜单类型</td>
							<td class="td-value">
								<select name="menuType" id="menuType" style="width:167px;">
									<#if menu.menuLevel == 1>
										<option value="1" <#if menu.menuType==1>selected="selected"</#if> >Tab菜单</option>
									<#else>
										<option value="2" <#if menu.menuType==2>selected="selected"</#if>>文件夹菜单</option>
										<option value="3" <#if menu.menuType==3>selected="selected"</#if>>URL菜单</option>
									</#if>
								</select>
							</td>
							<td class="td-label">
								<span class="required" id="urlSign" style="visibility:hidden;">*</span>操作链接
							</td>
							<td class="td-value">
								<input type="text" name="menuUrl" id="menuUrl" style="width:160px;" value="${menu.menuUrl!''}"/>
							</td>
						</tr>
						<tr>
							<td class="td-label">打开方式</td>
							<td class="td-value">
								<@yirong.dict id="openType" dictCode="DICT_MENU_OPEN_TYPE" value="${menu.openType!''}" width="167px";/>
							</td>
							<td class="td-label">排列顺序</td>
							<td class="td-value" >
								<input type="text" style="width:160px;" name="orderNo" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength=5 value="${menu.orderNo}"/>
							</td>
						</tr>
						<tr>
							<td class="td-label" >备注</td>
							<td class="td-value" colspan="3" >
								<textarea  rows="10" name="note" style="border: 0;" title="最多500个字">${menu.note!''}</textarea>
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