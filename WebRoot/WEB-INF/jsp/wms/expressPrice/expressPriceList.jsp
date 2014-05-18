<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="expressPriceListSubmit" name="expressPriceListSubmit" value="0" />
<div id="expressPriceTableDiv" class="ui-widget">
    <table id="expressPriceTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allExpressPriceId" name="allExpressPriceId"  /></th>
				<th>价格编号</th>
				<th>快递公司</th>
				<th>区域</th>
				<th>首重价格（元）</th>
				<th>超重价格（元/kg）</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="expressPriceId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="expressPriceUpdate"><s:property value="#evt.id"/></b></td>
					<td><s:property value="#evt.ecName"/></td>
					<td><s:property value="#evt.area"/></td>
					<td><s:property value="#evt.first"/></td>
					<td><s:property value="#evt.over"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#expressPriceTable').longtable({
			'perPage' : 10
		});

		// 点击记录首栏进入更新操作
		$(".expressPriceUpdate").click(function() {
			$("#expressPriceManagerSubmit").val("1");
			$("#expressPriceEdit").dialog("open");
			var edit = $.ajax({
				url : "../wms/editExpressPricePage.action?id=" + this.id,
				async : false
			});
			$("#expressPriceForm").html(edit.responseText);
		});

		// 全选
		$("#allExpressPriceId").click(function() {
			var checkbox = $("#expressPriceTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
