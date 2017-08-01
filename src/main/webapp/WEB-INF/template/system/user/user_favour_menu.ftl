<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户收藏菜单</title>
<style>
*{ margin:0; padding:0;}
body{ font-family:"宋体";}
img{ border:none;}
.kj_menu{ font-size:12px;}
.kj_menu table tr td{ border-bottom:1px solid #e3eef0;font-size:12px; color:#000; line-height:50px;  vertical-align:top; }
.kj_menu td img{ vertical-align:middle; margin:0 15px 0 30px;}
.kj_menu td a{ margin:0 10px; color:#0096af; text-decoration:underline; font-size:12px;}
</style>

<#include "../../common/include.ftl">
<script type="text/javascript">
var nodes;
function addTab(menuId, menuName,menuUrl) {
	window.top.f_addTab(menuId, menuName, menuUrl);
}

function config(){
	$.openWin({url:'${ctxPath}/admin/goUserMenuConf', width:450, height:520, title:"设置快捷菜单"});
}
$(document).ready(function(){
	new ToolBar({items:[{id:"saveBut", className:"navigate", func:"config()", text:"设置快捷菜单"}]});
});
</script>
</head>

<body>
<div class="body-box-form" style="overflow-x:hidden">
	<div class="panelBar" id="panelBarDiv" ></div>
	<div class="kj_menu">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		${menus }
	    </table>
	</div>
</div>
</body>

