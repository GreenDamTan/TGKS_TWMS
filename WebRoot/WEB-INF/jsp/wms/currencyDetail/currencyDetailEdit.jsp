<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="currencyDetailEvt.id" id="currencyDetailId" value="${currencyDetailEvt.id }" />
<table>
	<tr>
		<td><label for="name">currencyDetail</label></td>
		<td><input type="text" name="currencyDetailEvt.name" id="currencyDetailName" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.name }" /></td>
	</tr>
</table>
<script type="text/javascript">
</script>