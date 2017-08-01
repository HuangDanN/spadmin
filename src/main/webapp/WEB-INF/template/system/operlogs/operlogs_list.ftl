<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title>
<#include "../../common/include.ftl">
<script type="text/javascript">
$(function(){
	new Grid({});
});
</script>
</head>
<body>
	<div >
		<div class="query-form">
		<form action="${ctxPath}/admin/operlogs/list" method="post" id="page_form" >
				<input type="hidden" id="pageNo" name="pageNo" value="${pageInfo.currentPage}" />
				<input type="hidden" id="pageSize" name="pageSize" value="${pageInfo.pageSize}" />
				<input type="hidden" id="totalPages" name="totalPages" value="${pageInfo.totalPage}" />
				<table cellpadding="0" cellspacing="0" width="100%">
						<col  width="10%"/>
						<col  width="20%"/>
						<col  width="10%"/>
						<col  width="20%"/>
						<col  width="10%"/>
						<col  width="20%"/>
					<tbody>
						<tr>
							<td class="td-label">操作用户</td>
							<td class="td-value"><input type="text" name="userName" value="${operLog.userName!''}" onkeyup="this.value=this.value.replace(/[, ]/g,'')" style="width:160px;"/></td>
							<td class="td-label">IP地址</td>
							<td class="td-value"><input type="text" name="ip" value="${operLog.ip!''}" onkeyup="this.value=this.value.replace(/[, ]/g,'')" style="width:160px;" /></td>
							<td class="td-label">操作模块</td>
							<td class="td-value">
							<@yirong.dict id="modelCode" headerLabel="全部" headerValue="" value="${operLog.modelCode!''}"  dictCode="DICT_LOG_MODULE" />
							</td>
						</tr>
						<tr>
							<td class="td-label">操作开始时间</td>
							<td class="td-value"><input  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endTime\',{d:0});}',onclearing:function(){if(!confirm('日期框的值为:'+this.value+', 确实要清空吗?'))return true;}});" type="text" id="beginTime" name="beginTime" value="<#if operLog.beginTime??>${operLog.beginTime?datetime}</#if>" style="width:160px;"/></td>
							<td class="td-label">操作结束时间</td>
							<td class="td-value" colspan="3"><input  onfocus="var min = '';if($('#beginTime').val() == '') { } else { min = '#F{$dp.$D(\'beginTime\',{d:0});}'}WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:min,onclearing:function(){if(!confirm('日期框的值为:'+this.value+', 确实要清空吗?'))return true;}});" type="text" id="endTime" name="endTime" value="<#if operLog.endTime??>${operLog.endTime?datetime}</#if>" style="width:160px;" /></td>
						</tr>
						<tr>
							<td colspan="6" class="td-btn">
								<div class="sch_qk_con"> 
									<input onclick="grid.goPage(1);"  class="i-btn-s" type="button"  value="查找"/>
									<input onclick="grid.clearForm();$('#modelCode').val('');"  class="i-btn-s" type="button"  value="清空"/>
								</div>
						  	</td>
						</tr>
					</tbody>
				</table>
		</form>
		</div>
		<div class="pageContent">
			

			<div class="content-list">
				<table cellpadding="0" cellspacing="0" id="gridTable">
					<col width="5%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="50%"/>
					<col width="10%"/>
					<col width="15%"/>
					<col width="10%"/>
					<col width="10%"/>
					<thead>
						<tr>
							<th>
								序号
							</th>
							<th>
								操作模块
							</th>
							<th>
								操作用户
							</th>
							<th>
								操作内容
							</th>
							<th>
								IP地址
							</th>
							<th>
								 操作时间
							</th>
							<!--
							<th>
								调用类
							</th>
							<th>
								调用方法
							</th>
							-->
						</tr>
					</thead>
					<tbody>
					<#if operLogList??>
						<#list operLogList as operLog>
						<tr >
							<td class="td-seq">
								${operLog_index+1}
							</td>
							<td class="td-center">
								${operLog.modelText!''}
							</td>
							<td class="td-center">
								${operLog.userName!''}
							</td>
							<td class="td-center" title="${operLog.content!''}">
								${operLog.content!''}
							</td>
							<td class="td-center">
								${operLog.ip!''}
							</td>
							<td class="td-center">
								<#if operLog.opeaTime??>
									${operLog.opeaTime?datetime}
								</#if>
							</td>
							<!--
							<td class="td-center">
								${operLog.clazz!''}
							</td>
							<td class="td-center">
								${operLog.method!''}
							</td>
							-->
						</tr>
						</#list>
					</#if>
					</tbody>
				</table>
				<div style="height:20px;"></div>
			</div>
			<#include "../../common/pagination.ftl">
		</div> 
	</div>
</body>
</html>