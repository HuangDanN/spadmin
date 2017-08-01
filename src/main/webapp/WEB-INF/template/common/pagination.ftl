<div class="pagebar" id="pageBar" pageNo="${pageInfo.currentPage}" totalPages="${pageInfo.totalPage }" totalCount="${pageInfo.totalRows }" >
	<div class="pages">
		<span>第[&nbsp;<font color="#e05b02">${pageInfo.currentPage}</font>&nbsp;]页 &nbsp;&nbsp;共[&nbsp;<font color="#e05b02">${pageInfo.totalRows }</font>&nbsp;]条&nbsp;&nbsp; 共[&nbsp;<font color="#e05b02">${pageInfo.totalPage }</font>&nbsp;]页&nbsp;&nbsp;&nbsp;&nbsp;每页
		<select id="page_size" style="width:50px;">
			<option value="10"<#if pageInfo.pageSize==10 >selected="selected"</#if>  >10</option>
			<option value="20" <#if pageInfo.pageSize==20 >selected="selected"</#if>  >20</option>
			<option value="30" <#if pageInfo.pageSize==30 >selected="selected"</#if> >30</option>
			<option value="50" <#if pageInfo.pageSize==50 >selected="selected"</#if> >50</option>
			<option value="100" <#if pageInfo.pageSize==100 >selected="selected"</#if> >100</option>
		</select>条
		</span>
	</div>
	<div class="pagination">
		<ul>
			<li class="j-first" >
				<a class="first" <#if pageInfo.currentPage ==1>disabled="disabled"<#else>onclick="grid.goPage(1); return false;"</#if> >
					<span>首页</span>
				</a>
			</li>
			<li class="j-prev" name="page-li-click">
				<a class="previous" <#if pageInfo.currentPage!=1>onclick="grid.goPage(${pageInfo.currentPage -1 }); return false;"<#else>disabled="disabled"</#if>  >
					<span>上一页</span>
				</a>
			</li>

			<li class="j-next" name="page-li-click">
				<a class="next" <#if pageInfo.currentPage!=pageInfo.totalPage>onclick="grid.goPage(${pageInfo.currentPage +1}); return false;"<#else>disabled="disabled"</#if> >
					<span>下一页</span>
				</a>
			</li>

			<li class="j-last" name="page-li-click">
				<a class="last" <#if pageInfo.currentPage==pageInfo.totalPage>disabled="disabled"<#else>onclick="grid.goPage(${pageInfo.totalRows }); return false;" </#if>  >
					<span>末页</span>
				</a>
			</li>
		</ul>
	</div>
</div>
