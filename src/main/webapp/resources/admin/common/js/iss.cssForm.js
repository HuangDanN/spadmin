/**
 * iss.cssTable.js
 * @author chenld_fzu@163.com
 */
(function($){
	$.fn.extend({
		cssForm: function(options){
			/** 初始化列表行 **/
			return this.each(function(){
				var $this = $(this);

				/**设置列表自适应高度**/
				/**
				var $contentForm = $this.parent("div.edit-form").parent("div.content-form");
				var $bodyBox = $contentForm.parent("div.body-box");
				var $panelBar = $contentForm.find("div.panelBar"); 
				var $editForm = $contentForm.find("div.edit-form"); 

				$bodyBox.height($.clientHeight());
				$contentForm.height($bodyBox.height());
				$contentForm.width($bodyBox.width());

				$editForm.height($contentForm.height() - $panelBar.height() );
				*/

				$(window.document.body).css("overflow", "scroll").css("overflow-x", "hidden");
			});
		}
	});
})(jQuery);
