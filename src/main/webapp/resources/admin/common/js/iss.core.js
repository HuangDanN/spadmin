(function($){
	$.fn.extend({
		hoverClass: function(className){
			var _className = className || "hover";
			return this.each(function(){
				$(this).hover(function(){
					$(this).addClass(_className);
				},function(){
					$(this).removeClass(_className);
				});
			});
		}
	});
})(jQuery);

(function($){
	$.fn.extend({

		/** ��Ԫ��hover�¼�**/
		hoverClass: function(className){
			var _className = className || "hover";
			return this.each(function(){
				$(this).hover(function(){
					$(this).addClass(_className);
				},function(){
					$(this).removeClass(_className);
				});
			});
		} //hoverClass end ~~~
		
	})
})(jQuery);


(function($){
	$.extend({   

		clientHeight: function(){
			var winHeight;
			if (window.innerHeight) winHeight = window.innerHeight; 
			else if ((document.body) && (document.body.clientHeight)) 
				winHeight = document.body.clientHeight; 

			//计算window高度
			if (document.documentElement 
				&& document.documentElement.clientHeight){winHeight = document.documentElement.clientHeight;}

			return winHeight;
		},
		
		/** window.open 参数对象{url:'',width:'',height:'',vArguments:{}}*/
		showModalDialog: function(param){
			var sUrl = param.url;
			var sWidth = param.width;
			var sHeight = param.height;
			var vArguments = param.vArguments;
			
			if(typeof(vArguments) == "undefined" || vArguments == null){
				vArguments = window.self;
			}

			if(typeof(sWidth) == "undefined"){
				sWidth = screen.availWidth*0.65;
			}else{
				sWidth = parseInt(sWidth);
			}

			if(typeof(sHeight) == "undefined"){
				sHeight = screen.availHeight*0.85;
			}else{
				sHeight = parseInt(sHeight);
			}
			
			sFeatures = "dialogHeight:"+sHeight+"px;dialogWidth:"+ sWidth +"px;status:yes;scroll:yes;resizable:no;center:yes";
			return window.showModalDialog(sUrl, vArguments, sFeatures);
		},

		/**设定固定大小*/
		showModalDialogFix_min: function(sUrl, vArguments){
			var sHeight = screen.availHeight * 0.55;
			var sWidth = screen.availWidth * 0.85;
			
			return $.showModalDialog({url:sUrl, width:sWidth, height:sHeight, vArguments:vArguments});
		},

		/**设定固定大小*/
		showModalDialogFix_mid: function(sUrl, vArguments){
			var sHeight = screen.availHeight * 0.65;
			var sWidth = screen.availWidth * 0.85;

			return $.showModalDialog({url:sUrl, width:sWidth, height:sHeight, vArguments:vArguments});
		},


		/**设定固定大小*/
		showModalDialogFix_max: function(sUrl, vArguments){
			var sHeight = screen.availHeight * 0.75;
			var sWidth = screen.availWidth * 0.85;

			return $.showModalDialog({url:sUrl, width:sWidth, height:sHeight, vArguments:vArguments});
		},
		
		/** window.open 参数对象{url:'',width:'',height:''}*/
		fnShowWindow: function(param){
			param.height = parseInt(param.height);
			param.width = parseInt(param.width);
			param.url = $.trim(param.url);
			var sTop = (window.screen.availHeight - param.height)/2;
			var sLeft = (window.screen.availWidth - param.width)/2;
			var sFeatures = "height="+param.height+", width="+param.width+", top="+sTop+", left="+sLeft+", scrollbars=yes, toolbar=no, menubar=no, resizable=yes, location=no, status=yes"
			var oNewWindow = window.open(param.url, "_blank", sFeatures);
			if(parseInt(navigator.appVersion) >= 4){oNewWindow.window.focus();}
			return oNewWindow;
		},

		/**window.open 打开小窗口*/
		fnShowWindow_min: function(sUrl, sFeatures){
			var sHeight = screen.availHeight * 0.55;
			var sWidth = screen.availWidth * 0.85;
			return $.fnShowWindow({url:sUrl, width:sWidth, height:sHeight});
		},

		/**window.open 打开中型窗口*/
		fnShowWindow_mid: function(sUrl, sFeatures){
			var sHeight = screen.availHeight * 0.65;
			var sWidth = screen.availWidth * 0.85;
			return $.fnShowWindow({url:sUrl, width:sWidth, height:sHeight});
			
		},

		/**window.open 打开大窗口*/
		fnShowWindow_max: function(sUrl, sFeatures){
			var sHeight = screen.availHeight * 0.75;
			var sWidth = screen.availWidth * 0.85;
			return $.fnShowWindow({url:sUrl, width:sWidth, height:sHeight});
		},
		
		/**判断是否是非法字符**/
		resolvChar: function(str){
			/*if (str.length == 1){
				if( str == '&' || str == '<'
				  || str == '>' || c == '\''|| c == '\"'
				  || str == '%'
				  || str == '|' 
				  || str == '%' 
				  || str == '＆' || str == '＜'
				  || str == '＞' ){
					return true;
				}
		   	}else {
			  	for (i = 0; i < str.length; i++){
					var c = str.charAt(i);
					if( c == '&' || c == '<'
					  || c == '>' || c == '\''|| c == '\"'
					  || c == '%'
					  || str == '|' 
					  || c == '%' 
					  || c == '＆' || c == '＜'
					  || c == '＞' ){
						return true;
					}
				}
			}*/

			//判断是否包含html标签
			var htmlReg = /<.*?>/g;
			if(htmlReg.test(str)){ return true; }

			return false;
		},
		
		/**重新设置token*/
		resetFormToken: function(XMLHttpRequest){
			if(XMLHttpRequest.token && XMLHttpRequest.token.token){
				$("#_form_token_uniq_id").val(XMLHttpRequest.token.token);//重写token到表单
			}
			else{
				$.ajax({
						url: "formToken/newToken",
						type: 'post',
						data: null,
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						timeout: 10000,
						dataType: 'json',
						cache: false,
						error: function(){
						},
						success: function(XMLHttpRequest){
							if(XMLHttpRequest.token && XMLHttpRequest.token.token){
								$("#_form_token_uniq_id").val(XMLHttpRequest.token.token);//重写token到表单
							}
						}
				});
			}
		},

		//列表查询提交
		form_submit: function(submit_form, param){
			if(param.action){ submit_form.action = param.action; }
			if(param.method){ submit_form.method = param.method; }
			if(param.pageNo){ $("input[name=pageNo]", $(submit_form)).val(param.pageNo); }
			if(param.pageSize){ $("input[name=pageSize]", $(submit_form)).val(param.pageSize); }


			submit_form.submit();
		}
		
	});
})(jQuery);

/** 垃圾回收 */
$(function(){
	if ($.browser.msie) {
		window.setInterval("CollectGarbage();", 5000);
	}
})





var winOpener = null;
var winDialog = null;
var waitObj = null;
(function($){
	$.extend({
		//获取window高度
		clientHeight: function(){
			var winHeight;
			if (window.innerHeight) winHeight = window.innerHeight; 
			else if ((document.body) && (document.body.clientHeight)) 
				winHeight = document.body.clientHeight; 
			if (document.documentElement 
				&& document.documentElement.clientHeight){winHeight = document.documentElement.clientHeight;}

			return winHeight;
		},
		
		//获取window宽度
		clientWidth: function(){
			var winWidth;
			if (window.innerWidth) winWidth = window.innerWidth; 
			else if ((document.body) && (document.body.clientWidth)) 
				winWidth = document.body.clientWidth; 
			if (document.documentElement 
				&& document.documentElement.clientWidth){winWidth = document.documentElement.clientWidth;}

			return winWidth;
		},
		
		//弹出窗口对象
		openWin : function(param){
			
			var Url = $.trim(param.url);
			var Title = param.title || '窗口';
			var Modal = param.modal === false ? false : true;
			var allowClose = param.allowClose === false ? false : true;
//			var showMax = param.showMax === false ? false : true;
			var showMax = false;
			if(!window.winOpener){
				window.winOpener = window.top.winOpener;
			}
			window.top.winOpener = window;
			
			
			var Height = param.height || screen.availHeight * 0.75;
			var Width = param.width || screen.availWidth * 0.85;
			winDialog = window.top.$.ligerDialog.open({url:Url, title:Title, width:Width, height:Height, showMax: showMax, isResize: true, isHidden: true, modal: Modal, name: param.name,allowClose: allowClose, onClose:param.onClose});
			
			window.top.winDialog = winDialog;
			return winDialog;
		},
		
		//获取父窗口对象
		getWinOpener : function(){
			return window.winOpener || window.top.winOpener;
		},
		
		//获取当前弹出窗口对象
		getWindow : function(){
			if($.getWinOpener())
				return $.getWinOpener().winDialog || window.top.winDialog;
			else
				return window.top.winDialog;
		},
		
		//关闭窗口
		closeWin : function(){
			$.getWindow().hide();
		},
		
		//确认对话框
		confirm : function(param){
			return window.top.$.ligerDialog.confirm(param.info, function (yes) {
//			return $.ligerDialog.confirm(param.info, function (yes) {
				if(yes){
					if($.isFunction(param.ok)){
						param.ok();
					}
				}else{
					if($.isFunction(param.cancel)){
						param.cancel();
					}
				}
			});
		},
		
		//信息提示，3秒后提示窗口自动关闭
		info : function(info, callback, Title){
			var title = Title || '';
			window.top.manager = window.top.$.ligerDialog.alert(info, title, 'success', callback);
			window.top.mark = true;
			window.top.setTimeout(function () {
				if(window.top.mark && window && window.top && window.top.manager){
					window.top.manager.close();
					if($.isFunction(callback)){
						callback();
					}
				}
			}, 3000);
			return window.top.manager;
		},
		
		//提示信息
		alert : function(info, callback, Title){
			var title = Title || '';
			return window.top.$.ligerDialog.alert(info, title, 'warn', callback);
		},
		
		//正在保存
		wait : function(info){
			var msg = info || '正在保存中,请稍候...';
			return window.top.$.ligerDialog.waitting(msg);
		},
		
		//判断是否是非法字符
		resolvChar: function(str){
			var htmlReg = /<.*?>/g;
			if(htmlReg.test(str)){ return true; }
			return false;
		},
		//进度条
		progressbar:function(){
			var msg = '<div id="jindutiao" style="width:162px; height:20px; margin:10px auto;"><div>正在执行中...</div>'+
					  '<div style="width:162px; height:20px; background:url(common/images/progressbar/bak.png) no-repeat; ">'+
					  '<div class="tiao" style="width:0px; height:20px; background:url(common/images/progressbar/pro.png) no-repeat; text-align:center;font-family:Tahoma; font-size:12px; line-height:48px;"></div></div><div>';
//       		return window.top.$.ligerDialog.waitting(msg);
			return window.top.$.ligerDialog.open({target:msg,width:250,height:150,allowClose:false})
		}
		

	});
})(jQuery);

//ajax处理前后提示信息显示方法
function showAjaxHtml(param){
	if(param.wait){
		$("#infoBoxDiv").html("").css("display","none");
		waitObj = $.wait(param.info);
	}else{
		waitObj.close();
		if(!param.rs){
			if(typeof(param.msg) == "undefined"){
				param.msg = "";
			}
		    $("#infoBoxDiv").html(param.msg).css("display","block");
	    }
	}
}

//i为从百分几开始      str为多少秒 (1000为1s)
var progressbar = null;
function showProgressbar(param){
	if(param.time){
		var j = param.seconds/100;
		if(param.percent<=100){
			$(".tiao").css("width",param.percent+"%").html(param.percent+"%");
		    param.percent++;
		    setTimeout(function(){
		    	showProgressbar(param);
		    },j)
		}
	}else{
		$(".tiao").css("width",param.percent+"%").html(param.percent+"%");
	}
}

function hideProgressbar(){
	$(".tiao").css("width","100%").html("100%");
	setTimeout(function(){
		$.info('执行成功',function(){
			$.ligerDialog.hide();
		})
	},100)
}



// 垃圾回收
$(function(){
	if ($.browser.msie) {
		window.setInterval("CollectGarbage();", 10000);
	}
});


//获取中文字符的长度
function getByteLen(str){
    var len = 0;
    for (var i = 0; i < str.length; i++)
    {
        if (str.charCodeAt(i) > 255) len += 2;
        else len++;
    }
    return len;
}

// 李书德
function banBackSpace(e){   
   var ev = e || window.event;//获取event对象     
   var obj = ev.target || ev.srcElement;//获取事件源     
     
   var t = obj.type || obj.getAttribute('type');//获取事件源类型  
    
   //获取作为判断条件的事件类型  
   var vReadOnly = obj.getAttribute('readonly');  
   var vEnabled = obj.getAttribute('enabled');  
   //处理null值情况  
   vReadOnly = (vReadOnly == null) ? false : vReadOnly;  
   vEnabled = (vEnabled == null) ? true : vEnabled;  
     
   //当敲Backspace键时，事件源类型为密码或单行、多行文本的，  
   //并且readonly属性为true或enabled属性为false的，则退格键失效  
   var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea")   
               && (vReadOnly==true ||vReadOnly=="readonly"|| vEnabled!=true))?true:false;  
    
   //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效  
   var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")  
               ?true:false;  
   //判断  
   if(flag2){  
       return false;  
   }  
   if(flag1){     
       return false;     
   }  
}  

function clearinfoBoxDiv(){
	$("#infoBoxDiv").html("").css("display","none");
}

//禁止后退键 作用于Firefox、Opera  
document.onkeypress=banBackSpace;  
//禁止后退键  作用于IE、Chrome  
document.onkeydown=banBackSpace; 

