<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title> 
   <#include "../../common/include.ftl">
	<link href="${adminPath}/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
    	.ie6fixedTL{position: fixed; top: 0px; left: 0px;_position:absolute;_left:expression(eval(document.documentElement.scrollLeft));_top:expression(eval(document.documentElement.scrollTop))}
    	 html {
          _background-image: url(about:blank);
          _background-attachment: fixed;         /* prevent screen flash in IE6 */
    	}
    </style>
    <script src="${adminPath}/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${adminPath}/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
    <script type="text/javascript">
             		var manager = null;
             		var data = [];
            		data.push({ id: 0, pid: -1, text: '权限树'});
             <#if authTree??>
             	<#if authTree?size!=0>
        	     	<#list authTree as per>
            		 	data.push({ <#if per.id??>id: ${per.id}, </#if>pid: ${per.parentId}, text: '${per.name}'<#if per.authId??>,value: ${per.authId!}</#if><#if per.isChecked>,ischecked:true</#if>});
    	         	</#list>
			        $(function ()
			        {
			            var tree = $("#authtree").ligerTree({  
			            data:data, 
			            idFieldName :'id',
			            slide : false,
			            parentIDFieldName :'pid',
			            nodeWidth:150
			            });
			            manager = $("#authtree").ligerGetTreeManager();
			        });
	             </#if>
             </#if>
        
        function save()
        {
            var notes = manager.getChecked();
            var text = "";
            for (var i = 0; i < notes.length; i++)
            {
                if(notes[i].data.value!=null){
	                text += "authId="+notes[i].data.value + "&";
	            }
            }
            text+="roleId="+${roleId};
            showAjaxHtml({"wait": true});
			$.ajax({
				url:'${ctxPath}/admin/role/saveauths',
				type: 'post',
				data: text,
				dataType: 'json',
				cache: false,
				error: function(obj){
					showAjaxHtml({"wait": false,"type":"error", "msg": '保存角色权限出错!'});
			    },
			    success: function(obj){
			    	showAjaxHtml({"wait": false});
			    	if(obj.rs){
			    		$.info(obj.msg, function(){
							$.getWinOpener().grid.reload();
							$.getWindow().close();
						});
			    	}
			    	else{
			    		$.ligerDialog.error(obj.msg);
			    		toolBar.enableBut("saveBut");
			    	}
			    }
			 });
        }
    </script>
 </head>
<body>
	<div class="body-box-form" >
	<div class="content-form">
		<div id="panelBarDiv" class="panelBar ie6fixedTL"  style=" z-index: 9999; width: 100%;">
			<ul>
				<li class=""><a class="save" onclick="save()"><span>保存</span></a></li>
				<li class=""><a class="close" onclick="$.closeWin()" ><span>关闭</span></a></li>
			</ul>
		<div class="clear_float"></div></div>
		<div style="margin-top:30px;width:300px;">
			<ul id="authtree"></ul>
		</div>
	</div>
</body>
</html>