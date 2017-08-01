<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>刷新缓存</title>
<#include "../../common/include.ftl">
<script language="javascript">

$(function(){
	new Grid({});
	new ToolBar({items:[
     		{id:"refreshBut", className:"refresh", func:"refresh();", text:"刷新缓存"}
     	]});
});


function refresh(){
	var ids = grid.getSelectIds();
	if(ids.length < 1){
		 $.alert('请选择需要刷新缓存的记录');
		return ;
	}
	toolBar.disableBut("refreshBut");
	$.confirm({
		 info:'您确定要刷新缓存吗？',
		 ok: function () {
	        $.ajax({
				url : "${ctxPath}/admin/cache/doRefresh",
				data : "itemKeys="+ids.join(','),
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType: 'json',
				cache: false,
				error: function(){
			        $.alert('刷新缓存出现异常');
			        toolBar.enableBut("refreshBut");
			    },
			    success: function(obj){
			    	$.alert(obj.msg);
			    	toolBar.enableBut("refreshBut");
				}
			});
		},
		cancel : function(){
			toolBar.enableBut("refreshBut");
		}
	});
}

</script>
</head>
<body>
	<div class="body-box-list"  id="bodyBoxDiv">
		<div class="pageContent">
			<div class="panelBar" id="panelBarDiv"></div>
			<div class="content-list">
				<table cellpadding="0" cellspacing="0" id="gridTable">
					<col width="50px"/>
					<col width="40px"/>
					<col width=""/>
					<thead>
						<tr>
							<th>
								序号
							</th>
							<th>
								<input type="checkbox" id="ck_all" onclick="grid.checkAll()" /> 
							</th>
							<th>
								描述
							</th>
						</tr>
					</thead>
					<tbody>
						<tr >
							<td class="td-seq">
								1
							</td>

							<td class="td-center">
								<input type="checkbox" value="DICT_CACHE" />
							</td>
							<td class="td-left">
								字典缓存
							</td>
						</tr>
						<tr >
							<td class="td-seq">
								2
							</td>

							<td class="td-center">
								<input type="checkbox" value="AUTHORITY_CACHE" />
							</td>
							<td class="td-left">
								权限缓存
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div> 
	</div>
</body>
</html>