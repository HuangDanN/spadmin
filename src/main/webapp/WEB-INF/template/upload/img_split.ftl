<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>缩放截图</title>
		<#include "../common/include.ftl">
		<link rel="stylesheet" type="text/css" href="${adminPath}/css/imgareaselect-default.css" />
		<script type="text/javascript" src="${adminPath}/jquery/jquery.imgareaselect.js"></script>
	</head>
<script language="Javascript">
var vPath = "${ctxPath}";

$(document).ready(function () {
	parent.imgSel = $('#imgSrcObj').imgAreaSelect({
	fadeSpeed: 200,
	instance: true,
	handles: true, 
	onSelectChange: preview
	});
});

function preview(img, selection){
	window.parent.preview(img, selection);
}

function getPicInfo(){
	return {"width": parseInt($("#imgSrcObj").css("width")),"height":parseInt($("#imgSrcObj").css("height"))};
}
</script>

	<body style="padding:0;margin:0;">
		<div style="float:left" id="imgDiv">
			<#if upLoadFile.saveWay=='FTP'>
				<img id="imgSrcObj" src="${upLoadFile.fullUrl}" width="${upLoadFile.width }px" height="${upLoadFile.height }px" border="0" />
			</#if>
			<#if upLoadFile.saveWay=='DISK'>
				<img id="imgSrcObj" src="${ctxPath}/${upLoadFile.filePath}${upLoadFile.fileName}" width="${upLoadFile.width }px" height="${upLoadFile.height }px" border="0" />
			</#if>
		</div>
	</body>
</html>
