<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<div id="orderTableDiv" class="ui-widget">
    <table id="orderTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allOrderId" name="allOrderId"/></th>
				<th>订单号</th>
				<th>交易详情</th>
				<th>订单类型</th>
				<th>订单状态</th>
				<th>发票类型</th>
				<th>发票编号</th>
				<th>创建时间</th>
				<th>账目类型</th>
				<th>订单说明</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="orderId" value="<s:property value='#evt.id'/>"/></td>
					<td><b id="<s:property value='#evt.id'/>" class="orderUpdate"><s:property value="#evt.orderId"/></b></td>
					<td><b title="<s:property value='#evt.orderId'/><s:property value='#evt.type'/>" class="orderDeal">点击进入</b></td>
					<td>
						<s:if test="#evt.type == 0">
							购入
						</s:if>
						<s:elseif test="#evt.type == 1">
							售出
						</s:elseif>
					</td>
					<td>
						<s:if test="#evt.status == 0">
							草稿
						</s:if>
						<s:elseif test="#evt.status == 1">
							交易中
						</s:elseif>
						<s:elseif test="#evt.status == 2">
							已完成
						</s:elseif>
					</td>
					<td>
						<s:if test="#evt.invoiceType == 0">
							无票
						</s:if>
						<s:elseif test="#evt.invoiceType == 1">
							普通发票
						</s:elseif>
						<s:elseif test="#evt.invoiceType == 2">
							增值税发票
						</s:elseif>
					</td>
					<td><s:property value="#evt.invoice"/></td>
					<td><s:date name="#evt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<s:if test="#evt.accountType == 0">
							私人
						</s:if>
						<s:elseif test="#evt.accountType == 1">
							对公
						</s:elseif>
					</td>
					<td><s:property value="#evt.remark"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
$(function() {
	$("#orderTable").longtable({
		'perPage' : 10
	});

	// 点击记录首栏进入更新操作
	$(".orderUpdate").click(function() {
		$("#orderManagerSubmit").val("1");
		$("#orderEdit").dialog("open");
		var edit = $.ajax({
			url : "../wms/editOrderPage.action?id=" + this.id,
			async : false
		});
		$("#orderForm").html(edit.responseText);
	});

	// 全选
	$("#allOrderId").click(function(){
		var checkbox = $("#orderTable :checkbox");
		for (var i = 1; i < checkbox.length; i++)
		{
			if (checkbox[i].hidden == "")
			{
				checkbox[i].checked = checkbox[0].checked;
			}
		}
	});
	
	// 订单交易详情管理按钮
	$(".orderDeal").click(function() {
		$("#orderManagerSubmit").val("1");
		
		newTab("订单详情", "../wms/orderDeal.action?params=" + this.title);
		
		/*
		$("#orderDeal").dialog("open");
		
		var deal = $.ajax({
			url : "../wms/orderDeal.action?params=" + this.title,
			async : false
		});
		$("#orderDeal").html(deal.responseText);
		*/
	});
	
	//新增标签
	function newTab(label, url)
	{
		var tabContent = $( "#tab_content" );
   		var tabTemplate = "<li><a id='\#{id}' name='\#{name}' title='\#{title}' href='\#{href}'>\#{label}</a> <span class='ui-icon ui-icon-close'>Remove Tab</span></li>";
    	var tabs = $( "#tabs" ).tabs();
		
		// label这个值是标题，tabContentHtml这个是正文内容
	    var id = "otabs",
	    	up = "oup", // 上门的标签页的ID,用于后面自动跳到刚点开的菜单
	        li = $( tabTemplate.replace( /#\{id}/g, up).replace( /#\{name\}/g, "ups").replace( /#\{title\}/g, label).replace( /#\{href\}/g, "#"+id).replace( /#\{label\}/g, label ) );
        
        // 看是否已经打开了该菜单，如果是，则直接跳到该菜单页
		if ($("#" + up).attr("title") == "订单详情")
		{
			$("#" + up).click();
			var html=$.ajax({url:url,async:false});
       		$("#" + id).html(html.responseText);
			return;
		}
		
        tabs.find( ".ui-tabs-nav" ).append( li );
        tabs.append( "<div id='" + id + "'></div>" );
        tabs.tabs( "refresh" );
        
        // 跳转到刚点开的菜单
        $("#" + up).click();
        //$("#" + id).load(url);
        var html=$.ajax({url:url,async:false});
        $("#" + id).html(html.responseText);
	}

});
</script>