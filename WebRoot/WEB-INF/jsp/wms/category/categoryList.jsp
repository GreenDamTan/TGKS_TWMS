<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<div id="categoryTableDiv" class="ui-widget">
    <table id="categoryTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allCategoryId" name="allCategoryId"/></th>
				<th>分类名称</th>
				<th>上级菜单</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="categoryId" value="<s:property value='#evt.id'/>"/></td>
					<td><b id="<s:property value='#evt.id'/>" class="categoryUpdate"><s:property value="#evt.name"/></b></td>
					<td><s:property value="#evt.preName"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#categoryTable').longtable({
			'perPage' : 8
		});

		// 点击记录首栏进入更新操作
		$(".categoryUpdate").click(function() {
			$("#categoryEdit").dialog("open");
			var edit = $.ajax({
				url : "../wms/editCategoryPage.action?id=" + this.id,
				async : false
			});
			$("#categoryForm").html(edit.responseText);
		});

		// 全选
		$("#allCategoryId").click(function() {
			var checkbox = $("#categoryTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
