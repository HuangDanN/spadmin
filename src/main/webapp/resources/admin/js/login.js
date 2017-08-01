$(document).ready(function() {
	$("form").submit(function() {
		$('#password').val(calcMD5($('#password').val()));
		return true;
	});
});
var errornum = 0;

/**
 * 去空格
 * @param {Object} str
 */
function trim(str) {
    var newStr = str.replace(/(^\s*)|(\s*$)/g,'');
    return  newStr;
}

//function huiche(){
//	if(event.keyCode==13){  
//		login();
//	}
//}

function empty(){
	if($('#password1').val().length!=$('#password').val().length){
		$('#password').val($('#password').val().substring(0,$('#password1').val().length));
	}
}

function hiddenPass(e){
	e = e ? e : window.event; 
	kcode = event.keyCode;
	if(kcode == 13){
		login();
	}else{
		var pass = document.getElementById("password1");
		var j_pass = document.getElementById("password");
		var keychar=String.fromCharCode(kcode);
		if(kcode!=8){
		  var keychar=String.fromCharCode(kcode);
		  j_pass.value=j_pass.value+keychar;
		}
	}
}

function login(){	
	if($("#username").val()==''||$("#username").val()==null||$("#username").val()=='用户名'){
		$('#error').show();
	    $('#error').html('请输入用户名');
		return ;
	}
	if($("#password1").val()==''||$("#password1").val()==null){
		$('#error').show();
	    $('#error').html('请输入密码');
		return ;
	}
//	if($("#captcha").val()==''||$("#captcha").val()==null||$("#captcha").val()=='验证码'){
//		$('#error').show();
//	    $('#error').html('请输入验证码');
//		return ;
//	}
	var passwordtemp=document.getElementById("password").value;
//	var datas = 'username='+$("#username").val()+'&password='+calcMD5(trim(passwordtemp))
//	+'&captcha='+$('#captcha').val().toString().toLowerCase();
	var datas = 'username='+$("#username").val()+'&password='+calcMD5(trim(passwordtemp))
	$.ajax({ 
		url:ctxPath+'/login/queryuser',
		type: 'post',
		data: datas,
		dataType: 'json',
		cache: false,
	    success: function(obj){
	    	if(obj.rs){
	    		$('#error').hide();
	    		if(obj.datas.islogin==1){
//	    			$.confirm({
//				        info: "该用户已在另一地点登录,是否继续登录？",
//				        ok: function () {
//							$("form").submit();
//						}
//					})
	    			$.ligerDialog.confirm("该用户已在另一地点登录,是否继续登录？",function(ok){
	    				if(ok){
	    					$("form").submit();
	    				}
	    			})
	    		}else{
	    			$("form").submit();
	    		}
	    	}else{
	    		$('#error').show();
	    		$('#error').html(obj.msg);
	    		$('#captchaImage').click();
	    		if(obj.msg=='用户名或密码输入错误'){
	    			$('#password1').val('');
	    			$('#password').val('');
	    			$('#captcha').val('');
	    			errornum++;
	    			if(errornum>2){
	    				alert("用户名或密码输入错误次数过多，系统将自动关闭！！！");
						open(' ', '_self').close();
					}
	    		}
	    	}
	    }
	 })
}