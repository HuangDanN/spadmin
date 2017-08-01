<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title> 
<#include "../../common/include.ftl">
	<link href="${adminPath}/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="${adminPath}/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${adminPath}/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>    
	<script type="text/javascript">
             <#if tree??>
             	<#if tree?size!=0>
             		var data = [];
        	     	<#list tree as per>
            		 	data.push({ id: ${per.menuId}, pid: ${per.parentId}, text: '${per.menuName}' });
    	         	</#list>
			        $(function ()
			        {
			            var tree = $("#tree1").ligerTree({  
			             nodeWidth: 200,
			            data:data, 
			             idFieldName :'id',
			             slide : false,
			             checkbox :false,
			             parentIDFieldName :'pid',
			             onSelect   : function(node){
			             	parent.listFrame.location.href="${ctxPath}/admin/menu/go/"+node.data.id;
			             	} 
			             });
			        });
	             </#if>
             </#if>
        
        function open(){
        alert();
        }
    </script>
 </head>

<body>
    <div style="width:180px;margin:5px; float:left;overflow:auto;clear:both;  ">
    <ul id="tree1"></ul>
    </div> 
</body>
</html>