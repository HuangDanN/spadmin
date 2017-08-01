<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>用户列表 </title>
<#include "../../common/include.ftl">
<script type="text/javascript">
$(function(){
	new Grid({});
});
<@yirong.authorize authCode="USER_ADD">
function add(){
	$.openWin({url: '${ctxPath}/admin/user/add',title:'添加用户'});
}
</@yirong.authorize>
<@yirong.authorize authCode="USER_EDIT">
function edit(id){
	$.openWin({url: '${ctxPath}/admin/user/edit?userId='+id,title:'编辑用户'});
}
</@yirong.authorize>

<@yirong.authorize authCode="USER_DELETE">
function del(){    
	var idArr = grid.getSelectIds();
	if(idArr.length < 1){
		$.alert('请选择需要删除的记录');
		return ;
	}
	var  myinfo = '您确定要删除记录吗？';
	$.confirm({
		 info: myinfo,
		 ok: function () {
				var datas = $("input[name='ids']:checked").serialize();
				var scids=grid.getSelectAttrs("value");
	            datas=datas+"&scids="+scids;
				showAjaxHtml({"wait": true});
				$.ajax({
					url:'${ctxPath}/admin/user/delete',
					type: 'post',
					data: datas,
					dataType: 'json',
					cache: false,
					error: function(obj){
						showAjaxHtml({"wait": false,"type":"error", "msg": '删除用户出错!'});
				    },
				    success: function(obj){
				    	showAjaxHtml({"wait": false});
				    	if(obj.rs){
							$.info(obj.msg);
							grid.reload();
				    	}
				    	else{
				    		$.alert(obj.msg);
				    	}
				    }
				 });
			}
	});
}
</@yirong.authorize>
<@yirong.authorize authCode="USER_ENABLED">
function change(id){
	showAjaxHtml({"wait": true});
	$.ajax({
		url:'${ctxPath}/admin/user/changestatus',
		type: 'post',
		data: 'userId='+id,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '用户操作出错!'});
	    },
	    success: function(obj){
	    	showAjaxHtml({"wait": false});
	    	if(obj.rs){
				$.info(obj.msg);
				grid.reload();
	    	}
	    	else{
	    		$.alert(obj.msg);
	    	}
	    }
	 });
}
</@yirong.authorize>
<@yirong.authorize authCode="USER_RESETPWD">
function resetpwd(id){
	showAjaxHtml({"wait": true});
	$.ajax({
		url:'${ctxPath}/admin/user/resetpwd',
		type: 'post',
		data: 'userId='+id,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '重置密码出错!'});
	    },
	    success: function(obj){
	    	showAjaxHtml({"wait": false});
	    	if(obj.rs){
				$.info(obj.msg);
				grid.reload();
	    	}
	    	else{
	    		$.alert(obj.msg);
	    	}
	    }
	 });
}
</@yirong.authorize>
<@yirong.authorize authCode="USER_QXYZ">
function scyz(){
    var idArr = grid.getSelectIds();
	if(idArr.length < 1){
		$.alert('请选择需要取消验证的记录');
		return ;
	}
	showAjaxHtml({"wait": true,"info":"请稍后......"});
	var datas = $("input[name='ids']:checked").serialize();
	$.ajax({
		url:'${ctxPath}/admin/user/plqxyz',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '取消验证出错!'});
	    },
	    success: function(obj){
			showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
	    	if(obj.rs){
				$.info(obj.msg, function(){
					grid.reload();
				});
	    	}else{
	    	    $.info(obj.msg);
	    	}
	    }
	 });
}
</@yirong.authorize>
<@yirong.authorize authCode="USER_QYYZ">
function kqyz(){
    var idArr = grid.getSelectIds();
	if(idArr.length < 1){
		$.alert('请选择需要启用验证的记录');
		return ;
	}
	showAjaxHtml({"wait": true,"info":"请稍后......"});
	var datas = $("input[name='ids']:checked").serialize();
	$.ajax({
		url:'${ctxPath}/admin/user/plqyyz',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '启用验证出错!'});
	    },
	    success: function(obj){
			showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
	    	if(obj.rs){
				$.info(obj.msg, function(){
					grid.reload();
				});
	    	}else{
	    	    $.info(obj.msg);
	    	}
	    }
	 });
}
</@yirong.authorize>
<@yirong.authorize authCode="USER_SCRL">
function sccj(){
    var idArr = grid.getSelectIds();
	if(idArr.length < 1){
		$.alert('请选择需要删除人脸的记录');
		return ;
	}
	showAjaxHtml({"wait": true,"info":"请稍后......"});
	var datas = $("input[name='ids']:checked").serialize();
	$.ajax({
		url:'${ctxPath}/admin/user/plsccj',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
		error: function(obj){
			showAjaxHtml({"wait": false,"type":"error", "msg": '删除人脸出错!'});
	    },
	    success: function(obj){
			showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
	    	if(obj.rs){
				$.info(obj.msg, function(){
					grid.reload();
				});
	    	}else{
	    	    $.info(obj.msg);
	    	}
	    }
	 });
}
</@yirong.authorize>
function zdtbjm(userid){
   showAjaxHtml({"wait": true});
   $.confirm({
		info:'您确定要同步吗？',
		ok: function () {
			$.ajax({
				url:'${ctxPath}/admin/user/zdtbjm',
				type: 'post',
				data: "userid="+userid,
				dataType: 'json',
				cache: false,
				error: function(obj){
					showAjaxHtml({"wait": false,"type":"error", "msg": '同步出错!'});
			    },
			    success: function(obj){
					showAjaxHtml({"wait": false, "msg": obj.msg, "rs": obj.rs});
			    	if(obj.rs){
						$.info(obj.msg, function(){
							//grid.reload();
						});
			    	}else{
			    	    $.info(obj.msg);
			    	}
			    }
			 });
		 }
	})
}
</script>
</head>
<body>
	<div class="body-box-list" id="bodyBoxDiv">
		<div class="query-form">
		<form action="${ctxPath}/admin/user/list" method="post" id="page_form" >
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
							<td class="td-value"><input type="text" name="loginname" value="${user.loginname!''}" onkeyup="this.value=this.value.replace(/[, ]/g,'')" style="width:160px;"/></td>
							<td class="td-label">用户姓名</td>
							<td class="td-value"><input type="text" name="realname" value="${user.realname!''}" onkeyup="this.value=this.value.replace(/[, ]/g,'')" style="width:160px;" /></td>
						</tr>

						<tr>
							<td colspan="6" class="td-btn">
								<div class="sch_qk_con"> 
									<input onclick="grid.goPage(1);"  class="i-btn-s" type="button"  value="查找"/>
									<input onclick="grid.clearForm();"  class="i-btn-s" type="button"  value="清空"/>
								</div>
						  	</td>
						</tr>
					</tbody>
				</table>
		</form>
		</div>
		<div class="pageContent">
			<div class="panelBar" id="panelBarDiv">
            	<ul>
            		<@yirong.authorize authCode="USER_ADD">
                	<li>
                    	<a href="#" class="a1" onclick="add()">
					       <span>添加</span>
						</a>	
                    </li>
                    </@yirong.authorize>
            		<@yirong.authorize authCode="USER_DELETE">
                	<li>
						<a href="#" class="a2" onclick="del()">
							<span>删除</span>
						</a>
					</li>
                    </@yirong.authorize>
                    <li class="line"></li>
                    
                </ul>
				<div class="clear_float"> </div>
			</div>

			<div class="content-list">
				<table cellpadding="0" cellspacing="0" id="gridTable">
					<col width="5%"/>
					<col width="3%"/>
					<col width="140px"/>
					<col />
			<tr>
							<th>
								序号
							</th>
							<th>
								<input type="checkbox" id="ck_all" onclick="grid.checkAll()" /> 
							</th>
							<th>
								操作
							</th>
							<th>
								用户名
							</th>
							<th>
								姓名
							</th>
							<th>
								角色名称
							</th>
					<#--		<th>
								年龄
							</th> -->
							<th>
								注册时间
							</th>
						</tr>
					</thead>
					<tbody>
					<#if userList??>
						<#list userList as user>
						<tr >
							<td class="td-seq">
								${user_index+1}
							</td>
							<td class="td-center">
								<input type="checkbox"  name="ids" value="${user.userId}" <#if user.userType==1>disabled="disabled"</#if> />
							</td>
							<td class="td-center">
							<@yirong.authorize authCode="USER_EDIT">
								<a href="#" class="a3" onclick="javascript:edit(${user.userId});">
									编辑 
								</a>
							</@yirong.authorize>
							
								<#if user.userType==2>
									<@yirong.authorize authCode="USER_ENABLED">
									<a href="#" class="a3" onclick="javascript:change(${user.userId});">
										<#if user.isEnable==1>
											禁用
										</#if>
										<#if user.isEnable==0>
											启用
										</#if>
									</a>
									</@yirong.authorize>
									
									<@yirong.authorize authCode="USER_RESETPWD">
									<a href="#" class="a3" onclick="javascript:resetpwd(${user.userId});">重置密码</a>
									</@yirong.authorize>
								</#if>
							</td>
							<td class="td-center">
								${user.loginname!''}
							</td>
							<td class="td-center">
								${user.realname!''}
							</td>
							<td class="td-center">
								<#if user.role ??>
									${user.role.roleName!''}
								</#if>
							</td>
					<#--		<td class="td-center">
								<#if user.group ??>
									${user.group.groupName!''}
								</#if>
							</td> -->
							<td class="td-center">
								<#if user.createDate??>
									${user.createDate?datetime}
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