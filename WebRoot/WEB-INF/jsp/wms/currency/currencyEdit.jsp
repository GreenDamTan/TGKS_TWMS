<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="currencyEvt.id" id="currencyId" value="${currencyEvt.id }" />
<table>
	<tr>
		<td><label>名称</label></td>
		<td><input type="text" name="currencyEvt.name" id="currencyName" class="text ui-widget-content ui-corner-all" value="${currencyEvt.name }" /></td>
		<td><label>币种</label></td>
		<td><input type="text" name="currencyEvt.type" id="currencyTpye" class="text ui-widget-content ui-corner-all" value="${currencyEvt.type }" /></td>
	</tr>
	<tr>
		<td><label>缩写</label></td>
		<td><input type="text" name="currencyEvt.code" id="currencyCode" class="text ui-widget-content ui-corner-all" value="${currencyEvt.code }" /></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td><label>数量</label></td>
		<td>${currencyEvt.num }</td>
		<td><label>单位</label></td>
		<td><input type="text" name="currencyEvt.unit" id="currencyUnit" class="text ui-widget-content ui-corner-all" value="${currencyEvt.unit }" /></td>
	</tr>
	<tr>
		<td><label>备注</label></td>
		<td colspan="3"><textarea name="currencyEvt.remark" id="currencyRemark" class="text ui-widget-content ui-corner-all" cols="105" rows="5">${currencyEvt.remark }</textarea></td>
	</tr>
</table>
<script type="text/javascript">
</script>