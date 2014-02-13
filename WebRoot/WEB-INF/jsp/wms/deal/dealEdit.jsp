<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table>
	<input type="hidden" name="dealEvt.id" id="dealId" value="${dealEvt.id }" />
	<input type="hidden" name="dealEvt.status" id="orderId" value="${dealEvt.status }" />
	<tr>
		<td><label for="commodityId">商品ID</label></td>
		<td><input type="text" name="dealEvt.commodityId" id="dealCommodityId" class="text ui-widget-content ui-corner-all" value="${dealEvt.commodityId }"/></td>
	</tr>
	<tr>
		<td><label for="commodityName">商品名称</label></td>
		<td><input type="text" name="dealEvt.commodityName" id="dealCommodityName" class="text ui-widget-content ui-corner-all" value="${dealEvt.commodityName }"/></td>
	</tr>
	<tr>
		<td><label for="orderId">订单号</label></td>
		<td><input type="text" name="dealEvt.orderId" id="dealOrderId" class="text ui-widget-content ui-corner-all" value="${dealEvt.orderId }" readonly="readonly" /></td>
	</tr>
	<tr>
		<td><label for="status">交易状态</label></td>
		<td>
			<s:if test="dealEvt.status == 0">
				未付款
			</s:if>
			<s:elseif test="dealEvt.status == 1">
				已付款
			</s:elseif> 
		</td>
	</tr>
	<tr>
		<td><label for="type">交易类型</label></td>
		<td>
			<table>
				<tr>
					<s:if test='dealEvt.type=="0"'>
					<td width="30px" style="border:0px solid;">购入</td>
					<td width="10px" style="border:0px solid;"><input type="radio" name="dealEvt.type" id="dealType1" checked="checked" value="0" /></td>
					</s:if>
					<s:elseif test='dealEvt.type=="1"'>
						<td width="30px" style="border:0px solid;">售出</td>
						<td width="10px" style="border:0px solid;"><input type="radio" name="dealEvt.type" id="dealType2" checked="checked" value="1" /></td>
					</s:elseif>
					<td style="border:0px solid;"></td>
					<td style="border:0px solid;"></td>
					<td style="border:0px solid;"></td>
					<td style="border:0px solid;"></td>
					<td style="border:0px solid;"></td>
					<td style="border:0px solid;"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><label for="number">交易数量</label></td>
		<td><input type="text" name="dealEvt.number" id="dealNumber" class="text ui-widget-content ui-corner-all" value="${dealEvt.number }" /></td>
	</tr>
	<tr>
		<td><label for="price">交易价格</label></td>
		<td><input type="text" name="dealEvt.price" id="dealPrice" class="text ui-widget-content ui-corner-all" value="${dealEvt.price }" /></td>
	</tr>
	<tr>
		<td><label for="createTime">创建时间</label></td>
		<td><s:date name="dealEvt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
	<tr>
		<td><label for="dealTime">付款时间</label></td>
		<td><s:date name="dealEvt.dealTime" format="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
	<tr>
		<td><label for="remark">备注</label></td>
		<td><textarea name="dealEvt.remark" id="dealRemark" class="text ui-widget-content ui-corner-all" cols="97" rows="5">${dealEvt.remark }</textarea></td>
	</tr>
</table>
<script type="text/javascript">
</script>