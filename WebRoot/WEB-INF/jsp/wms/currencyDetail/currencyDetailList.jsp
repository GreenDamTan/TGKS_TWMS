<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="currencyDetailListSubmit" name="currencyDetailListSubmit" value="0" />
<div id="currencyDetailTableDiv" class="ui-widget">
    <table id="currencyDetailTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allCurrencyDetailId" name="allCurrencyDetailId"  /></th>
                <th>交易ID</th>
				<th>名称</th>
				<th>币种</th>
				<th>缩写</th>
				<th>流向</th>
				<th>数量</th>
				<th>单位</th>
				<th>订单编号</th>
				<th>交易时间</th>
				<th>备注</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="currencyDetailId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="currencyDetailUpdate"><s:property value="#evt.dealId"/></b></td>
					<td><s:property value="#evt.name"/></td>
					<td><s:property value="#evt.type"/></td>
					<td><s:property value="#evt.code"/></td>
					<td>
						<s:if test="#evt.direction == 0">
							流入
						</s:if>
						<s:elseif test="#evt.direction == 1">
							流出
						</s:elseif>
					</td>
					<td><s:property value="#evt.num"/></td>
					<td><s:property value="#evt.unit"/></td>
					<td><s:property value="#evt.orderCode"/></td>
					<td><s:date name="#evt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
					<td><s:property value="#evt.remark"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#currencyDetailTable').longtable({
			'perPage' : 10
		});

		// 点击记录首栏进入更新操作
		$(".currencyDetailUpdate").click(function() {
			$("#currencyDetailManagerSubmit").val("1");
			$("#currencyDetailEdit").dialog("open");
			var edit = $.ajax({
				url : "../wms/editCurrencyDetailPage.action?id=" + this.id,
				async : false
			});
			$("#currencyDetailForm").html(edit.responseText);
		});

		// 全选
		$("#allCurrencyDetailId").click(function() {
			var checkbox = $("#currencyDetailTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
