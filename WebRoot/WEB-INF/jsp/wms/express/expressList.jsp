<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="expressListSubmit" name="expressListSubmit" value="0" />
<div id="expressTableDiv" class="ui-widget">
    <table id="expressTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allExpressId" name="allExpressId"  /></th>
				<th>快递ID</th>
				<th>快递单号</th>
				<th>物流信息</th>
				<th>快递名称</th>
				<th>重量</th>
				<th>价格</th>
				<th>送货地址</th>
				<th>订单编号</th>
				<th>创建时间</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="expressId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="expressUpdate"><s:property value="#evt.id"/></b></td>
					<td><s:property value="#evt.number"/></td>
					<td><input type="button" value="查询" onclick="window.open('<s:property value="#evt.ecWeb"/><s:property value="#evt.number"/>');" /></td>
					<td><s:property value="#evt.ecName"/></td>
					<td><s:property value="#evt.weight"/></td>
					<td><s:property value="#evt.price"/></td>
					<td><s:property value="#evt.address"/></td>
					<td><s:property value="#evt.orderCode"/></td>
					<td><s:date name="#evt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#expressTable').longtable({
			'perPage' : 10
		});

		// 点击记录首栏进入更新操作
		$(".expressUpdate").click(function() {
			$("#expressManagerSubmit").val("1");
			$("#expressEdit").dialog("open");
			var edit = $.ajax({
				url : "../wms/editExpressPage.action?id=" + this.id,
				async : false
			});
			$("#expressForm").html(edit.responseText);
		});

		// 全选
		$("#allExpressId").click(function() {
			var checkbox = $("#expressTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
