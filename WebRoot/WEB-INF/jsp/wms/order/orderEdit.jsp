<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table>
	<input type="hidden" name="orderEvt.id" id="orderId" value="${orderEvt.id }" />
	<input type="hidden" name="orderEvt.status" id="orderStatus" value="${orderEvt.status }" />
	<tr>
		<td><label for="name">订单编号</label></td>
		<td><input type="text" name="orderEvt.orderId" id="orderOrderId" class="text ui-widget-content ui-corner-all" value="${orderEvt.orderId }" /></td>
	</tr>
	<tr>
		<td><label for="status">订单状态</label></td>
		<td>
			<s:if test="orderEvt.status == 0">
				草稿
			</s:if>
			<s:elseif test="orderEvt.status == 1">
				交易中
			</s:elseif>
			<s:elseif test="orderEvt.status == 2">
				已完成
			</s:elseif>
		</td>
	</tr>
	<tr>
		<td><label for="type">订单类型</label></td>
		<td>
			<s:if test='orderEvt.type=="1"'>
				<table>
					<tr>
						<td width="30px" style="border:0px solid;">购入</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="orderEvtType1" name="orderEvt.type" value="0" /></td>
						<td width="30px" style="border:0px solid;">售出</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="orderEvtType2" name="orderEvt.type" checked="checked" value="1" /></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
					</tr>
				</table>
			</s:if>
			<s:else>
				<table>
					<tr>
						<td width="30px" style="border:0px solid;">购入</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="orderEvtType1" name="orderEvt.type" checked="checked" value="0" /></td>
						<td width="30px" style="border:0px solid;">售出</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="orderEvtType2" name="orderEvt.type" value="1" /></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
					</tr>
				</table>
			</s:else>
		</td>
	</tr>
	<tr>
		<td><label for="type">账目类型</label></td>
		<td>
			<s:if test='orderEvt.accountType=="1"'>
				<table>
					<tr>
						<td width="30px" style="border:0px solid;">私人</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="orderAccountType1" name="orderEvt.accountType" value="0" /></td>
						<td width="30px" style="border:0px solid;">对公</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="orderAccountType2" name="orderEvt.accountType" checked="checked" value="1" /></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
					</tr>
				</table>
			</s:if>
			<s:else>
				<table>
					<tr>
						<td width="30px" style="border:0px solid;">私人</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="orderAccountType1" name="orderEvt.accountType" checked="checked" value="0" /></td>
						<td width="30px" style="border:0px solid;">对公</td>
						<td width="10px" style="border:0px solid;"><input type="radio" id="orderAccountType2" name="orderEvt.accountType" value="1" /></td>
						<td style="border:0px solid;"></td>
						<td style="border:0px solid;"></td>
					</tr>
				</table>
			</s:else>
		</td>
	</tr>
	<tr>
		<td><label for="invoice">发票编号</label></td>
		<td>
			<select name="orderEvt.invoiceType" id="orderInvoiceType">
				<option value="0" <s:if test="orderEvt.invoiceType == 0 ">selected="selected"</s:if>>无票</option>
				<option value="1" <s:if test="orderEvt.invoiceType == 1 ">selected="selected"</s:if>>普通发票</option>
				<option value="2" <s:if test="orderEvt.invoiceType == 2 ">selected="selected"</s:if>>增值税发票</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><label for="invoice">发票编号</label></td>
		<td><input type="text" name="orderEvt.invoice" id="orderInvoice" class="text ui-widget-content ui-corner-all" value="${orderEvt.invoice }" /></td>
	</tr>
	<tr>
		<td><label for="remark">备注</label></td>
		<td><textarea name="orderEvt.remark" id="orderRemark" class="text ui-widget-content ui-corner-all" cols="100" rows="5">${orderEvt.remark }</textarea></td>
	</tr>
</table>
<script type="text/javascript">
</script>