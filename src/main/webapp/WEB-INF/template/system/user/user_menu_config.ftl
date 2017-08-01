<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>设置快捷菜单</title>
<#include "../../common/include.ftl">
<script type="text/javascript">
    var initSelIds = [];
	var zTree;

	var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable:true,
					idKey: "menuId",
					pIdKey: "parentId"
				},
				key:{
					name: "menuName"
				}
			}
		};
	
	var zNodes =${menuNodes};
	var userMenuNodes = ${userMenuNodes};
	
	$(document).ready(function(){
		new ToolBar({items:[
			{id:"saveBut", className:"save", func:"save()", text:"保存"},
			{id:"closeBut", className:"close", func:"$.closeWin();return false;", text:"关闭"}
		]});
		if($.browser.msie && parseInt($.browser.version)<=6){
			document.execCommand("BackgroundImageCache",false,true);//IE6缓存背景图片
		}
		
		zNodes.push({"menuId": 0, "parentId": null, "menuName": "用户菜单", "isParent": true});
		for(var i=0; i <zNodes.length; i++){
			if(zNodes[i].menuType == '${DICT_MENU_TYPE_URL}'){
				zNodes[i].isParent = false;
				for(var j=0; j<userMenuNodes.length; j++){
					if((zNodes[i].menuId+"") == (userMenuNodes[j].MENU_ID+"")){
						zNodes[i].checked = true;
						break ;
					}
				}
			}else{
				zNodes[i].nocheck = true;
				zNodes[i].isParent = true;
			}
		}
		
		$.fn.zTree.init($("#tree"), setting, zNodes);
		zTree = $.fn.zTree.getZTreeObj("tree");
		
		zTree.expandAll(true);
	});
	
	function save(){
		var nodes = zTree.getCheckedNodes(true);
		
		var menuIds = [];
		for(var i=0; i<nodes.length; i++){
			menuIds.push(nodes[i].menuId);
		}
		
		$.ajax({
			url: "${ctxPath}/admin/doSaveUserMenu",
			data : "menuIds="+menuIds.join(','),
			type: "POST",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType: 'json',
			cache: false,
			error: function(){
				$.alert('设置快捷菜单出现异常');
		    },
		    success: function(obj){
		    	if(obj.rs){
					$.info('设置快捷菜单成功！', function(){
						$.getWinOpener().location.reload();
					    $.closeWin();
					});
		    	}else{
		    		$.alert(obj.msg);
		    	}
		    }
		});
	}
</script>
</head>
<body style="margin: 0;padding: 0;">
<div class="body-box-form" >
	<div class="content-form">
		<div class="panelBar" id="panelBarDiv"></div>
		<div>
			<ul id="tree" style="color:#00483e;" class="ztree"></ul>
		</div>
	</div>
</div>
</body></html>