var toolBar={};

var ToolBar = function(conf){
	toolBar = this;
	
	this.panelBarId = conf.panelBarId || 'panelBarDiv';
	this.items = conf.items || [];
	
	//生成工具栏后回调事件
	this.onBulid = conf.onBulid;
	this.init();
};

ToolBar.prototype={
	
	init : function(){
		if(this.items.length > 0){
			this._bulidHtml();
		}
		this._panelBar();
	},
	
	_bulidHtml : function(){
		var panelBar = $("#"+this.panelBarId);
		if (!($.browser.msie && $.browser.version == "6.0")) {
			panelBar.css({'position':'fixed', 'top':0, 'left':0, 'z-index':9999, 'width':'100%'});
			if($("#_fill_div_").length < 1){
				panelBar.after("<div id='_fill_div_' style='height:24px;'></div>");
			}
		}
		
		var html = [];
		html.push("<ul>");
		for(var i=0; i<this.items.length; i++){
			if(this.items[i] !== null && typeof(this.items[i].id) != "undefined"){
				html.push(this._itemHtml(this.items[i],i,true));
			}
		}
		html.push("</ul>");
		html.push("<div class=clear_float></div>");
		panelBar.html(html.join(''));
		if($.isFunction(this.onBulid)){
			this.onBulid();
		}
	},
	
	_itemHtml : function(butConf,i,showSep){
		var en = butConf.enable===false?false:true;
		var html = [];
		if(en){
			html.push("<li><a id=");
			html.push(butConf.id);
			html.push(" onclick="+butConf.func+" class=");
			html.push(butConf.className);
			html.push(" ><span>");
			html.push(butConf.text+"</span></a>");
		}else{
			html.push("<li enable=false><span style='cursor:default;padding-left:20px;padding-right:5px;color:#778899;'>");
			html.push(butConf.text+"</span>");
		}
		html.push("</li>");
		return html.join('');
	},
	
	_panelBar : function(){
		$("#"+this.panelBarId).find("ul>li[enable != 'false' ]").hoverClass("hover");
	},
	
	addBut : function(butConf,index){
		if(Number(index) === "NaN" || index>=this.items.length || index<0){
			this.items.push(butConf);
		}else{
			this.items.splice(index,0,butConf);
		}
		this.init();
	},
	
	enableBut : function(arg){
		var butConf;
		if($.isArray(arg)){
			for(var i=0; i<arg.length; i++){
				butConf = this.getButConf(arg[i]);
				if(butConf){
					butConf.enable = true;
				}
			}
		}else{
			butConf = this.getButConf(arg);
			if(butConf){
				butConf.enable = true;
			}
		}
		this.init();
	},
	
	disableBut : function(arg){
		var butConf;
		if($.isArray(arg)){
			for(var i=0; i<arg.length; i++){
				butConf = this.getButConf(arg[i]);
				if(butConf){
					butConf.enable = false;
				}
			}
		}else{
			butConf = this.getButConf(arg);
			if(butConf){
				butConf.enable = false;
			}
		}
		this.init();
	},
	
	setButAction : function(id,func){
		var butConf = this.getButConf(id);
		if(butConf === null){
			return ;
		}
		butConf.func=func;
		this.init();
	},
	
	removeBut : function(id){
		for(var i=0; i<this.items.length; i++){
			if(this.items[i].id == id){
				this.items.splice(i,1);
				return ;
			}
		}
	},
	
	getButConf: function(id){
		for(var i=0; i<this.items.length; i++){
			if(this.items[i].id == id){
				return this.items[i];
			}
		}
		return null;
	}
};
