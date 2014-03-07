<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="currencyDetailEvt.id" id="currencyDetailId" value="${currencyDetailEvt.id }" />
<table>
	<tr>
		<td><label>名称</label></td>
		<td><input type="text" name="currencyDetailEvt.name" id="currencyName" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.name }" /></td>
		<td><label>币种</label></td>
		<td><input type="text" name="currencyDetailEvt.type" id="currencyTpye" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.type }" /></td>
	</tr>
	<tr>
		<td><label>缩写</label></td>
		<td><input type="text" name="currencyDetailEvt.code" id="currencyCode" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.code }" /></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td><label>数量</label></td>
		<td>${currencyDetailEvt.num }</td>
		<td><label>单位</label></td>
		<td><input type="text" name="currencyDetailEvt.unit" id="currencyUnit" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.unit }" /></td>
	</tr>
	<tr>
		<td><label>订单ID</label></td>
		<td><input type="text" name="currencyDetailEvt.orderId" id="currencyOrderId" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.orderId }" /></td>
		<td><label>订单编号</label></td>
		<td><input type="text" name="currencyDetailEvt.orderOrderId" id="currencyOrderOrderId" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.orderOrderId }" /></td>
	</tr>
	<tr>
		<td><label>交易ID</label></td>
		<td><input type="text" name="currencyDetailEvt.dealId" id="currencyDealId" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.dealId }" /></td>
		<td><label>创建时间</label></td>
		<td><s:date name="#currencyDetailEvt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
	<tr>
		<td><label>备注</label></td>
		<td colspan="3"><textarea name="currencyDetailEvt.remark" id="currencyRemark" class="text ui-widget-content ui-corner-all" cols="105" rows="5">${currencyDetailEvt.remark }</textarea></td>
	</tr>
</table>
<script type="text/javascript">
</script>