<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>字典元素列表</title>
	<#include "../../common/include.ftl">
<script language="javascript">

var isDetail = false;
$(function(){
	new Grid({});
});

function add(){
	$.openWin({url: "${ctxPath}/admin/dictItem/gosave?dictId=${dictItem.dictId}&dictType=${dictType}", title:'新增字典元素'});
}

function update(id){
	$.openWin({url: "${ctxPath}/admin/dictItem/goedit?dictId=${dictItem.dictId }&dictType=${dictType}&itemId="+id, title:'编辑字典元素'});
}

function del(w){
	var ids = grid.getSelectIds();
	if(ids.length <1){
		 $.alert('请选择需要删除的记录');
		return ;
	}
	
	$.confirm({
		 info:'您确定要删除记录吗？',
		 ok: function () {
	        $.ajax({
				url : "${ctxPath}/dictItem/do"+w+"Delete",
				data : "itemIds="+ids.join(','),
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType: 'json',
				type: 'post',
				cache: false,
				error: function(){
			        $.alert('删除记录出现异常');
			    },
			    success: function(obj){
			    	if(obj.rs){
						$.info(obj.msg);
						grid.reload();
			    	}else{
						$.alert(obj.msg);
			    	}
				}
			});
		}
	});
}

function setEnable(id,name,type){
	var url = "${ctxPath}/admin/dictItem/changestatus";
	var opt = "启用";
	if(type == 0){
		opt = "禁用"
	}
	$.confirm({
		 info:'您确定要[ '+opt+' ] 字典元素 [ '+name+' ]吗？',
		 ok: function () {
	        $.ajax({
				url : url,
				data : "itemId="+id+"&enable="+type,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType: 'json',
				type: 'post',
				cache: false,
				error: function(){
			        $.alert(opt+' 字典元素 '+name+' 出现异常');
			    },
			    success: function(obj){
			    	if(obj.rs){
						$.info(obj.msg);
						grid.reload();
			    	}else{
						$.alert(obj.msg);
			    	}
				}
			});
		}
	});
}
</script>
</head>
    
<body>
	<div class="body-box-list" id="bodyBoxDiv" >
		<div class="query-form">
			<form method="post" id="page_form" action="${ctxPath}/admin/dictItem/golist">
				<input type="hidden" id="pageNo" name="pageNo" value="${pageInfo.currentPage}" />
				<input type="hidden" id="pageSize" name="pageSize" value="${pageInfo.pageSize}" />
				<input type="hidden" id="totalPages" name="totalPages" value="${pageInfo.totalPage}" />
				<input type="hidden" id="dictType" name="dictType" value="${dictType!''}" />
				<input type="hidden" id="dictId" name="dictId" value="${dictItem.dictId!''}" />
				<table cellpadding="0" cellspacing="0" width="100%">
						<col  width="10%" />
						<col  width="40%"/>
						<col  width="10%"/>
						<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label">元素文本</td>
							<td class="td-value"><input type="text" id="itemLabel" name="itemName" style="width:160px;" onkeyup="this.value=this.value.replace(/[, ]/g,'')" value="${dictItem.itemName!''}" /></td>
							<td class="td-label">元素编码</td>
							<td class="td-value"><input type="text" id="itemCode" name="itemCode" style="width:160px;" onkeyup="this.value=this.value.replace(/[, ]/g,'')"  value="${dictItem.itemCode!''}" /></td>
						</tr>
						<tr>
							<td colspan="6" class="td-btn">
								<div class="sch_qk_con"> 
									<input onclick="grid.goPage(1);"  class="i-btn-s" type="button"  value="查询"/>
									<input onclick="grid.clearForm();"  class="i-btn-s" type="button"  value="清空"/>
								</div>
						  	</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div><!--query-form-->
		<div class="pageContent">
			<div class="panelBar" id="panelBarDiv">
            	<ul>
                	<li>
                    	<a href="#" class="a1" onclick="add()">
					       <span>添加字典元素</span>
						</a>	
                    </li>
                    <li class="line"></li>
                </ul>
				<div class="clear_float"> </div>
			</div>
			<div class="content-list">
				<table cellpadding="0" cellspacing="0" id="gridTable">
					<col width="4%"/>
					<col width="10%"/>
					<col />
					<col width="30%"/>
					<col />
					<col />
					<col width="10%"/>
					<thead>
						<tr>
							<th>
								序号
							</th>
							<th>
								操作
							</th>
							<th>
								元素文本
							</th>
							<th>
								元素编码
							</th>
							<th>
								元素值
							</th>
							<th>
								备注
							</th>
							<th>
								状态
							</th>
						</tr>
					</thead>
					<tbody>
					<#if dictItemList??>
						<#list dictItemList as dictItem>
						<tr >
							<td class="td-seq">
								${dictItem_index+1}
							</td>
							<td class="td-center">
								<a href="#" onclick="update(${dictItem.itemId!''})">
									编辑 
								</a>
								<#if dictItem.isEnable==0>
								<a href="#" onclick="javascript:setEnable(${dictItem.itemId!''},'${dictItem.itemName!''}',1);">
									启用 
								</a>
								</#if>
								<#if dictItem.isEnable==1>
								<a href="#" onclick="javascript:setEnable(${dictItem.itemId!''},'${dictItem.itemName!''}',0);">
									禁用
								</a>
								</#if>
							</td>
							<td class="td-center" title="${dictItem.itemName!''}">
								${dictItem.itemName!''}
							</td>
							<td class="td-center" title="${dictItem.itemCode!''}">
								${dictItem.itemCode!''}
							</td>
							<td class="td-center" title="${dictItem.itemValue!''}">
								${dictItem.itemValue!''}
							</td>
							<td class="td-center" title="${dictItem.note!''}">
								${dictItem.note!''}
							</td>
							<td align="center" style="text-align: center;">
								<#if dictItem.isEnable==0>
								<font color="red">禁用</font>
								<#elseif dictItem.isEnable==1>
								启用
								<#else>
								异常
								</#if>
							</td>
						</tr>
						</#list>
						</#if>
					</tbody>
				</table>
			</div>
			<#include "../../common/pagination.ftl">
		</div> 
	</div>
</body>
</html>