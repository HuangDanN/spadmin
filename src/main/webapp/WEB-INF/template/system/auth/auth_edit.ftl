<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "../../common/include.ftl">
<script language="javascript">
function update(){
	var datas = $("#dataForm").serialize();
	showAjaxHtml({"wait": true});
	$.ajax({
		url:'${ctxPath}/admin/auth/update',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '更新权限出错!'});
	    },
	    success: function(obj){
			showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
	    	if(obj.rs){
				$.info(obj.msg, function(){
					$.getWinOpener().grid.reload();
					$.getWindow().close();
				});
	    	}
	    }
	 });
}

function closeDialog(){
	$.closeWin();
}


function addTr(){
	var seq_num = document.getElementById("fix_layout_table").rows.length;
	var str =  "<tr index="+seq_num+">"+
					"<td class=\"td-seq\">"+seq_num+"</td>"+
					"<td><input type=\"text\" name=\"urls\" style=\"width:90%;\"  maxlength=\"255\" title=\"最多255字\" onblur=\"this.value=$.resolvChar($.trim(this.value))?'':this.value\" /></td>"+
					"<td><input type=\"text\" name=\"urlNotes\" style=\"width:90%;\"  maxlength=\"500\" title=\"最多500字\" onblur=\"this.value=$.resolvChar($.trim(this.value))?'':this.value\"/></td>"+
					"<td style=\"text-align: center;\"><a href=\"#\" onclick=\"delTr('"+seq_num+"')\">删除</a></td>"+
				"</tr>";
	$("#fix_layout_table").append(str);
}

function delTr(index){
	$("#fix_layout_table tr[index='"+index+"']").remove();
	$("#dt_fix_table>tr").each(function(i){
		$(this).attr("index",i+1);
		$(this).find("td").first().text(i+1);
		$(this).find("td").last().html("<a href=\"#\" onclick=\"delTr('"+(i+1)+"')\">删除</a>");
	});
}
</script>
</head>
<body>
<div class="body-box-form" style="height:100%">
	<div class="content-form" >
		<div class="panelBar" id="panelBarDiv">
			<ul>
				<li class=""><a class="save" onclick="update()" id="saveBut"><span>保存</span></a></li>
				<li class=""><a class="close" false;="" onclick="$.closeWin();return" id="closeBut"><span>关闭</span></a></li>
				<li class=""><a class="addBind" onclick="addTr()" id="addBind"><span>增加URL</span></a></li>
			</ul>
		
		</div>
		<div class="infoBox" id="infoBoxDiv"></div>
		<div class="edit-form">
			<form action="" method="post" id="dataForm" enctype="multipart/form-data">
				<input type="hidden" name="authId" value="${auth.authId!''}" />
				<input type="hidden" name="menuId" value="${auth.menuId!''}" />
				<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label"><span class="required">*</span>权限名称</td>
							<td class="td-value"><input type="text" style="width:160px;" value="${auth.authName!''}" name="authName" maxlength="100" title="最多100个字" onkeyup="this.value=this.value.replace(/[, ]/g,'')"  onmousedown="clearinfoBoxDiv()"/></td>
							<td class="td-label"><span class="required">*</span>权限编码</td>
							<td class="td-value"><input type="text" style="width:160px;" value="${auth.authCode!''}" name="authCode" maxlength="30" title="最多30个字" onkeyup="this.value=this.value.replace(/[, ]/g,'')"  onmousedown="clearinfoBoxDiv()"/></td>
						</tr>
						<tr>
							<td class="td-label"><span class="required">*</span>菜单名称</td>
							<td class="td-value">
							<#if auth.menu??>
								${auth.menu.menuName!''}
							</#if>
							</td>
							<td class="td-label"><span class="required">*</span>权限类型</td>
							<td class="td-value">
								<select name="authType" style="width:167px;">
									<option value="1" <#if auth.authType==1>selected="selected"</#if> >菜单</option>
									<option value="2" <#if auth.authType==2>selected="selected"</#if> >自定义URL</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="td-label" >备注</td>
							<td class="td-value" colspan="3">
								<textarea  rows="8"  name="note" title="最多200个字" maxlength="200">${auth.note!''}</textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="table-layout-fixed" id="fix_layout_table">
					<thead>
						<tr isHead="1">
							<th style="width: 30px;">序号</th>
							<th style="width: 300px;">链接地址</th>
							<th>链接说明</th>
							<th style="width: 80px;">操作</th>
						</tr>
					</thead>
					<tbody id="dt_fix_table">
						<#if auth.resources??>
						<#list auth.resources as resource>
							<tr index="${resource_index+1}">
								<td class="td-seq">${resource_index+1}</td>
								<td><input type="text" name="urls" value="${resource.url!''}" style="width:90%;"  maxlength="255" title="最多255字" onblur="this.value=$.resolvChar($.trim(this.value))?'':this.value" /></td>
								<td><input type="text" name="urlNotes" value="${resource.note!''}" style="width:90%;"  maxlength="500" title="最多500字" onblur="this.value=$.resolvChar($.trim(this.value))?'':this.value" /></td>
								<td style="text-align: center;"><a href="#" onclick="delTr('${resource_index+1}')">删除</a></td>
							</tr>
						</#list>
						</#if>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>