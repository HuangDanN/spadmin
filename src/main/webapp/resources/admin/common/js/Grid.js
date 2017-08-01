var grid = {};

var Grid = function(conf){
	grid=this;
	
	this.bodyBoxDivId = conf.bodyBoxDivId || "bodyBoxDiv";
	this.queryFromId = conf.queryFromId || "page_form";  
	this.gridTableId = conf.gridTableId || "gridTable";
	this.panelBarId = conf.panelBarId || "panelBarDiv";
	
	//用户清空表单方法
	this.userClearFun = conf.userClearFun;
	//用户验证方法
	this.userValidate = conf.userValidate;
	
	this.beforePage = conf.beforePage;
	
	this.beforeSearch = conf.beforeSearch;
	
	this.beforeLoadPage = conf.beforeLoadPage;
	
	this.afterLoadPage = conf.afterLoadPage;
	
	this.init();
};

Grid.prototype={
	init : function(){
		this._doQueryMore($("#queryMoreFlag").val());
		this._cssTable();
		this._fixTable();
		this._pageBar();
		this._panelBar();
		this._titleTh();
		this.validate();
		this._initBindEvent();
		if($.isFunction(this.afterLoadPage)){
			this.afterLoadPage(this);
		}
	},
	
	_cssTable : function(){
		var trs = $("#"+this.gridTableId).find('tbody>tr');
		trs.hoverClass("hover").each(function(){
			$(this).click(function(){
				trs.filter(".selected").removeClass("selected");
				$(this).addClass("selected");
			});
		});
	},
	
	_fixTable : function() {
		var bodyBoxDiv = $("#"+this.bodyBoxDivId);
		var gridTable = $("#"+this.gridTableId);
		var panelBar = $("#"+this.panelBarId);
		var pageBar = $("#pageBar");
		
		var queryFromDiv = bodyBoxDiv.find("div.query-form");
		var pageContent = bodyBoxDiv.find("div.pageContent");
		var contentList = bodyBoxDiv.find("div.content-list");
		contentList.height(gridTable.height());
		//2013-01-08 最后一条记录被覆盖
		if(parseInt(gridTable.css("width"))-parseInt(gridTable.parent().css("width"))>0){
			contentList.height(parseInt(contentList.height())+23);
		}
		
		pageContent.height(panelBar.height() + pageBar.height() + contentList.height());
		bodyBoxDiv.height(pageContent.height() + queryFromDiv.height());
		//分页栏浮动
		
		if (!($.browser.msie && $.browser.version == "6.0")) {
			pageBar.css({"position":"fixed", "left":0, "bottom":0, "z-index":9999});
		}else{
			pageBar.css({"position":"absolute", "left":0, "bottom":0, "z-index":9999});
		}
		
		if(bodyBoxDiv.height() < $.clientHeight() ){
			bodyBoxDiv.height($.clientHeight() - 4);
			pageContent.height(bodyBoxDiv.height() - queryFromDiv.height());
			contentList.height(pageContent.height() - panelBar.height() - pageBar.height() - 2 );
		}
	},
	
	_pageBar : function(){
		$("#pageBar").find("ul>li[name = 'page-li-click']").hoverClass("page_hover");
	},
	
	_panelBar : function(){
		$("#"+this.panelBarId).find("ul>li[class != 'line']").hoverClass("hover");
	},
	
	_titleTh : function(){
		var gridTable = $("#"+this.gridTableId);
		gridTable.find("th").each(function(i){
			if(i>1){
				this.title = $.trim($(this).html());
			}
		});
	},
	
	_initBindEvent : function(){
		$("#jump_page_input").keydown(function(event){
			if(event.keyCode == 13){
				grid.goPage($('#jump_page_input').val());
			}
		});
		
		$("#page_size").change(function(){
			grid.goPage(1);
		});
		
		$("#page_form input[type='text']").keydown(function(event){
			if(event.keyCode == 13){
				grid.search();
			}
		});
	},
	
	checkAll : function(){
		$("#"+this.gridTableId).find("input[type='checkbox']").each(function(){
			this.checked = $("#ck_all").attr("checked");
		});
	},
	
	clearForm : function(){
		var queryForm = $("#"+this.queryFromId);
		queryForm.find("input[type='text']").val('');
		queryForm.find("select").each(function(){
			if($.trim(this.options[0].value) == ""){
				$(this).val("");
			}
			//当选项第一个的值为N时选中该选项
			if($.trim(this.options[0].value) == "N"){
				$(this).val("N");
			}
			//当选项第一个的值为Y时选中该选项
			if($.trim(this.options[0].value) == "1"){
				$(this).val("1");
			}
			if($.trim(this.options[1].value) == "2"){
				$(this).val("2");
			}
		});
		
		var clearButs = queryForm.find("a[class='i-btn-clear']");
		
		if(clearButs.length > 0){
			var butName = "";
			clearButs.each(function(){
				butName = $(this).next().attr("id");
				eval("clear_"+butName+"()");
			});
		}
		
		if($.isFunction(this.userClearFun)){
			this.userClearFun();
		}
		queryForm.valid();
	},
	
	validate : function(){
		if($.isFunction(this.userValidate)){
			this.userValidate();
		}else{
			var queryForm = $("#"+this.queryFromId);
			queryForm.validate({});
			
			queryForm.find("input[type='text']").each(function(){
				if(this.id == null || this.id == ""){
					this.id = this.name;
				}
				$("#"+this.id).attr("maxLength",100);
				$("#"+this.id).rules("add",{maxlength: 100,"validIllegalChar":true});
			});
		}
	},
	
	queryMore : function(flag){
		this._doQueryMore(flag);
		this.reload();
	},
	
	_doQueryMore : function(flag){
		var trs = $("#"+this.queryFromId).find("tbody>tr");
		var len = trs.length;
		if(len > 6){				//  Modify By ChenDewei @ 2013/08/13     搜索条件行数显示(原始为：3)
			//显示查询层
			if(flag == "open"){
				$("#queryMoreFlag").val('open');
				
					trs.each(function(i){
						if(i > 1 && i < (len-1)){
							$(this).show();
							$(this).find("td").show();
						}
					});
				$("#open-query-more").hide();
				$("#close-query-more").show();
			}else{
				$("#queryMoreFlag").val('close');
					trs.each(function(i){
						if(i > 1 && i < (len-1)){
							$(this).hide();
							$(this).find("td").hide();
						}
					});
				$("#open-query-more").show();
				$("#close-query-more").hide();
			}
		}else{
			$("#open-query-more").hide();
			$("#close-query-more").hide();
		}
	},
	
	search : function(){
		if($.isFunction(this.beforeSearch)){
			this.beforeSearch();
		}
		this.loadPage(1);
	},
	
	goPage : function(pageNo){
		if($.isFunction(this.beforePage)){
			this.beforePage();
		}
		this.loadPage(pageNo);
	},
	
	loadPage : function(pageNo){
		if($.isFunction(this.beforeLoadPage)){
			this.beforeLoadPage();
		}
		
		if(!$("#"+this.queryFromId).valid()) {return false;}
		
		var pageBar = $("#pageBar");
		if(typeof(pageNo) == "undefined" || Number(pageNo) == 'NaN'|| pageNo < 1){
			pageNo = 1;
		}else{
			var totalPage = parseInt(pageBar.attr('totalPages'));
			if(pageNo > totalPage){
				pageNo = totalPage;
			}
		}

		//设置每页数
		var pageSize = $("#page_size").val();
		if(pageSize < 1 || pageSize > 100)
			pageSize = 20;
		
		$("#pageNo").val(pageNo);
		$("#pageSize").val(pageSize);
		
		document.getElementById(this.queryFromId).submit();;
	},
	
	reload : function(){
		this.goPage($("#pageBar").attr("pageNo"));
	},
	
	
//-----------------------------------------------------------------------------

	getSelectElements : function(){
		var chkArr = [];
		$("#"+this.gridTableId).find("tbody input[type='checkbox']").each(function(){
			if(this.checked){
				chkArr.push(this);
			}
		});
		return chkArr;
	},
	
	getSelectIds : function(){
		var chkArr = this.getSelectElements();
		var idArr = [];
		for(var i=0; i<chkArr.length; i++){
			idArr.push(chkArr[i].value);
		}
		return idArr;
	},
	
	getSelectAttrs : function(attr){
		var attrArr = [];
		$("#"+this.gridTableId).find("tbody input[type='checkbox']").each(function(){
			if(this.checked){
				attrArr.push($(this).attr(attr));
			}
		});
		return attrArr;
	},
	
	getSelectLineNum : function(){
		var numArr = [];
		$("#"+this.gridTableId).find("tbody input[type='checkbox']").each(function(){
			if(this.checked){
				numArr.push($(this).parent().prev().html());
			}
		});
		return numArr;
	}
	
	//单元格合并功能
	
};
