<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>字典列表</title>
	<#include "../../common/include.ftl">
<script language="javascript">
$(function(){
	new Grid({});
});

function add(){
	$.openWin({url: "${ctxPath}/admin/dict/gosave?dictType=${dict.dictType!'2'}", title:'新增<#if dict.dictType=='1'>系统<#elseif dict.dictType=='2'>业务</#if>字典'});
}

function update(dictId){
	$.openWin({url: "${ctxPath}/admin/dict/goedit?dictId="+dictId,title:'编辑字典'});
}

function dictItem(dictId){
	$.openWin({url: "${ctxPath}/admin/dictItem/goList?dictId="+dictId,title:'字典元素'});
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
				url : "${ctxPath}/dict/do"+w+"Delete",
				data : "dictIds="+ids.join(','),
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

function changestatus(id,name,type){
	var url = "${ctxPath}/admin/dict/changestatus";
	var opt = "启用";
	if(type == 0){
		opt = "禁用";
	}
	$.confirm({
		 info:'您确定要[ '+opt+' ] 字典 [ '+name+' ]吗？',
		 ok: function () {
	        $.ajax({
				url : url,
				data : "dictId="+id+"&enable="+type,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType: 'json',
				type: 'post',
				cache: false,
				error: function(){
			        $.alert(opt+' 字典 '+name+' 出现异常');
			    },
			    success: function(obj){
			    	if(obj.rs){
						$.info(obj.msg, function(){
							window.parent.location.reload();
						});
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
			<form method="post" id="page_form" action="${ctxPath}/admin/dict/golist">
				<input type="hidden" id="pageNo" name="pageNo" value="${pageInfo.currentPage}" />
				<input type="hidden" id="pageSize" name="pageSize" value="${pageInfo.pageSize}" />
				<input type="hidden" id="totalPages" name="totalPages" value="${pageInfo.totalPage}" />
				
				<input type="hidden" id="dictType" name="dictType" value="${dict.dictType!''}" />
				<table cellpadding="0" cellspacing="0" width="100%">
						<col  width="10%" />
						<col  width="40%"/>
						<col  width="10%"/>
						<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label">字典名称</td>
							<td class="td-value"><input type="text" id="dictName" name="dictName" onkeyup="this.value=this.value.replace(/[, ]/g,'')" style="width:160px;" value="${dict.dictName!''}" /></td>
							<td class="td-label">字典编码</td>
							<td class="td-value"><input type="text" id="dictCode" name="dictCode" onkeyup="this.value=this.value.replace(/[, ]/g,'')" style="width:160px;"  value="${dict.dictCode!''}" /></td>
						</tr>
						<tr>
							<td colspan="6" class="td-btn">
								<div class="sch_qk_con"> 
									<input onclick="grid.goPage(1);"  class="i-btn-s" type="button"  value="查询"/>
									<input onclick="grid.clearForm();"  class="i-btn-s" type="button"  value="清空"/>
<!--									<a href="#" onclick="more_query('open');return false;" id="open-query-more" class="open">展开</a>-->
<!--									<a href="#" onclick="more_query('close');return false;" id="close-query-more" class="close" style="display:none;">关闭</a>-->
								</div>
						  	</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div><!--query-form-->
		<div class="pageContent">
			<!--panelBar-->
			<div class="panelBar" id="panelBarDiv">
            	<ul>
            	<#if dict.dictType=='1'>
                	<li>
                    	<a href="#" class="a1" onclick="add()">
					       <span>添加系统字典</span>
						</a>	
                    </li>
                 <#elseif dict.dictType=='2'>
                	<li>
                    	<a href="#" class="a1" onclick="add()">
					       <span>添加业务字典</span>
						</a>	
                    </li>
                  </#if>
                    <li class="line"></li>
                </ul>
				<div class="clear_float"> </div>
			</div><!--panelBar end-->

			<div class="content-list">
				<table cellpadding="0" cellspacing="0" id="gridTable">
					<col width="4%"/>
					<col width="16%"/>
					<col />
					<col width="30%"/>
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
								字典名称
							</th>
							<th>
								字典编码
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
					<#if dictList??>
						<#list dictList as dict>
						<tr >
							<td class="td-seq">
								${dict_index+1}
							</td>
							<td class="td-center">
								<a href="#" onclick="update('${dict.dictId }')">
									编辑 
								</a>
								<#if dict.isEnable==0>
								<a href="#" onclick="javascript:changestatus(${dict.dictId!''},'${dict.dictName!''}',1);">
									启用 
								</a>
								</#if>
								<#if dict.isEnable==1>
								<a href="#" onclick="javascript:changestatus(${dict.dictId!''},'${dict.dictName!''}',0);">
									禁用
								</a>
								</#if>
							</td>
							<td class="td-center" title="${dict.dictName!''}">
								${dict.dictName!''}
							</td>
							<td class="td-center" title="${dict.dictCode!''}">
								${dict.dictCode!''}
							</td>
							<td class="td-center">
								${dict.note!''}
							</td>
							<td align="center" style="text-align: center;">
							<#if dict.isEnable==0>
								<font color="red">禁用</font>
							<#elseif dict.isEnable==1>
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