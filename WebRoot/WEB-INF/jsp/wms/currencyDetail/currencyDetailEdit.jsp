<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<input type="hidden" name="currencyDetailEvt.id" id="currencyDetailId" value="${currencyDetailEvt.id }" />
<table>
	<tr>
		<td><label>名称</label></td>
		<td><input type="text" name="currencyDetailEvt.name" id="currencyName" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.name }" readonly="readonly" /></td>
		<td><label>币种</label></td>
		<td><input type="text" name="currencyDetailEvt.type" id="currencyTpye" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.type }" readonly="readonly" /></td>
	</tr>
	<tr>
		<td><label>缩写</label></td>
		<td><input type="text" name="currencyDetailEvt.code" id="currencyCode" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.code }" readonly="readonly" /></td>
		<td>流向</td>
		<td>
			<s:if test="currencyDetailEvt.direction == 0">
				流入
			</s:if>
			<s:elseif test="currencyDetailEvt.direction == 1">
				流出
			</s:elseif>
		</td>
	</tr>
	<tr>
		<td><label>数量</label></td>
		<td>${currencyDetailEvt.num }</td>
		<td><label>单位</label></td>
		<td><input type="text" name="currencyDetailEvt.unit" id="currencyUnit" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.unit }" readonly="readonly" /></td>
	</tr>
	<tr>
		<td><label>订单ID</label></td>
		<td><input type="text" name="currencyDetailEvt.orderId" id="currencyOrderId" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.orderId }" readonly="readonly" /></td>
		<td><label>订单编号</label></td>
		<td><input type="text" name="currencyDetailEvt.orderCode" id="currencyOrderCode" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.orderCode }" readonly="readonly" /></td>
	</tr>
	<tr>
		<td><label>交易ID</label></td>
		<td><input type="text" name="currencyDetailEvt.dealId" id="currencyDealId" class="text ui-widget-content ui-corner-all" value="${currencyDetailEvt.dealId }" readonly="readonly" /></td>
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