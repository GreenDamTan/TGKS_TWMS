<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="currencyDetailListSubmit" name="currencyDetailListSubmit" value="0" />
<div id="currencyDetailTableDiv" class="ui-widget">
    <table id="currencyDetailTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allCurrencyDetailId" name="allCurrencyDetailId"  /></th>
				<th>currencyDetail</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="currencyDetailId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="currencyDetailUpdate"><s:property value="#evt.name"/></b></td>
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
