<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "../../common/include.ftl">
<script type="text/javascript">
<@yirong.authorize authCode="MENU_ADD">
function goadd(){
	$.openWin({url: '${ctxPath}/admin/menu/add?parentId=${menu.parentId}',title:'添加同级菜单'});
}
function goaddsub(){
	$.openWin({url: '${ctxPath}/admin/menu/add?parentId=${menu.menuId}',title:'添加子级菜单'});
}
</@yirong.authorize>
<@yirong.authorize authCode="MENU_EDIT">
function edit(){
	$.openWin({url: '${ctxPath}/admin/menu/edit?menuId=${menu.menuId}',title:'编辑'});
}
</@yirong.authorize>

<@yirong.authorize authCode="MENU_DELETE">
function deleteMenu(){
	$.confirm({
		 info:'您确定要删除记录吗？',
		 ok: function () {
				showAjaxHtml({"wait": true});
				$.ajax({
					url:'${ctxPath}/admin/menu/delete',
					type: 'post',
					data: 'menuId=${menu.menuId}',
					dataType: 'json',
					cache: false,
					error: function(obj){
						showAjaxHtml({"wait": false,"type":"error", "msg": '删除菜单出错!'});
				    },
				    success: function(obj){
						showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
				    	if(obj.rs){
								$.info(obj.msg);
								window.parent.location.reload();	
						}
				    }
				 });
	 			}
	});
}
</@yirong.authorize>
</script>
<style type="text/css">
#menu1,.l-menu-shadow {
	top: 30px;
	left: 50px;
}

#menu1 {
	width: 200px;
}
</style>

</head>
<body>
	<div class="body-box-form">
		<div class="content-form">
			<div class="panelBar" id="panelBarDiv">
				<ul>
				<@yirong.authorize authCode="MENU_ADD">
					<li class=""><a class="save" onclick="goadd()" id="saveSameBut"><span>添加同级菜单</span></a></li>
				<#if menu.menuType !=3>	
					<li class=""><a class="save" onclick="goaddsub()"	id="saveSubBut"><span>添加子级菜单</span></a></li>
				</#if>
				</@yirong.authorize>
				<@yirong.authorize authCode="MENU_EDIT">
					<li><a class="a1" onclick="edit()" id="editBut"><span>编辑</span></a></li>
				</@yirong.authorize>	
				<@yirong.authorize authCode="MENU_DELETE">
					<li><a class="a1" onclick="deleteMenu()" id="delBut"><span>删除</span></a></li>
				</@yirong.authorize>
				</ul>
			</div>
			<div class="infoBox" id="infoBoxDiv"></div>
			<div class="edit-form">
				<form action="" method="post" id="dataForm"
					enctype="multipart/form-data">
					<input type="hidden" name="menuId" id="menuId" value=" " />
					<table cellspacing="0" cellpadding="0" width="100%">
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
						<tbody>
							<tr>
								<td class="td-label">菜单名称</td>
								<td class="td-value"><span
									style="width: 100%; word-wrap: break-word;" id="menuName">${menu.menuName!''}
								</span></td>
								<td class="td-label">父菜单</td>
								<td class="td-value"><span
									style="width: 100%; word-wrap: break-word;" id="parentName">${menu.parentName!''}
								</span></td>
							</tr>
							<tr>
								<td class="td-label">菜单类型</td>
								<td class="td-value">
								<#if menu.menuType==1>
									Tab菜单
								<#elseif menu.menuType==2>
									文件夹菜单
								<#elseif menu.menuType==3>
									URL菜单
								</#if>
								</td>
								<td class="td-label">操作链接</td>
								<td class="td-value"><span
									style="width: 100%; word-wrap: break-word;" id="menuUrl">${menu.menuUrl!'无'}</span></td>
							</tr>
							<tr>
								<td class="td-label">打开方式</td>
								<td class="td-value"><@yirong.dict id="openType" dictCode="DICT_MENU_OPEN_TYPE" value="${menu.openType!''}" readonly="true" /></td>
								<td class="td-label">排列顺序</td>
								<td class="td-value"><span id="orderNo">${menu.orderNo!''}</span></td>
							</tr>
							<tr>
								<td class="td-label">备注</td>
								<td class="td-value" colspan="3">
									<div id="remark" class="textAreaDiv"
										style="padding: 5px 0px 0px 2px;height: 150px;">${menu.note!''}</div>
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
