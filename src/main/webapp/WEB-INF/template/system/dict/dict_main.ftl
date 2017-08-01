<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>字典管理</title>
    <script src="${commonPath}/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
	var zTree;
	
	function clickTree(treeNode, dictType){
		if(treeNode.nodeType == "root"){
			$("#listFrame").attr("src", "${ctxPath}/admin/dict/golist?dictType="+dictType);
		}
		if(treeNode.nodeType == "dict"){
			$("#listFrame").attr("src", "${ctxPath}/admin/dictItem/golist?dictId="+treeNode.id+"&dictType="+dictType);
		}
		if(treeNode.nodeType == "item"){
			var id = treeNode.id;
			itemId = id.substring(0,id.indexOf("_"));
			$("#listFrame").attr("src", "${ctxPath}/admin/dictItem/godetail?itemId="+itemId+"&dictType="+dictType);
		}
	}
    </script>
    <frameset cols="180,*" rows="*"  border="0" framespacing="1" frameborder="yes" bordercolor="#B2D9FF" style="border-style: hidden;"  >
  		<frame id="treeFrame" name="treeFrame" src='${ctxPath}/admin/dict/gotree?defaultId=0&dictType=${dictType}' frameborder="0" border="1" noresize="noresize">
  		<frame id="listFrame" name="listFrame" src="${ctxPath}/admin/dict/golist?dictType=${dictType}" frameborder="0" border="1" noresize="noresize">
	</frameset>
</head>

</html>


