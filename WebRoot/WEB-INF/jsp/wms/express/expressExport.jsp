<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<style type="text/css">
td 
{
font-size:10px;
}
</style>
<div class="ui-widget">
    <table class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
				<th>快递单号</th>
				<th>价格</th>
				<th>重量</th>
				<th>送货地址</th>
				<th>创建时间</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator value="exportList" var="evt">
				<tr>
					<td><s:property value="#evt.number"/></td>
					<td><s:property value="#evt.price"/></td>
					<td><s:property value="#evt.weight"/></td>
					<td><s:property value="#evt.address"/></td>
					<td><s:date name="#evt.createTime" format="yyyy-MM-dd"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
	});
</script>
