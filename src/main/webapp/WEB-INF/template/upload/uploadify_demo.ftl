<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<title></title>
<#include "../common/include.ftl">
</head>
<body style="font-size: 12px;"><form action="" method="post" id="dataForm" enctype="multipart/form-data">
<table cellspacing="0" cellpadding="0" width="100%">
					<col  width="10%" />
					<col  width="40%"/>
					<col  width="10%"/>
					<col  width="40%"/>
					<tbody>
						<tr>
							<td class="td-label" >图片</td>
							<td class="td-value" colspan="3">
								<@yirong.image id="maxImage" dirName="test" replaceImage="true" delLogic="false" saveWay="DISK"></@yirong.image>
							</td>
						</tr>
						<tr>
							<td class="td-label" >附件</td>
							<td class="td-value" colspan="3">
								<@yirong.file id="ff" dirName="test" ></@yirong.file>
							</td>
						</tr>
					</tbody>
				</table></form>
</body>
</html>