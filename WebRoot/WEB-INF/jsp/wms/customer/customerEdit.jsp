<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table>
	<input type="hidden" name="customerEvt.id" id="customerId" value="${customerEvt.id }" />
	<tr>
		<td><label for="name">客户名称</label></td>
		<td><input type="text" name="customerEvt.name" id="customerName" class="text ui-widget-content ui-corner-all" value="${customerEvt.name }" /></td>
		<td><label for="address">地址</label></td>
		<td><input type="text" name="customerEvt.address" id="customerAddress" class="text ui-widget-content ui-corner-all" value="${customerEvt.address }" /></td>
	</tr>
	<tr>
		<td><label for="account">银行账户</label></td>
		<td><input type="text" name="customerEvt.account" id="customerAccount" class="text ui-widget-content ui-corner-all" value="${customerEvt.account }" /></td>
		<td><label for="taxNumber">税号</label></td>
		<td><input type="text" name="customerEvt.taxNumber" id="customerTaxNumber" class="text ui-widget-content ui-corner-all" value="${customerEvt.taxNumber }" /></td>
	</tr>
	<tr>
		<td><label for="bank">开户银行</label></td>
		<td colspan="3"><input type="text" name="customerEvt.bank" id="customerBank" class="text ui-widget-content ui-corner-all" value="${customerEvt.bank }" /></td>
	</tr>
	<tr>
		<td><label for="details">详细信息</label></td>
		<td colspan="3"><textarea name="customerEvt.details" id="customerDetails" class="text ui-widget-content ui-corner-all" cols="93" rows="5">${customerEvt.details }</textarea></td>
	</tr>
	<tr>
		<td><label for="category">主营商品类别</label></td>
		<td colspan="3"><input type="text" name="customerEvt.category" id="customerCategory" class="text ui-widget-content ui-corner-all" value="${customerEvt.category }" /></td>
	</tr>
	<tr>
		<td><label for="url">网址URL</label></td>
		<td colspan="3"><input type="text" name="customerEvt.url" id="customerUrl" class="text ui-widget-content ui-corner-all" value="${customerEvt.url }" /></td>
	</tr>
	<tr>
		<td><label for="person">联系人</label></td>
		<td><input type="text" name="customerEvt.person" id="customerPerson" class="text ui-widget-content ui-corner-all" value="${customerEvt.person }" /></td>
		<td><label for="sex">性别</label></td>
		<td>
			<s:if test='customerEvt.sex=="2"'>
				<table>
					<tr>
						<td width="10px" style="border:0px solid;">男</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="customerSex1" name="customerEvt.sex" value="1" /></td>
						<td width="10px" style="border:0px solid;">女</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="customerSex2" name="customerEvt.sex" checked="checked" value="2" /></td>
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
						<td width="10px" style="border:0px solid;"><input type="radio" id="customerSex1" name="customerEvt.sex" checked="checked" value="1" /></td>
						<td width="10px" style="border:0px solid;">女</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="customerSex2" name="customerEvt.sex" value="2" /></td>
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
		<td><input type="text" name="customerEvt.age" id="customerAge" class="text ui-widget-content ui-corner-all" value="${customerEvt.age }" /></td>
		<td><label for="email">邮箱</label></td>
		<td colspan="5"><input type="text" name="customerEvt.email" id="customerEmail" class="text ui-widget-content ui-corner-all" value="${customerEvt.email }" /></td>
	</tr>
	<tr>
		<td><label for="mobile">手机</label></td>
		<td><input type="text" name="customerEvt.mobile" id="customerMobile" class="text ui-widget-content ui-corner-all" value="${customerEvt.mobile }" /></td>
		<td><label for="tel">电话</label></td>
		<td><input type="text" name="customerEvt.tel" id="customerTel" class="text ui-widget-content ui-corner-all" value="${customerEvt.tel }" /></td>
	</tr>
	<tr>
		<td><label for="fax">传真</label></td>
		<td><input type="text" name="customerEvt.fax" id="customerFax" class="text ui-widget-content ui-corner-all" value="${customerEvt.fax }" /></td>
		<td><label for="qq">QQ</label></td>
		<td><input type="text" name="customerEvt.qq" id="customerQq" class="text ui-widget-content ui-corner-all" value="${customerEvt.qq }" /></td>
	</tr>
	<tr>
		<td><label for="alww">阿里旺旺</label></td>
		<td><input type="text" name="customerEvt.alww" id="customerAlww" class="text ui-widget-content ui-corner-all" value="${customerEvt.alww }" /></td>
		<td><label for="msn">MSN</label></td>
		<td><input type="text" name="customerEvt.msn" id="customerMsn" class="text ui-widget-content ui-corner-all" value="${customerEvt.msn }" /></td>
	</tr>
	<tr>
		<td><label for="remark">备注</label></td>
		<td colspan="3"><textarea name="customerEvt.remark" id="customerRemark" class="text ui-widget-content ui-corner-all" cols="93" rows="5">${customerEvt.remark }</textarea></td>
	</tr>
</table>
<script type="text/javascript">
</script>