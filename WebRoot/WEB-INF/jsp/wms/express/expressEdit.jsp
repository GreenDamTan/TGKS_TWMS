<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="expressEvt.id" id="expressId" value="${expressEvt.id }" />
<input type="hidden" name="expressEvt.ecName" id="expressEcName" value="${expressEvt.ecName }" />
<input type="hidden" name="expressEvt.ecWeb" id="expressEcWeb" value="${expressEvt.ecWeb }" />
<table>
	<tr>
		<td><label>快递单号</label></td>
		<td><input type="text" name="expressEvt.number" id="expressNumber" value="${expressEvt.number }" /></td>
		<td><label>重量（kg）</label></td>
		<td><input type="text" name="expressEvt.weight" id="expressWeight" value="${expressEvt.weight }" /></td>
	</tr>
	<tr>
		<td><label>送货地址</label></td>
		<td colspan="3"><input type="text" name="expressEvt.address" id="expressAddress" value="${expressEvt.address }" size="105" /></td>
	</tr>
	<tr>
		<td><label>快递公司</label></td>
		<td>
			<select id="expressEcid" name="expressEvt.ecid">
				<option value="">请选择...</option>
				<s:iterator value="ecList" var="evt">
					<s:if test="#evt.id == expressEvt.ecid">
						<option value="<s:property value='#evt.id'/>" selected="selected">
					</s:if>
					<s:else>
						<option value="<s:property value='#evt.id'/>">
					</s:else>
						<s:property value="#evt.name" />
					</option>
				</s:iterator>
			</select>
		</td>
		<td><label>地区</label></td>
		<td>
			<select id="expressArea" name="expressEvt.area">
			</select>
		</td>
	</tr>
	<tr>
		<td><label>订单编号</label></td>
		<td><input type="text" name="expressEvt.orderCode" id="expressOrderCode" value="${expressEvt.orderCode }" /></td>
		<td><label>价格（元）</label></td>
		<td><input type="text" name="expressEvt.price" id="expressPrice" value="${expressEvt.price }" readonly="readonly" /></td>
	</tr>
	<tr>
		<td><label>备注</label></td>
		<td colspan="3"><textarea name="expressEvt.remark" id="expressRemark" cols="105" rows="5">${expressEvt.remark }</textarea></td>
	</tr>
</table>
<script type="text/javascript">
$(document).ready(function(){
	$("#expressEcid").change(function(){
		$.ajax({
			type : "POST",
			url : "../wms/queryExpressPriceDataByEcid.action?ecid=" + $("#expressEcid").val(),
			success : function(msg){
				// 清空原来的选项
				$("#expressArea").empty();
				
				var data  = msg.split("♂");
				for (var i=0; i < data.length - 1; i++)
                {
                	$("#expressArea").append("<option value=\"" + data[i].trim() + "\">" + data[i].trim() + "</option>")
                }
			}
		});
	});
});
</script>