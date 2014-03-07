<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="currencyListSubmit" name="currencyListSubmit" value="0" />
<div id="currencyTableDiv" class="ui-widget">
    <table id="currencyTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allCurrencyId" name="allCurrencyId"  /></th>
				<th>名称</th>
				<th>币种</th>
				<th>缩写</th>
				<th>数量</th>
				<th>单位</th>
				<th>备注</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><s:if test="#evt.num == 0"><input type="checkbox" name="currencyId" value="<s:property value='#evt.id'/>" /></s:if></td>
					<td><b id="<s:property value='#evt.id'/>" class="currencyUpdate"><s:property value="#evt.name"/></b></td>
					<td><s:property value="#evt.type"/></td>
					<td><s:property value="#evt.code"/></td>
					<td><s:property value="#evt.num"/></td>
					<td><s:property value="#evt.unit"/></td>
					<td><s:property value="#evt.remark"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#currencyTable').longtable({
			'perPage' : 10
		});

		// 点击记录首栏进入更新操作
		$(".currencyUpdate").click(function() {
			$("#currencyManagerSubmit").val("1");
			$("#currencyEdit").dialog("open");
			var edit = $.ajax({
				url : "../wms/editCurrencyPage.action?id=" + this.id,
				async : false
			});
			$("#currencyForm").html(edit.responseText);
		});

		// 全选
		$("#allCurrencyId").click(function() {
			var checkbox = $("#currencyTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
