<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<META HTTP-EQUIV="Content-Type" content="text/html; charset=utf-8" />
	<META HTTP-EQUIV="pragma" CONTENT="no-cache" />
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate" />
	<META HTTP-EQUIV="expires" CONTENT="0" />
    <title>内保系统服务平台</title>
    <link href="${adminPath}/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <#include "../common/include.ftl">
    <script src="${adminPath}/ligerUI/js/ligerui.all.js" type="text/javascript"></script> 
    
<script type="text/javascript">
	$.ligerMethos.Accordion.reload = function (html) {
	    this.accordion.html(html);
	    this._render();
	};
	var tab = null;
	var accordion = null;
	var tabNum = 0;
	
	var zIndex = 1000;
	
	var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false,
			expandSpeed:""
		},
		
		data: {
			simpleData: {
				enable:true,
				idKey: "menuId",
				pIdKey: "parentId"
			},
			key:{
				name: "menuName",
				children:"subMenus"
			}
		},
	
		callback: {
			onClick: function(event, treeId, treeNode){
				var openType = treeNode.openType; //打开类型 
				var menuType = treeNode.menuType; //菜单类型
				var sUrl = "${ctxPath}" + treeNode.menuUrl;
				if(menuType == "3"){
					if(openType && openType == 1){
	                	f_addTab(treeNode.menuId, treeNode.menuName, sUrl);
					}else if(openType && openType == 2){
						$.openWin({url:sUrl});
					}
				}else if(menuType == 2){
					zTree = $.fn.zTree.getZTreeObj(treeId);
					zTree.expandNode(treeNode, !treeNode.open);
				}
			}
		}
	};
	$(function (){
		
		$("#layout1").ligerLayout({ leftWidth: 190, height: '100%',heightDiff:-25,space:4, onHeightChanged: f_heightChanged });
		var height = $(".l-layout-center").height();
		$("#framecenter").ligerTab({ height: height });
		$("#accordion1").ligerAccordion({ height: height - 24, speed: null, changeHeightOnResize: true});
		$(".l-link").hover(function (){
			$(this).addClass("l-link-over");
		}, function (){
			$(this).removeClass("l-link-over");
		});
		tab = $("#framecenter").ligerGetTabManager();
		accordion = $("#accordion1").ligerGetAccordionManager();
		
		${js!''}
		$("#pageloading").hide();
		
		var h=parseInt($("#div_${firstTabId }").css("height"))-12;
		$("#layout1 div ul[class='ztree']").css("height" , h);
		
		$("#home").attr("src", "${adminPath}/goHomePage");
		//ie6
	/**	if(navigator.userAgent.indexOf("MSIE 6.0") > 0) { 
			//$(".l-topmenu-logo").css({
			//	"background":"url('${adminPath}/images/top-left.gif') no-repeat 10px 0px",
			//	"height":"45px"
			//});
		    $(".l-topmenu-logo").css("background","url('${adminPath}/images/top-left.gif') no-repeat 10px 0px");
	    	$(".l-topmenu-logo").height("45px");
	    }  */
	    autoShow();
	    <@yirong.authorize authCode="ALARMSFZ_TIP">
	    showAlarm();
	    </@yirong.authorize>
	    
	    $.ajax({
	    	url:'${ctxPath}/admin/userInfo',
	    	type: 'post',
	    	data: "",
			dataType: 'json',
			cache: false,
			error: function(obj){
		    },
		    success: function(obj){
		    	var data = obj.datas;
		    	$('#userInfo').html("您好，"+data.realname);
		    }
	    })
	});

	function autoShow(){
		$.ajax({
			url:'${ctxPath}/admin/userTopMenu',
			type: 'post',
			data: "",
			dataType: 'json',
			cache: false,
			error: function(obj){
		    },
		    success: function(obj){
		    	if(obj.rs){
		    		var data = obj.msg;
					zTree = $.fn.zTree.getZTreeObj('tab_'+data);
					var nodes = zTree.getNodes();
					if(nodes.length == 1){
						zTree.expandNode(nodes[0], !nodes[0].open);
						if(nodes[0].subMenus.length == 1){
							var treeNode = nodes[0].subMenus[0];
							var sUrl = "${ctxPath}" + treeNode.menuUrl;
							f_addTab(treeNode.menuId, treeNode.menuName, sUrl);
						}
					}
		    	}
		    }
		})
	}	
	
	function showAlarm(){
		$.ajax({
			url:'${ctxPath}/admin/registsfz/countAlarm',
			type: 'post',
			dataType: 'json',
			cache: false,
			error: function(obj){
		    },
		    success: function(obj){
		    	if(obj.rs){
		    		var data = obj.datas;
		    		var content = '';
		    		if(data[0] > 0){
		    			content = '<div><span style="color:red;cursor:pointer" onclick="trunAlarm()" ><img src="${adminPath}/images/sfz/alarm.gif">发现滞留证件信息,共'+data[0]+'条!</span></div>'
		    			
		    		}
		    		if(data[1] > 0 ){
		    			content = content + '<div><span style="color:red;cursor:pointer" onclick="truncCcic()" ><img src="${adminPath}/images/sfz/alarm.gif">发现CCIC证件信息,共'+data[1]+'条!</span></div>'
		    		}
		    		if(content.length>0){
		    			$.ligerDialog.tip({title:'提示信息',content:content,width:300,height:200})
		    		}
		    	}
		    }
		})
	}
	
	function trunAlarm(){
		f_addTab('116','周期报警信息','${ctxPath}/admin/registsfz/alarmList')
	}
	
	function truncCcic(){
		f_addTab('125','CCIC制证报警查询','${ctxPath}/admin/ccic/list')
	}
	
	function f_heightChanged(options){
		if(tab)
			tab.addHeight(options.diff);
		if(accordion && options.middleHeight - 24 > 0)
			accordion.setHeight(options.middleHeight - 24);
	}
	function getHtml(){
	    $.ajax({
			url:'${ctxPath}/admin/gethtml',
			type: 'post',
			data: "",
			dataType: 'json',
			cache: false,
			error: function(obj){
				$.alert("刷新菜单出错，请手动右键刷新菜单！");
		    },
		    success: function(obj){
		    	if(obj.rs){
					var zNodes=obj.datas;
					$.fn.zTree.init($("#tab_40"),setting,zNodes);
		    	}
		    }
		})
	}
	
	var tabtext = "";
	function f_addTab(tabid,text, url){
		if(tab.isTabItemExist(tabid)){
	        tab.selectTabItem(tabid);
	    	tab.reload(tabid);
	    }else{
	    	if(tab.getTabItemCount() >= 20){
		    	$.alert('你打开的窗口太多，请先关闭一些再打开！');
		    	return ;
		    }
		    while(url.indexOf('//')==0){
		    	url = url.substring(1,url.length);
		    }
		    
		   	tab.addTabItem({ tabid : tabid,text: text, url: url });
	    }
	    <@yirong.authorize authCode="ZZXX_SMTJ">
		   	if(url.indexOf('/admin/cardmanage/process/list')>-1){
		   		tabtext = tabid;
	//	   		setTimeout(function(){
	//		   		var ifr = document.getElementById(tabid);
	//		   		var win = ifr.window||ifr.contentWindow;
	//		   		win.delayAdd();
	//		   	},1000)
		   	}
		</@yirong.authorize>		   	
	}
	
	function delayAdd(){
		var ifr = document.getElementById(tabtext);
		var win = ifr.window||ifr.contentWindow;
		win.delayAdd();
	}
	
	function f2_addTab(tabid,text, url){   
		if(tab.isTabItemExist(tabid)){
		    tab.removeTabItem(tabid) 
	        while(url.indexOf('//')==0){
		    	url = url.substring(1,url.length);
		    }
	    	tab.addTabItem({ tabid : tabid,text: text, url: url });
	    }else{
	    	if(tab.getTabItemCount() >= 20){
		    	$.alert('你打开的窗口太多，请先关闭一些再打开！');
		    	return ;
		    }
		    while(url.indexOf('//')==0){
		    	url = url.substring(1,url.length);
		    }
		   	tab.addTabItem({ tabid : tabid,text: text, url: url });
	    }
	}
	
	function changePassword(){
		$.openWin({url:"${ctxPath}/admin/user/changepassword", width: 600, height: 300});
	} 
	
	function goUsers(){
		var form = document.getElementById("dataForm");
		//$("#dataForm").action="${ctxPath}/admin/workshop/login";
		form.action="${ctxPath}/admin/workshop/login";
		form.submit();
	} 
	 
</script> 

<style type="text/css"> 
    body,html{height:100%;}
    body{padding:0px; margin:0;overflow:hidden;}  
    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; text-decoration:underline; color:#333;}
    .l-link2{text-decoration:underline; color:white; margin-left:2px;margin-right:2px;}
    .l-layout-top{background:#102A49; color:White;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    #pageloading{position:absolute; left:0px; top:0px; background:white url('${adminPath}/images/loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
    .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
    .space{ color:#E7E7E7;}
    /* 顶部 */ 
    .l-topmenu{ margin:0; padding:0; height:70px; line-height:70px; background:url('${adminPath}/images/top.jpg') repeat-x bottom;  position:relative; border-top:1px solid #1D438B;  }
    .l-topmenu-logo{ color:#E7E7E7; padding-left:35px; line-height:70px;background:url('${adminPath}/images/topicon.png') no-repeat 10px 0px; margin-top:5px;}
    .l-topmenu-welcome{  position:absolute; height:40px; line-height:70px;  right:30px; top:0px;color:#070A0C;}
    .l-topmenu-welcome a{ color:#E7E7E7; text-decoration:underline}    
    .ztree li a {color:#026696;padding:1px 3px 0 0; margin:0 10px 0 0; cursor:pointer; height:16px; background-color: 
transparent;text-decoration:none; vertical-align:top; display: inline-block}

	
</style>
</head>
<body style="padding:0px;background:#026696;"> 
<form  method="post" id="dataForm">
	<div id="pageloading"></div>  
	<div id="topmenu" class="l-topmenu">
	    <div class="l-topmenu-logo"> &nbsp;</div>
	    <div class="l-topmenu-welcome">
	<!--        <span style="color: #E7E7E7;">您好，${Session["sessionUserName"]!''}</span>  -->
	 		<span style="color: #E7E7E7;" id="userInfo"></span>
	        <span class="space">|</span>
	        <a href="#" class="l-link2" onclick="changePassword()">修改密码</a> 
	        <span class="space">|</span>
	     <a href="${ctxPath}/admin/securityLogout" class="l-link2">退出</a>  
		<!--   	<a href="${ctxPath}/admin/chejian" class="l-link2">退出</a>-->
	        <span id="jiangefu"class="space" style="display:none">|</span>
	        <a id="changeuser" class="changeuser" style="display:none" href="${ctxPath}/admin/workshop/login" class="l-link2">切换用户</a>    
	 	</div> 
	</div> 
	<div id="layout1" style="width:99.2%;margin:0 auto; margin-top:4px; "> 
        <div position="left"  title="功能菜单" id="accordion1"> 
              ${html!''}
        </div>
	    <div position="center" id="framecenter" > 
	        <div tabid="home" title="我的主页" style="height:300px" onCloseAll="removeAll()">
	            <iframe frameborder="0" name="home" id="home"></iframe>
	        </div>  
	        <img style="position:absolute;z-index:2147483584;right:20px;top:0px;height:20px;cursor:pointer"
	        	 title="关闭所有" src="${adminPath}/images/guanb.jpg"  onclick="removeAll();" >
	   		<a id="closeBut">
	    </div> 	
	      
	</div>
	<!-- 
		<div id="anniu" style="position:absolute;width:100; height:30;
		z-index:2147483584;right:30px;top:110px">
	    	<p onclick="removeAll();" class="i-btn-s" type="button"  value="">关闭所有</p>
	    </div> 
    -->
	<div style="height:25px; line-height:25px; text-align:center;margin:0px;">
           Copyright &copy; 2015 All rights reserved. 
    </div>
   </form>
</body>
<script type="text/javascript"> 
	$(document).ready(function(){ 
		$.ajax({ 
			url:'${ctxPath}/login/queryuseryz',
			type: 'post',
			data: {},
			dataType: 'json',
			cache: false, 
		    success: function(obj){
		    	if(obj.rs){  
		    		$('#changeuser').show(); 
		    		$('#jiangefu').show();
		    	}
		    }
		 })
	}); 
	function removeAll(){ 
	tab = $("#framecenter").ligerGetTabManager();
	tab.removeAll();
		//window.location.reload(); 
		//document.execCommand('Refresh');
		//document.URL=window.location.href;
		//location.replace(location);
		//grid.reload();
	}
</script>
</html>