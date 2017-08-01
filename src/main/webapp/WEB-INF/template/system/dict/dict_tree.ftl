
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>字典树</title>
	<#include "../../common/include.ftl">
    <script type="text/javascript">
	var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false,
			expandSpeed: ($.browser.msie && parseInt($.browser.version)<=6)?"":"fast",
			fontCss: getFont,
			nameIsHTML: true
		},
		data: {
			simpleData: {
				enable:true
			}
		},
		
		async:{
			url : '${ctxPath}/admin/dictItem/doLoadTree?dictId=${defaultId}',
			enable : true,
			autoParam: ["id"]//异步加载时需要提交的参数，多个用逗号分隔  
		},

		callback: {
			beforeClick: function(treeId, treeNode) {
				if (treeNode.isParent) {
					parent.zTree.expandNode(treeNode, true);
				}
				parent.clickTree(treeNode, '${dictType}');
				return true;
			}
		}
	};
	
	var zNodes = [];
	
	$(document).ready(function(){
		var dictJson = ${dictJson};
		<#if dictType=='1'>
		var node = {id: '0',name: '系统字典管理',pId: '-1',nodeType: 'root'};
		<#elseif dictType=='2'>
		var node = {id: '0',name: '业务字典管理',pId: '-1',nodeType: 'root'};
		</#if>
		zNodes.push(node);
		
		for(var i=0; i<dictJson.length; i++){
			node = {id: dictJson[i]['dictId'],name: dictJson[i]['dictName'],pId: '0',isParent: true,nodeType: 'dict'};
			if('1' == dictJson[i]['status']){
				node.name = "<span style='color:red;font-style:italic;'>"+node.name+"[禁用]</span>";
			}
			zNodes.push(node);
		}
	
		$.fn.zTree.init($("#tree"), setting, zNodes);
		parent.zTree = $.fn.zTree.getZTreeObj("tree");
		
		var defaultId = "${defaultId}";
		if(defaultId == "")
			defaultId = "0";
		
		var rootNode = parent.zTree.getNodeByParam("id", defaultId, null);
		if(rootNode != null){
			parent.zTree.selectNode(rootNode);
			parent.zTree.expandNode(rootNode);
		}
	});
	
	function getFont(treeId, node) {
		return node.font ? node.font : {};
	}
   	</script>
</head>
<bodystyle="background: #ffffff;">
	<ul id="tree" class="ztree" style="position: absolute;left:0px;top: 5px;"></ul>
</body>
</html>