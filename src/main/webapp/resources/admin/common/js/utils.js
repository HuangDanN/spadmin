/**
 * js 基础验证函数
 * @autor rongji.com
 * arrange on 23 Jan 2010
 * last updated 23 Jan 2010
 */
Date.prototype.format = function(fmt)   
{ //author: meizz   
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}  


String.prototype.trim=function(){
　　    return this.replace(/(^\s*)|(\s*$)/g, "");
　　 }

Array.prototype.indexOf=function(val){
	for(var i=0;i<this.length;i++){
		if(this[i]==val)return i;
	}
	return -1;
}

Array.prototype.remove=function(val){
	var index = this.indexOf(val);
	if(index > -1){
		this.splice(index,1);
	}
}
 
// 验证参数有效性
function isValidityParam(param){
	if(param == undefined || param == null){
		return false;
	}
	return true;
}

// 验证参数非空与否
function isValueEmpty(param){
	if(!isValidityParam(param) || param.toString().trim() == ""){
		return true;
	}
	return false;
}

/*
 * 验证传入对象空值与否
 */
function chkEmptyForObj(obj){
	if(!isValidityParam(obj)){
		showReloadAlert("验证对象不存在，请检查！");
		return false;
	}
	return isValueEmpty(obj.value);
}

// 判断非空并聚焦可视标签
function chkEmptyForObjFocus(obj,msg,focusObj){
	if(chkEmptyForObj(obj)){
		if(isValueEmpty(msg)){
			msg = "信息项内容非空，请输入！";
		}
		showReloadAlert(msg,'',function(){
										try{
											focusObj.focus();
											focusObj.select();
										}catch(e){
											try{
												obj.focus();
												obj.select();
											}catch(e){}
										}
										return false;
									 });
	}else{
		return true;
	}
}

/* 
 * 验证传入值是否为空
 * 暂不使用此方法，调用isValueEmpty（）
 */
function chkEmptyForValue(values){
	if(!isValidityParam(values)){
		return true;
	}
	if(values.toString().trim() == ""){
		return true;
	}
	return false;
}

/* 日期有效性验证,以实际传入值进行验证
 * yyyy-(/)MM-(/)dd
 * 年份4位
 * 月份1~2位
 * 日期1~2位
 * 连接符-或/
 * 包含月天数及闰年判断
 */
function isValidityDate(dateValue){
	if(!isValueEmpty(dateValue)){
		dateValue = dateValue.toString().trim();
		var timeValue;
		if(dateValue.indexOf(" ") > -1){
			var dv = dateValue.split(" ");
			dateValue = dv[0];
			timeValue = dv[1];
		}
		var datePattern;
//		if(dateValue.indexOf("-") == -1 && dateValue.indexOf("/") == -1){
//			// 纯年份验证
//			datePattern = /^[1-9]{1}\d{3}$/;
//		}else if((dateValue.indexOf("-") == dateValue.lastIndexOf("-") && dateValue.indexOf("/") == -1) || (dateValue.indexOf("/") == dateValue.lastIndexOf("/") && dateValue.indexOf("-") == -1)){
//			// 年份、月份验证
//			datePattern = /^[1-9]{1}\d{3}(-|\/)(([0][1-9]{1})|([1][0-2]{0,1}))$/;
//		}else{
			datePattern = /^(?:(?!0000)[1-9]{1}\d{3}(-|\/)(?:(?:0[1-9]|1[0-2]{0,1}|[2-9])(-|\/)(?:0[1-9]|1[0-9]{0,1}|2[0-8]{0,1}|[3-9])|(?:0{0,1}[13-9]|1[0-2])(-|\/)(?:29|30)|(?:0{0,1}[13578]|1[02])(-|\/)31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)(-|\/)0{0,1}2(-|\/)29)$/;
//		}
		if(!datePattern.test(dateValue) || !isValidityTime(timeValue)){
			return false;
		}
	}
	return true;
}

//判断查询日期的合法性和范围是否符合要求
function isBetweenDateValid(begDateTarget,endDateTarget,begMc,endMc){
	if(isValidityParam(begDateTarget) && isValidityParam(endDateTarget)){
		if(!isValidDateForObj(begDateTarget) || !isValidDateForObj(endDateTarget)){
			return false;
		}else{
			var begDate = begDateTarget.value.trim();
			var endDate = endDateTarget.value.trim();
			if((!isValueEmpty(begDate) && !isValueEmpty(endDate)) && (begDate > endDate)){
				begMc = (isValueEmpty(begMc))?"起始日期":begMc;
				endMc = (isValueEmpty(endMc))?"结束日期":endMc;
				showAlertAndFocus("验证"+begMc+"不得在"+endMc+"之后，请检查！",begDateTarget);
				return false;
			}
			return true;
		}
	}
	return true;
}

// 日期格式校验提示信息
function dateFormatAlertMsg(v){
	var unValidMsg = new String("");
	if(!isValueEmpty(v)){
		unValidMsg += new String("输入内容［"+v+"］格式有误，请检查！<br>");
	}
	unValidMsg += new String("正确格式要求如下：");
	var daten = new Date();
	if(!isValueEmpty(v) && v.indexOf(" ") > -1){
		unValidMsg += new String("<br>1、"+daten.format("yyyy-MM-dd HH:mm:ss"));
		unValidMsg += new String("<br>2、"+daten.format("yyyy/MM/dd HH:mm:ss"));
	}else{
		unValidMsg += new String("<br>1、"+daten.format("yyyy-MM-dd"));
		unValidMsg += new String("<br>2、"+daten.format("yyyy/MM/dd"));
	}
	return unValidMsg;
}

/**
 * 判断对象值是否为合法的日期
 * add 2010-3-22
 */
function isValidDateForObj(obj){
	if(!isValidityParam(obj) || isValueEmpty(obj.tagName)){
		try{
			obj = event.srcElement;
		}catch(e){}
	}
	if(isValidityParam(obj)){
		try{
//			var unValidMsg = "验证日期有误，请检查日期格式的有效性及合法性！";
			if(!isValueEmpty(obj.value)){
				if(!isValidityDate(obj.value)){
					var unValidMsg = dateFormatAlertMsg(obj.value);
					obj.value = "";
					showReloadAlert(unValidMsg,"格式校验",function(){
						obj.fireEvent("onclick")
					});
//					showAlertAndFocus(unValidMsg,obj);
					return false;
				}
			}
		}catch(e){}
	}
	return true;
}

//判断输入的日期是否合法,add by xiaoxin  20100320
function isValidDateForAlert(sDate){
	if(!isValueEmpty(sDate) && !isValidityDate(sDate)){
//		var unValidMsg = "验证日期有误，请检查日期格式的有效性及合法性！";
		var unValidMsg = dateFormatAlertMsg(sDate);
		showReloadAlert(unValidMsg);
		return false;
	}
	return true;
}

/* 时间有效性验证,以实际传入值进行验证
 * HH:mm:ss
 * 时1~2位
 * 分1~2位
 * 秒1~2位
 * 连接符：
 */
function isValidityTime(timeVale){
	if(!isValueEmpty(timeVale)){
		timeVale = timeVale.toString().trim();
		var timePattern;
		switch(parseInt(timeVale.split(":").length)){
			case 1:
				timePattern = /^(20|21|22|23|[0-1]?\d)$/;
				break;
			case 2:
				timePattern = /^(20|21|22|23|[0-1]?\d):[0-5]?\d$/;
				break;
			default:
				timePattern = /^(20|21|22|23|[0-1]?\d):[0-5]?\d:[0-5]?\d$/;
				break;
		}
		if(!timePattern.test(timeVale)){
			return false;
		}
	}
	return true;
}

// 校验时间是否在限制范围内
function isBetweenTimeSet(tmd){
	var chkVal,minTime="08:00:00",maxTime="18:00:00";
	var focusObj;
	try{
		focusObj = event.srcElement;
		chkVal = focusObj.value;
	}catch(e){}
	if(!isValueEmpty(chkVal) || isValidityParam(tmd)){
		if(isValidityParam(tmd)){
			if(typeof(tmd.chkVal) == "object"){
				focusObj = tmd.chkVal;
				chkVal = tmd.chkVal.value;
			}else{
				chkVal = tmd.chkVal;
			}
		}
		
		if(!isValueEmpty(chkVal)){
			var alt = tmd.alt;
			alt = (!isValueEmpty(alt))?alt:"检验时间";
			if(isValidityParam(tmd)){
				if(!isValueEmpty(tmd.mint) && isValidityTime(tmd.mint)){
					minTime = tmd.mint;
					switch(minTime.split(":").length){
						case 1:
							minTime = minTime+":00:00";
							break;
						case 2:
							minTime = minTime+":00";
							break;
					}
				}
				if(!isValueEmpty(tmd.maxt) && isValidityTime(tmd.maxt)){
					maxTime = tmd.maxt;
					switch(maxTime.split(":").length){
						case 1:
							maxTime = maxTime+":00:00";
							break;
						case 2:
							maxTime = maxTime+":00";
							break;
					}
				}
				if(!isValueEmpty(tmd.alt)){
					alt = tmd.alt;
				}
			}
			alt += "不得在";
			if(isValueEmpty(chkVal)){
				chkVal = tmk.chkVal;
			}
			chkVal = chkVal.trim();
			if(!isValidityDate(chkVal)){
				return false;
			}
			var minDatet,maxDatet;
			if(chkVal.indexOf(" ") > -1){// 包含日期
				minDatet = chkVal.split(" ")[0] + " " + minTime;
				maxDatet = chkVal.split(" ")[0] + " " + maxTime;
				minAlt = alt+"["+chkVal.split(" ")[0]+" "+minTime+"]"+"之前！";
				maxAlt = alt+"["+chkVal.split(" ")[0]+" "+maxTime+"]"+"之后！";
			}else{// 纯时间
				chkVal = (new Date()).format("yyyy-MM-dd") + " " + chkVal;
				minDatet = (new Date()).format("yyyy-MM-dd") + " " + minTime;
				maxDatet = (new Date()).format("yyyy-MM-dd") + " " + maxTime;
				minAlt = alt+"["+minTime+"]"+"之前！";
				maxAlt = alt+"["+maxTime+"]"+"之后！";
			}
			if(minDatet > chkVal){
				showAlertAndFocus(minAlt,focusObj);
				return false;
			}
			if(maxDatet < chkVal){
				showAlertAndFocus(maxAlt,focusObj);
				return false;
			}
		}
	}
	return true;
}

// E-mail 格式验证
function isValidityEmail(emailValue){
	if(!isValueEmpty(emailValue)){
		emailValue = emailValue.toString().trim()
		var emailPattern = /^[a-z]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$/i;
		if(!emailPattern.test(emailValue)){
			return false;
		}
	}
	return true;
}

// 邮政编码 格式验证
function isValidityPostCode(postCode){
	if(!isValueEmpty(postCode)){
		postCode = postCode.toString().trim()
		var postCodePattern = /^[1-9]{1}\d{5}$/;
		if(!postCodePattern.test(postCode)){
			return false;
		}
	}
	return true;
}

/**
 * 大小写转换begin
 */
function toUpperCaseObj(obj){
	try{
		var src = obj; 
		if(!isValidityParam(src)){
			src = event.srcElement;
		}
		src.value = toUpperCaseValue(src.value);
	}catch(e){}
}

function toUpperCaseValue(values){
	try{
		return values.toUpperCase();
	}catch(e){}
}

function toLowerCaseObj(obj){
	try{
		var src = obj;
		if(!isValidityParam(src)){
			src = event.srcElement;
		}
		src.value = toLowerCaseValue(src.value);
	}catch(e){}
}

function toLowerCaseValue(values){
	try{
		return values.toLowerCase();
	}catch(e){}
}

/**
 * 大小写转换end
 */

//纯数字输入不包括小数点
function onlyNum(){
    if (!((event.keyCode >= 48 && event.keyCode <= 57) ||
          (event.keyCode >= 96 && event.keyCode <= 105) ||
          (event.keyCode == 8) || (event.keyCode == 9) || (event.keyCode == 13) || (event.keyCode == 46)))
    {   	
        event.returnValue = false;
    }
}

//纯数字输入包括小数点
function onlyNumAndPointer(){
	if(!((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || (event.keyCode == 110) || (event.keyCode == 8) || (event.keyCode == 46) || (event.keyCode == 37) || (event.keyCode == 39) || (event.keyCode == 190))){
		event.returnValue = false;
	}	
}

// 禁止回车 onkeydown
function forbidenEnter(){
	if(event.keyCode == 13){
		event.returnValue = false;
	}
}

/**
 * 数值类型验证begin
 * ^[1-9]\d*$　 　 //匹配正整数
 * ^-[1-9]\d*$ 　 //匹配负整数
 * ^-?[1-9]\d*$　　 //匹配整数
 * ^[1-9]\d*|0$　 //匹配非负整数（正整数 + 0）
 * ^-[1-9]\d*|0$　　 //匹配非正整数（负整数 + 0）
 * ^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$　　 //匹配正浮点数
 * ^-([1-9]\d*\.\d*|0\.\d*[1-9]\d*)$　 //匹配负浮点数
 * ^-?([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$　 //匹配浮点数
 * ^[1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0$　　 //匹配非负浮点数（正浮点数 + 0）
 * ^(-([1-9]\d*\.\d*|0\.\d*[1-9]\d*))|0?\.0+|0$　　//匹配非正浮点数（负浮点数 + 0）
 */


// 金额格式验证
function chkMoneyValidition(val,alt){
	try{
		if(!(isValidityInteger(val) || isValidityFloat(val))){
			alt = (!isValueEmpty(alt))?alt:"";
			showReloadAlert(alt+"格式化值错误，请检查！<br>1、包含中文字符<br>2、包含其他非法字符");
			return false;
		}
	}catch(e){}
	return true;
}

function chkMoneyValiditionObj(obj,alt){
	try{
		var chkv = chkMoneyValidition(obj.value,alt);
		//if(!chkv){
		//	obj.select();
		//	obj.focus();
		//}
		return chkv;
	}catch(e){}
	return true;
}

/**
 * 将数字格式化为浮点数（默认含有2位小数点）
 * add 2010-3-22
 */
function floatValueFormatBase(values,len){
	if(isValueEmpty(values)){
		values = "0";
	}
	values = values.trim();
	if(isValueEmpty(len)){
		len = 2;
	}
	if(chkMoneyValidition(values)){
		values = Math.round(values*Math.pow(10,len)) / Math.pow(10,len);
		values = values.toFixed(len);
		return values;
	}
	return false;
}

function addChineseMoneySpan(o,cm){
	if(isValidityParam(o)){
		var cMoneySpan = o.cMoneySpan;
		if(!isValidityParam(cMoneySpan)){
			cMoneySpan = document.createElement("SPAN");
			cMoneySpan.style.color = "green";
			cMoneySpan.style.fontWeight = "bold";
			o.appendChild(cMoneySpan);
			o.cMoneySpan = cMoneySpan;
		}
		cMoneySpan.innerHTML = "（"+cm+"）";
	}
	
}

function floatValueFormat(values,len,pobj){
	var bsv = floatValueFormatBase(values,len);
	var cMoney = "零元整";
	if(typeof(bsv) == "boolean" && !bsv){
		bsv = values;
	}else {
		cMoney = changeMoneyShowForCheck(bsv);
	}
	addChineseMoneySpan(pobj,cMoney);
	if(Number(bsv) == 0){
		bsv = "0.00";
	}
	return bsv;
}

function floatObjFormat(len,obj){
	try{
		if(arguments.length > 2 && arguments.length%2 == 0){
			for(var a=0;a<arguments.length/2;a++){
				arguments[2*a+1].value = floatValueFormat(arguments[2*a+1].value,arguments[2*a],arguments[2*a].parentNode)
			}
		}else{
			if(!isValidityParam(obj)){
				obj = event.srcElement;
			}
			obj.value = floatValueFormat(obj.value,len,obj.parentNode)
		}
	}catch(e){}
}

/**
 * 数值类型验证end
 */
 
function chkObjValueRealLength(aimObj,maxLength,msg){
	if(!isValidityParam(aimObj) || !isValidityParam(maxLength)){
		return false;
	}
	if(getValueRealLength(aimObj.value.trim()) > parseInt(maxLength)){
		//msg = (isValueEmpty(msg))?"输入信息内容长度超过限制（"+maxLength+"字符）":msg;
		//showAlertAndFocus(msg,aimObj);
		return false;
	}
	return true;
}
 
//判断输入字符串的实际长度（中文为2）是否超过限制长度,并限制输入
function restrictionInputLength(aimObj,maxLength){
	if(isValueEmpty(aimObj)){
		aimObj = event.srcElement;
	}
	var aimValue = aimObj.value.trim();
	if(event.keyCode != 8 && event.keyCode != 46){
		if(isValidityParam(maxLength) && isValidityInteger(maxLength)){
			var countLength = getValueRealLength(aimValue);
			if(countLength == maxLength){
				event.returnValue = false;
			}else if(countLength > maxLength){
				//showAlertAndFocus("输入信息内容长度超过限制（"+maxLength+"字符）！",aimObj);
				while(getValueRealLength(aimValue) > maxLength){
					aimValue = aimValue.substring(0,aimValue.length-1);
				}
				aimObj.value = aimValue;
				event.returnValue = false;
			}
		}
	}
}

//校验出生日期真实性（当前日期前250年出生）
function isValidityBirthday(pm){
	var msg,birth,fobj;
	if(isValidityParam(pm)){
		msg = pm.msg;
		birth = pm.birth;
		fobj = pm.fobj;
	}
	msg = !isValueEmpty(msg)?(msg+"中"):"";
	
	if(!isValidityParam(fobj)){
		fobj = event.srcElement;
	}
	if(isValidityParam(birth) || (isValidityParam(fobj) && typeof(fobj) == "object")){
		if(!isValidityParam(birth)){
			if(!isValidDateForObj(fobj)){
				return false;
			}
			birth = fobj.value.trim();
		}

		if(typeof(birth) == "string"){
			birth = new Date(birth.replace(/-/g,"/"));
		}
		var birtht = Date.parse(birth);
		var n = (new Date()).format("yyyy/MM/dd");
		n = new Date(n);
		var nt = Date.parse(new Date(n));
		if(birtht > nt || Math.abs(birth.getFullYear() - n.getFullYear()) > 250){
			if(isValidityParam(fobj)){
				showAlertAndFocus('请检查'+msg+'出生日期的真实性！',fobj);
			}else{
				showReloadAlert('请检查'+msg+'出生日期的真实性！');             
			}
			return false;
		}
	}
	return true;
}

/**
 * 身份证号码验证，可校验15位和18位，包含行政区划代码、出生日期及校验位的验证。
 */
function chkValidityIdCardNoByObj(obj){
	try{
		if(!isValidityParam(obj)){
			obj = event.srcElement;
		}
		return isValidityIdCardNo(obj);
	}catch(e){}
	return true;
} 

function isValidityIdCardNo(num) {
	var ent;
	if(typeof(num) == "object"){
		ent = num;
		num = ent.value;
	}
	if(!isValueEmpty(num)){
		num = num.trim().toUpperCase(); 
		//身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。             
		if(!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))){ 
			if(isValidityParam(ent)){
				showAlertAndFocus('请检查身份证号码长度及其有效性！<br>（15位应全为数字；18位末位可以为数字或X）',ent);
			}else{
				showReloadAlert('请检查身份证号码长度及其有效性！<br>（15位应全为数字；18位末位可以为数字或X）');
			}
			return false;          
		}
		//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
		//下面分别分析出生日期和校验位 
		var len,re,arrSplit,birthday,birthdayValid; 
		len = num.length; 
		if(len == 15){
			re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
			arrSplit = num.match(re);  
			//检查生日日期是否正确 
			birthday = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]); 
			birthdayValid = (birthday.getYear() == Number(arrSplit[2])) && ((birthday.getMonth() + 1) == Number(arrSplit[3])) && (birthday.getDate() == Number(arrSplit[4])); 
			if(!birthdayValid){
				if(isValidityParam(ent)){
					showAlertAndFocus('身份证号码中出生日期有误，请检查！',ent);
				}else{
					showReloadAlert('身份证号码中出生日期有误，请检查！');             
				}
				return false; 
			}
			return isValidityBirthday({birth:birthday,fobj:ent,msg:"身份证号码"});
		} 
		if(len == 18){ 
			re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/); 
			arrSplit = num.match(re);
			//检查生日日期是否正确 
			birthday = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]); 
			birthdayValid = (birthday.getFullYear() == Number(arrSplit[2])) && ((birthday.getMonth() + 1) == Number(arrSplit[3])) && (birthday.getDate() == Number(arrSplit[4])); 
			if(!birthdayValid){ 
				if(isValidityParam(ent)){
					showAlertAndFocus('身份证号码中出生日期有误，请检查！',ent);
				}else{
					showReloadAlert('身份证号码中出生日期有误，请检查！'); 
				}
				return false;
			}
			if(isValidityBirthday({birth:birthday,fobj:ent,msg:"身份证号码"})){
				//检验18位身份证的校验码是否正确。
				//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。 
				var valnum;
				var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
				var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
				var nTemp = 0, i;
				for(i = 0; i < 17; i ++){
					nTemp += num.substr(i,1) * arrInt[i]; 
				} 
				valnum = arrCh[nTemp % 11]; 
				if(valnum != num.substr(17,1)){ 
					if(isValidityParam(ent)){
						showAlertAndFocus('18位身份证号码的校验码不正确！应该为：'+valnum,ent);
					}else{
						showReloadAlert('18位身份证号码的校验码不正确！应该为：'+valnum); 
					}
					return false; 
				} 
				return true; 
			}else{
				return false;
			} 
		} 
	}
	return true;
}   

// 
function getAgeByBirthday(date){
	if(isValidDateForAlert(date)){
		date = date.replaceAll("-","/");
		var bdate = new Date(date);
		var now = new Date();
		var age = now.getFullYear() - bdate.getFullYear();
		var subm = now.getMonth() - bdate.getMonth();
		var age = now.getFullYear()-bdate.getFullYear()-((now.getMonth() < bdate.getMonth() || now.getMonth() == bdate.getMonth() && now.getDate() < bdate.getDate())?1:0);
		return age;
//		bdate = bdate.getTime();
//		now = now.getTime();
//		var cz = now-bdate;
//		var b = (cz / (3600 * 24 * 1000)) / 365;
//		return b
	}
	return "";
}

// 组织机构代码验证
function chkOrganizeCode(msg,obj,pt){
	try{
		if(!isValidityParam(obj)){
			obj = event.srcElement;
		}
		if(!isValueEmpty(obj.value)){
			if(isValueEmpty(pt)){
//				pt = "(^\\d{8}\\-\\d{1}?$)";
				pt="(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]{1}?$)";
			}
			pt = new RegExp(pt);
			if(!pt.test(obj.value.trim())){
				showAlertAndFocus(msg,obj);
				return false;
			}
		}
	}catch(e){}
	return true;
}

/**
 * 去空格
 * @param {Object} str
 */
function trim(str) {
    var newStr = str.replace(/(^\s*)|(\s*$)/g,'');
    return  newStr;
}