<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="expressPriceEvt.id" id="expressPriceId" value="${expressPriceEvt.id }" />
<table>
	<tr>
		<td><label>快递公司</label></td>
		<td>
			<select id="expressPriceEvtEcid" name="expressPriceEvt.ecid">
				<s:iterator value="ecList" var="evt">
					<s:if test="#evt.id == expressPriceEvt.ecid">
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
		<td><label>区域</label></td>
		<td>
			<input type="text" name="expressPriceEvt.area" id="expressPriceArea" value="${expressPriceEvt.area }" />
		</td>
	</tr>
	<tr>
		<td><label>首重价格（元）</label></td>
		<td>
			<input type="text" name="expressPriceEvt.first" id="expressPriceFirst" value="${expressPriceEvt.first }" />
		</td>
		<td><label>超重价格（元/kg）</label></td>
		<td>
			<input type="text" name="expressPriceEvt.over" id="expressPriceOver" value="${expressPriceEvt.over }" />
		</td>
	</tr>
</table>
<script type="text/javascript">
</script>