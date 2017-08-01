<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>登陆日志列表 </title>
<#include "../../common/include.ftl">
<script type="text/javascript">
	$(function(){
		new Grid({});
	})
	
	function search(){
		if($('#send').val()<$('#start').val()){
			$.alert("结束时间应大于开始时间");
			return false;
		}
		grid.goPage(1);
	}
</script>
</head>
<body>
	<div class="body-box-list" id="bodyBoxDiv">
		 <div class="query-form">
			<form action="${ctxPath}/admin/loginlog/loginlog_list" method="post" id="page_form" >
				<input type="hidden" id="pageNo" name="pageNo" value="${pageInfo.currentPage}" />
				<input type="hidden" id="pageSize" name="pageSize" value="${pageInfo.pageSize}" />
				<input type="hidden" id="totalPages" name="totalPages" value="${pageInfo.totalPage}" />
				<table cellpadding="0" cellspacing="0" width="100%">
					<col  width="10%"/>
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label">用户名</td>
							<td class="td-value">
								<input type="text" name="suid" id="suid" value="${loginlog.suid!''}" style="width:160px">
							</td>
							<td class="td-label">登陆IP</td>
							<td class="td-value">
								<input type="text" style="width:160px" id="sloginip" ip="true" name="sloginip" value="${loginlog.sloginip!''}"/>
							</td>
						</tr>
						<tr>
							<td class="td-label">登陆开始时间</td>
							<td class="td-value">
								<input type="text" style="width:160px" id="start" name="start" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${loginlog.start!''}" class="Wdate" />
							</td>
							<td class="td-label">登陆结束时间</td>
							<td class="td-value">
								<input type="text" style="width:160px" id="send" name="send" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${loginlog.send!''}" class="Wdate" />
							</td>
						</tr>
						<tr>
							<td colspan="4" class="td-btn">
								<div class="sch_qk_con"> 
									<input onclick="search()"  class="i-btn-s" type="button"  value="查找"/>
									<input onclick="grid.clearForm();"  class="i-btn-s" type="button"  value="清空"/>
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
					<col width="10%"/>
					<thead>
						<tr>
							<th>
								序号
							</th>
							<th>
								用户名
							</th>
							<th>
								登陆IP
							</th>
							<th>
								登陆时间
							</th>
							<th>
								退出时间
							</th>
						</tr>
					</thead>
					<tbody>
						<#if loginlogList??>
							<#list loginlogList as loginlog>
							<tr>
								<td class="td-seq">
									${loginlog_index+1}
								</td>
								<td class="td-center">
									${loginlog.suid}
								</td>
								<td class="td-center">
									${loginlog.sloginip}
								</td>
								<td class="td-center">
									${loginlog.dstart?string("yyyy-MM-dd HH:mm:ss")}
								</td>
								<td class="td-center">
									${loginlog.dend?string("yyyy-MM-dd HH:mm:ss")}
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