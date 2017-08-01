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
var tree;
var data = [];
data.push({ id: 0, pid: -1, text: '组织机构树'});
	var len = 0;
 	<#if groupList?size!=0>
     	<#list groupList as per>
		 	data.push({ id: ${per.groupId}, pid: ${per.parentId!'0'}, text: '${per.groupName}' });
		 	var group = '${per.groupName}'.length;
		 	if(group>len){
	 			len = group;
	 		}
     	</#list> </#if>
        $(function ()
        {
            tree = $("#tree1").ligerTree({
            nodeWidth:len*13,  
            data:data, 
             idFieldName :'id',
             slide : false,
             checkbox :false,
             parentIDFieldName :'pid',
             onBeforeSelect   : function(node){
             	var type = typeof(node.data.children);
             	var childrenNum = 0;
             	if(type != 'undefined') {
             		childrenNum = node.data.children.length;
             	} 
             	parent.listFrame.location.href="${ctxPath}/admin/group/go?groupId="+node.data.id+"&childrenNum="+childrenNum;
             }});
             var selectGroupId = ${selectGroupId};
             tree.selectNode(selectGroupId);
	        });


</script>
</head>
<body>
	<div style="margin:5px; float:left;overflow:auto;clear:both;  ">
    <ul id="tree1"></ul>
    </div> 
</body>
</html>