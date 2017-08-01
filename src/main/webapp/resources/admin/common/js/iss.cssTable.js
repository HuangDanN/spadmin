/**
 * iss.cssTable.js
 * @author chenld_fzu@163.com
 */
(function($){
	$.fn.extend({
		cssTable: function(options){
			
			/** ��ʼ���б��� */
			return this.each(function(){
				
				var $this = $(this);
				var $trs = $this.find('tbody>tr');
				
				$trs.hoverClass("hover").each(function(index_1_){
					var $tr = $(this);
					
					$tr.click(function(){
						$trs.filter(".selected").removeClass("selected");
						$tr.addClass("selected");
						
					});
				});
					
			
			});
		},//end cssTable~~~
		
		/** ����table�߶� */
		resetFixTableHeight: function(){
			
			return this.each(function(index){
				
				var $bodyBoxList = $("div.body-box-list");
				var $queryForm = $bodyBoxList.find("div.query-form"); //��ѯ�?

				var $pageContent = $bodyBoxList.find("div.pageContent"); //��ѯ���ݲ�[��������/��ҳ����/�б��]
				var $panelBar = $pageContent.find("div.panelBar"); 
				var $pagebar = $pageContent.find("div.pagebar"); 
				var $contentList = $pageContent.find("div.content-list");
				var $table = $pageContent.find("table");
				
					$contentList.height($table.height());
					$pageContent.height($panelBar.height() + $pagebar.height() + $contentList.height());
					$bodyBoxList.height($pageContent.height() + $queryForm.height());
					
					
					//$bodyBoxList.css("overflow", "hidden");
					
					//alert("bodyHie:"  +$bodyBoxList.height() + " clientHieght:" + $.clientHeight())
					
				if($bodyBoxList.height() < $.clientHeight() ){
					$bodyBoxList.height($.clientHeight() - 4);
					
					$pageContent.height($bodyBoxList.height() - $queryForm.height());
					//�����б��߶�
					$contentList.height($pageContent.height() - $panelBar.height() - $pagebar.height() - 2 );
				}
				

			});

		}//end resetTableHeight~~~

	});
})(jQuery);


