<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="expressCompanyListSubmit" name="expressCompanyListSubmit" value="0" />
<div id="expressCompanyTableDiv" class="ui-widget">
    <table id="expressCompanyTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allExpressCompanyId" name="allExpressCompanyId"  /></th>
				<th>快递公司</th>
				<th>电话</th>
				<th>手机</th>
				<th>网址</th>
				<th>备注</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="expressCompanyId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="expressCompanyUpdate"><s:property value="#evt.name"/></b></td>
					<td><s:property value="#evt.tel"/></td>
					<td><s:property value="#evt.mobile"/></td>
					<td><s:property value="#evt.web"/></td>
					<td><s:property value="#evt.remark"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#expressCompanyTable').longtable({
			'perPage' : 10
		});

		// 点击记录首栏进入更新操作
		$(".expressCompanyUpdate").click(function() {
			$("#expressCompanyManagerSubmit").val("1");
			$("#expressCompanyEdit").dialog("open");
			var edit = $.ajax({
				url : "../wms/editExpressCompanyPage.action?id=" + this.id,
				async : false
			});
			$("#expressCompanyForm").html(edit.responseText);
		});

		// 全选
		$("#allExpressCompanyId").click(function() {
			var checkbox = $("#expressCompanyTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
