<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>内保系统登入</title>
<link href="${adminPath}/css/login.css" rel="stylesheet" type="text/css" />
<link href="${adminPath}/css/index.css" rel="stylesheet" type="text/css" />
<link href="${adminPath}/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet" type="text/css" />
<#include "../common/include.ftl">
<script src="${adminPath}/ligerUI/js/ligerui.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="${adminPath}/common/js/Md5Utils.js"></script>
<script type="text/javascript" src="${adminPath}/js/login.js"></script>
<style type="text/css">
		body{
			  align:center;
		      background:url('${adminPath}/images/bj.png') no-repeat center;
		        
		      height:100%; 
		}
		 
		#id3{ 
				float:left;
				position:relative;
				top:40px;
				left:-180px; 
		}
		.loginbg{ 
			width: 980px; 
			height:480px;
			margin-top:90px;
		 	margin-bottom:20px; 
		 	margin-left:-160px;
		}
		img{border:0;}
</style>
<script type="text/javascript">
	var ctxPath = '${ctxPath}';
	if (window.top!=null&& window.top.document.URL!=document.URL){
	    alert("该页面已过期或有其他用户在另一地点登录！");
		window.top.location=window.top.location; 
	} 
	
	function xuanze(obj,str,index){
	   if(obj.src.indexOf("xuanzhong")<0){
	       obj.src="${adminPath}/images/icons/"+str+".png";
		}
	}
	
</script>
</head>
<body  align="center">
<div style="width:100%;height:100%;position: relative;top:80px;overflow:hidden; display:block" align="center"> 
		<div class="loginbg" align="left" style="background-image:url(${adminPath}/images/login/loginbg1.png);">
			<div style="padding-top:90px;">
			<div style=" display: block;" >
			<form  action="${adminPath}/securityLogin" method="post" name="myform" autocomplete="off">
				
				<div id="id1" class="login">
					<div style="margin-top:15px;">
						<div style="margin-top:20px; margin-left:-40px;">用户名</div>
						<div style="margin-top:-25px;">
							<input  class="input" id="username" type="text" name="j_username" value="" onfocus="javascript:if(this.value=='用户名')this.value='';"  style="width:200px;height:19px;"/>
						</div>
					</div>
					<div style="margin-top:15px;">
						<div style="margin-top:0px; margin-left:-40px;">密&nbsp&nbsp码</div>
						<div style="margin-top:-25px;">
							<input type="text" id="password1" style="width:200px;height:19px;" name="password1" maxlength="16" title="长度不能超过16位" value="" onfocus="javascript:if(this.value=='密码')this.value='';"
									  onkeypress="javascript:hiddenPass(event)" onkeyup="this.value=this.value.replace(/./g,'*');javascript:empty()" onkeydown="huiche()"/>
							<input id="password" type="hidden" name="j_password" maxlength="16" />
						</div>
					</div>
					<div style="margin-top:15px;padding-top:5px">
						<div style="margin-top:0px; margin-left:-40px;">验证码</div>
						<div style="margin-top:-25px;">
							<input class="input" type="text" name="j_captcha" id="captcha" style="width:130px;height:19px;" onkeydown="huiche()" value="" onfocus="javascript:if(this.value=='验证码')this.value='';"/>
						</div>
						<div  style="margin-top:-28px; margin-left:145px;" >
							<img  id="captchaImage" style="height:21px;width:60px; cursor: hand;"
								onclick="this.src+=('?'+Math.random());" alt="图片看不清？点击重新得到验证码"
								src="${ctxPath}/jcaptcha">
						</div>
					</div>  
				</div>
				<div id="id2" style="margin-left:470px; margin-top:5px;"> 
					<span>	
					    <a href="#"  onclick="login()"><img src="${adminPath}/images/icons/denglu1.png" style="float:left;cursor: hand; margin-left:10px;margin-top:3px;"
						 id="get1" onmouseover="xuanze(this,'denglu1-huaguo',1)" onmouseout="xuanze(this,'denglu1',1);" /></a>
					</span>
                    <span>	
					    <a href="#"  onclick="login()"><img src="${adminPath}/images/icons/quxiao.png" style="float:left;cursor: hand;margin-left:5px;margin-top:3px; "
						 id="get1" onmouseover="xuanze(this,'quxiao-huaguo1',1)" onmouseout="xuanze(this,'quxiao',1);" /></a>
					</span>
				</div>
				<div  id="id3"> 
				    <p id="error" style="dispaly:none;color:red">
					    <#if SPRING_SECURITY_LAST_EXCEPTION??>
							<#if SPRING_SECURITY_LAST_EXCEPTION.message??>
									 ${SPRING_SECURITY_LAST_EXCEPTION.message}
							</#if>
						</#if>
				    </p> 
				</div>
			</form> 
			</div>
		</div>
	</div>
</div>
</body>
</html>
 