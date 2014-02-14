<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table>
	<input type="hidden" name="supplierEvt.id" id="supplierId" value="${supplierEvt.id }" />
	<tr>
		<td><label for="name">供货商名称</label></td>
		<td><input type="text" name="supplierEvt.name" id="supplierName" class="text ui-widget-content ui-corner-all" value="${supplierEvt.name }" /></td>
		<td><label for="address">地址</label></td>
		<td><input type="text" name="supplierEvt.address" id="supplierAddress" class="text ui-widget-content ui-corner-all" value="${supplierEvt.address }" /></td>
	</tr>
	<tr>
		<td><label for="account">银行账户</label></td>
		<td><input type="text" name="supplierEvt.account" id="supplierAccount" class="text ui-widget-content ui-corner-all" value="${supplierEvt.account }" /></td>
		<td><label for="taxNumber">税号</label></td>
		<td><input type="text" name="supplierEvt.taxNumber" id="supplierTaxNumber" class="text ui-widget-content ui-corner-all" value="${supplierEvt.taxNumber }" /></td>
	</tr>
	<tr>
		<td><label for="bank">开户银行</label></td>
		<td colspan="3"><input type="text" name="supplierEvt.bank" id="supplierBank" class="text ui-widget-content ui-corner-all" value="${supplierEvt.bank }" /></td>
	</tr>
	<tr>
		<td><label for="details">详细信息</label></td>
		<td colspan="3"><textarea name="supplierEvt.details" id="supplierDetails" class="text ui-widget-content ui-corner-all" cols="93" rows="5">${supplierEvt.details }</textarea></td>
	</tr>
	<tr>
		<td><label for="category">主营商品类别</label></td>
		<td colspan="3"><input type="text" name="supplierEvt.category" id="supplierCategory" class="text ui-widget-content ui-corner-all" value="${supplierEvt.category }" /></td>
	</tr>
	<tr>
		<td><label for="url">网址URL</label></td>
		<td colspan="3"><input type="text" name="supplierEvt.url" id="supplierUrl" class="text ui-widget-content ui-corner-all" value="${supplierEvt.url }" /></td>
	</tr>
	<tr>
		<td><label for="person">联系人</label></td>
		<td><input type="text" name="supplierEvt.person" id="supplierPerson" class="text ui-widget-content ui-corner-all" value="${supplierEvt.person }" /></td>
		<td><label for="sex">性别</label></td>
		<td>
			<s:if test='supplierEvt.sex=="2"'>
				<table>
					<tr>
						<td width="10px" style="border:0px solid;">男</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="supplierSex1" name="supplierEvt.sex" value="1" /></td>
						<td width="10px" style="border:0px solid;">女</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="supplierSex2" name="supplierEvt.sex" checked="checked" value="2" /></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
					</tr>
				</table>
			</s:if>
			<s:else>
				<table>
					<tr>
						<td width="10px" style="border:0px solid;">男</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="supplierSex1" name="supplierEvt.sex" checked="checked" value="1" /></td>
						<td width="10px" style="border:0px solid;">女</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="supplierSex2" name="supplierEvt.sex" value="2" /></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
					</tr>
				</table>
			</s:else>
		</td>
	</tr>
	<tr>
		<td><label for="age">年龄</label></td>
		<td><input type="text" name="supplierEvt.age" id="supplierAge" class="text ui-widget-content ui-corner-all" value="${supplierEvt.age }" /></td>
		<td><label for="email">邮箱</label></td>
		<td colspan="5"><input type="text" name="supplierEvt.email" id="supplierEmail" class="text ui-widget-content ui-corner-all" value="${supplierEvt.email }" /></td>
	</tr>
	<tr>
		<td><label for="mobile">手机</label></td>
		<td><input type="text" name="supplierEvt.mobile" id="supplierMobile" class="text ui-widget-content ui-corner-all" value="${supplierEvt.mobile }" /></td>
		<td><label for="tel">电话</label></td>
		<td><input type="text" name="supplierEvt.tel" id="supplierTel" class="text ui-widget-content ui-corner-all" value="${supplierEvt.tel }" /></td>
	</tr>
	<tr>
		<td><label for="fax">传真</label></td>
		<td><input type="text" name="supplierEvt.fax" id="supplierFax" class="text ui-widget-content ui-corner-all" value="${supplierEvt.fax }" /></td>
		<td><label for="qq">QQ</label></td>
		<td><input type="text" name="supplierEvt.qq" id="supplierQq" class="text ui-widget-content ui-corner-all" value="${supplierEvt.qq }" /></td>
	</tr>
	<tr>
		<td><label for="alww">阿里旺旺</label></td>
		<td><input type="text" name="supplierEvt.alww" id="supplierAlww" class="text ui-widget-content ui-corner-all" value="${supplierEvt.alww }" /></td>
		<td><label for="msn">MSN</label></td>
		<td><input type="text" name="supplierEvt.msn" id="supplierMsn" class="text ui-widget-content ui-corner-all" value="${supplierEvt.msn }" /></td>
	</tr>
	<tr>
		<td><label for="remark">备注</label></td>
		<td colspan="3"><textarea name="supplierEvt.remark" id="supplierRemark" class="text ui-widget-content ui-corner-all" cols="93" rows="5">${supplierEvt.remark }</textarea></td>
	</tr>
</table>
<script type="text/javascript">
</script>