<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理菜单</title>
<link href="${adminPath}/css/menu.css" rel="stylesheet" type="text/css" />
<#include "../../common/include.ftl">
</head>
<body class="menu">
	<div class="menuContent">
	    <dl>
			<dt>
				<span>管理员</span>
			</dt>
			<dd>
				<span><a href="${ctxPath}/admin/user/list" target="mainFrame">管理员列表</a></span>
			</dd>
			<dd>
				<span><a href="${ctxPath}/admin/role/list" target="mainFrame">角色列表</a></span>
			</dd>
			<#--
			 <dd>
				<span><a href="${ctxPath}/admin/role/resourceList" target="mainFrame">资源管理</a></span>
			 </dd>
			-->
		</dl>
		
	</div>
</body>
</html>