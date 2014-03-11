<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>

<!-- 图片方法功能 -->
<script src="<%=basePath%>js/common/image/js-global/FancyZoomHTML.js" language="JavaScript" type="text/javascript"></script>
<script src="<%=basePath%>js/common/image/js-global/FancyZoom.js" language="JavaScript" type="text/javascript"></script>

<div id="commodityTableDiv" class="ui-widget">
    <table id="commodityTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allCommodityId" name="allCommodityId"/></th>
				<th>商品名称</th>
				<th>预览图</th>
				<th>商品编号</th>
				<th>商品类别</th>
				<th>库存数目</th>
				<th>定价</th>
				<th>网上参考报价</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="commodityId" value="<s:property value='#evt.id'/>"/></td>
					<td><b id="<s:property value='#evt.id'/>" class="commodityUpdate"><s:property value="#evt.name"/></b></td>
					<td><p><a href='<%=basePath%><s:property value="#evt.images"/>' ><img width="120px" src="<s:property value="#evt.images"/>" class="photo"/></a></p></td>
					<td><s:property value="#evt.code"/></td>
					<td><s:property value="#evt.categoryName"/></td>
					<td><s:property value="#evt.number"/></td>
					<td><s:property value="#evt.price"/></td>
					<td><s:property value="#evt.netPrice"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
$(function() {
	$("#commodityTable").longtable({
		'perPage' : 10
	});
	
	// 图片缩放
	//setupZoom();
	
	// 点击记录首栏进入更新操作
	$(".commodityUpdate").click(function() {
		$("#commodityManagerSubmit").val("1");
		$("#commodityEdit").dialog("open");
		var edit = $.ajax({
			url : "../wms/editCommodityPage.action?id=" + this.id,
			async : false
		});
		$("#commodityForm").html(edit.responseText);
	});

	// 全选
	$("#allCommodityId").click(function(){
		var checkbox = $("#commodityTable :checkbox");
		for (var i = 1; i < checkbox.length; i++)
		{
			if (checkbox[i].hidden == "")
			{
				checkbox[i].checked = checkbox[0].checked;
			}
		}
	});
	

});
</script>
