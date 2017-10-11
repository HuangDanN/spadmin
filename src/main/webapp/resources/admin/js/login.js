$(document).ready(function() {
	$("form").submit(function() {
		$('#password').val(calcMD5($('#password').val()));
		return true;
	});
});


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

    $("form").submit();
}