<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "../../common/include.ftl">
<script type="text/javascript">
$(document).ready(function(){
	new ToolBar({items:[
	<@yirong.authorize authCode="GROUP_ADD">
	<#if group.groupId!=0>
		{id:"saveSameBut", className:"save", func:"goadd()", text:"添加同级机构"},</#if>
		{id:"saveSubBut", className:"save", func:"goaddsub()", text:"添加子级机构"}
		</@yirong.authorize>
		<@yirong.authorize authCode="GROUP_EDIT">
		<#if group.groupId!=0>,
		{id:"editBut", className:"a1", func:"edit()", text:"编辑"}</#if>
		</@yirong.authorize>
		<@yirong.authorize authCode="GROUP_DEL">
		<#if group.groupId!=0 && childrenNum==0>,
		{id:"delBut", className:"a1", func:"deleteGroup()", text:"删除"}
		</#if>
		</@yirong.authorize>
	]});
	
	
});
<@yirong.authorize authCode="GROUP_ADD">
function goadd(){
	$.openWin({url: '${ctxPath}/admin/group/add?parentId=${group.parentId}',title:'添加同级机构'});
}
function goaddsub(){
	$.openWin({url: '${ctxPath}/admin/group/add?parentId=${group.groupId}',title:'添加子级机构'});
}
</@yirong.authorize>
<@yirong.authorize authCode="GROUP_EDIT">
function edit(){
	$.openWin({url: '${ctxPath}/admin/group/edit?groupId=${group.groupId}',title:'编辑'});
}
</@yirong.authorize>
<@yirong.authorize authCode="GROUP_DEL">
function deleteGroup(){
	
	$.confirm({
		 info:'您确定要删除记录吗？',
		ok: function () {
		showAjaxHtml({"wait": true});
			$.ajax({
				url:'${ctxPath}/admin/group/delete',
				type: 'post',
				data: 'groupId=${group.groupId}&isDel=0',
				dataType: 'json',
				cache: false,
				error: function(obj){
					showAjaxHtml({"wait": false,"type":"error", "msg": '删除机构出错!'});
			    },
			    success: function(obj){
			    	showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
			    	if(obj.rs){
			    				if(obj.msg == '成功删除该机构') {
									window.parent.frames.listFrame.location = '${ctxPath}/admin/group/go?groupId=0';
									window.parent.frames.treeFrame.location = '${ctxPath}/admin/group/tree?selectGroupId=0';
								}
								$.info(obj.msg);
					}
					
			    }
			 });
	 	}
	 });
}
</@yirong.authorize>
</script>
    <style type="text/css">
    #menu1,.l-menu-shadow{top:30px; left:50px;}
    #menu1{  width:200px;}
</style>

</head>
<body>
<div class="body-box-form">
	<div class="content-form">
		<div class="panelBar" id="panelBarDiv"></div>
		<div class="infoBox" id="infoBoxDiv"></div>
		<div class="edit-form">
			<form action="" method="post" id="dataForm" enctype="multipart/form-data">
				<input type="hidden" name="menuId" id="menuId" value=" "/><#if group.groupId!=0>
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%"/>
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label">机构名称</td>
							<td class="td-value" 	<#if group.parentId==0>colspan="3"</#if>><span style="width:100%;word-wrap:break-word; " id="groupName">${group.groupName!''} </span></td>
							<#if group.parentId!=0>
							<td class="td-label">父机构</td>
							<td class="td-value">
								<span style="width:100%;word-wrap:break-word;"  id="parentGroupName">${group.parentGroupName!'无'} </span>
							</td>
							</#if>
						</tr>
						<tr>
							<td class="td-label">创建时间</td>
							<td class="td-value"><span id="createDate" >
							<#if group.createDate??>
									${group.createDate?datetime}
								</#if>
							</span></td>
							<td class="td-label">更新时间</td>
							<td class="td-value" ><span id="updateDate" >
							<#if group.updateDate??>
									${group.updateDate?datetime}
								</#if>
							</span></td>
						</tr>
						<tr>
							<td class="td-label" >备注</td>
							<td class="td-value" colspan="3" >
								<div id="groupDesc" class="textAreaDiv" style="padding:5px 0px 0px 2px;height: 150px;">${group.groupDesc!''}</div>
							</td>
						</tr>
					</tbody>
				</table></#if>
			</form>
		</div>
	</div>
</div>
</body>
</html>
