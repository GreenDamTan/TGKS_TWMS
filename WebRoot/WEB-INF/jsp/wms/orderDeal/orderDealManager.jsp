<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<style type="text/css">
#orderDealReq{border:0px solid;}
#orderDealReq td{border:0px solid;}
#orderDealReq input{width:120px;}
#orderDealReq select{width:120px;}
</style>
<input type="hidden" id="orderDealSubmit" name="orderDealSubmit" value="0" />
<div class="ui-widget">
	<form id="orderDealReq" action="../wms/queryOrderDeal.action" method="post">
		<table>
			<tr>
				<td><label>订单号: </label></td><td><input type="text" name="orderDealReq.orderId" value="${orderDealOrderId }" id="orderDealOrderId" readonly="readonly" /></td>
				<td><label>商品编号: </label></td><td><input type="text" name="orderDealReq.commodityId" /></td>
				<td><label>商品名称: </label></td><td><input type="text" name="orderDealReq.commodityName" /></td>
				<td><label>过款状态: </label>
				<td>
					<select name="orderDealReq.payStatus">
						<option value="" >全部</option>
						<option value="0" >未付款</option>
						<s:if test="orderDealOrderType == 0">
							<option value="1" >已付款</option>
						</s:if>
						<s:if test="orderDealOrderType == 0">
							<option value="2" >已收款</option>
						</s:if>
					</select>
				</td>
			</tr>
			<tr>
				<td><label>交易类型: </label>
				<td>
					<input type="hidden" id="orderDealOrderType" name="orderDealOrderType" value="${orderDealOrderType }"/>
					<select name="orderDealReq.type"  id="orderDealOrderType">
						<s:if test="orderDealOrderType == 0">
							<option value="0" >购入</option>
						</s:if>
						<s:elseif test="orderDealOrderType == 1">
							<option value="1" >售出</option>
						</s:elseif>
					</select>
				</td>
				<td></td><td></td>
				<td></td><td></td>
				<td></td>
				<td>
					<button id="queryOrderDeal">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addOrderDeal">新增</button>
<button id="deleteOrderDeal">删除</button>
<button id="payOrderDeal">
	<s:if test="orderDealOrderType == 0">
		付款
	</s:if>
	<s:elseif test="orderDealOrderType == 1">
		收款
	</s:elseif>
</button>
<button id="storeOrderDeal">
	<s:if test="orderDealOrderType == 0">
		入库
	</s:if>
	<s:elseif test="orderDealOrderType == 1">
		出库
	</s:elseif>
</button>

<div id="orderDealDiv"></div>

<div id="orderDealEdit" title="订单交易信息编辑">
	<form id="orderDealForm" action="../wms/editOrderDeal.action" method="post"></form>
</div>

<div id="orderDealConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	function query()
	{
		var table=$.ajax({url:"../wms/queryOrderDeal.action", data:$("#orderDealReq").formSerialize(), async:false});
		$("#orderDealDiv").html(table.responseText);
	}
	
	query();
	
	// 新增/更新窗口
	$( "#orderDealEdit" ).dialog({
		height:500,
		width:750,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				var form = $("#orderDealForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#orderDealSubmit").val("0");
				$("#orderDealEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#orderDealForm").submit(function()
	{
		if ($("#orderDealSubmit").val() == "0")
		{
			return false;
		}
		
		$("#orderDealSubmit").val("0");
		
		var options = { 
			url:"../wms/editDeal.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#orderDealEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#orderDealEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#orderDealForm").ajaxSubmit(options);
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addOrderDeal" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		$("#orderDealSubmit").val("1");
		$( "#orderDealEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editDealPage.action?orderId=" + $("#orderDealOrderId").val() + "&orderType=" + $("#orderDealOrderType").val(), async:false});
		$("#orderDealForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteOrderDeal" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#orderDealSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("orderDealId");
		for (var i=0; i<array.length; i++)
	   	{
	   		if (array[i].checked)
  			{
	   			if (ids == "")
   				{
	   				ids += array[i].value;
   				}
	   			else
	   			{
	   				ids += "," + array[i].value;
	   			}
  			}
	   	}
		
		// 操作验证
		if (ids == "")
		{
			alert("请选择至少一条记录");
			$("#orderDealSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteDeal.action?ids=" + ids , // 提交给哪个执行
			type:'POST', 
			success: function(){
				alert("删除成功");
				// 执行成功刷新form
				query();
			},
			error:function(){ 
				alert("删除失败"); 
			}
		};
		
		// 确认操作
		$("#orderDealConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#orderDealConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
				
		return false;
	});
	
	// 过款按钮
	$( "#payOrderDeal" ).button({
		}).click(function() {
			$("#orderDealManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("orderDealId");
			
			for (var i=0; i<array.length; i++)
		   	{
		   		if (array[i].checked)
	  			{
	  				if (array[i].title != "0")
	  				{
	  					alert("存在不可操作的记录！");
						$("#orderDealManagerSubmit").val("0");
						return false;
	  				}
					
		   			if (ids == "")
	   				{
		   				ids += array[i].value;
	   				}
		   			else
		   			{
		   				ids += "," + array[i].value;
		   			}
	  			}
		   	}
			
			// 操作验证
			if (ids == "")
			{
				alert("请选择至少一条记录");
				$("#orderDealManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/payOrderDeal.action?orderDealOrderType=" + $("#orderDealOrderType").val() + "&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
					alert("操作成功");
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#orderDealConfirm").ajaxSubmit(options);
			$("#orderDealManagerSubmit").val("0");
			return false;
	});
	
	// 过库按钮
	$( "#storeOrderDeal" ).button({
		}).click(function() {
			$("#orderDealManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("orderDealId");
			
			for (var i=0; i<array.length; i++)
		   	{
		   		if (array[i].checked)
	  			{
	  				if (array[i].alt != "0")
	  				{
	  					alert("存在不可操作的记录！");
						$("#orderDealManagerSubmit").val("0");
						return false;
	  				}
					
		   			if (ids == "")
	   				{
		   				ids += array[i].value;
	   				}
		   			else
		   			{
		   				ids += "," + array[i].value;
		   			}
	  			}
		   	}
			
			// 操作验证
			if (ids == "")
			{
				alert("请选择至少一条记录");
				$("#orderDealManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/storeOrderDeal.action?orderDealOrderType=" + $("#orderDealOrderType").val() + "&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
					alert("操作成功");
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#orderDealConfirm").ajaxSubmit(options);
			$("#orderDealManagerSubmit").val("0");
			return false;
	});
	 
	 // 刷新按钮
	$( "#queryOrderDeal" ).button().click(function() {
			query();
		return false;
	});
	 
});
</script>