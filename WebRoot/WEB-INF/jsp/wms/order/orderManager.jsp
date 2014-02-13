<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<style type="text/css">
#orderReq{border:0px solid;}
#orderReq td{border:0px solid;}
#orderReq input{width:120px;}
#orderReq select{width:120px;}
</style>
<input type="hidden" id="orderManagerSubmit" name="orderManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="orderReq" action="../wms/queryOrder.action" method="post">
		<table>
			<tr>
				<td><label>订单号: </label></td><td><input type="text" name="orderReq.orderId" /></td>
				<td><label>发票编号: </label></td><td><input type="text" name="orderReq.invoice" /></td>
				<td><label>订单类型: </label></td>
				<td>
					<select name="orderReq.type">
						<option value="" >全部</option>
						<option value="0" >购入</option>
						<option value="1" >售出</option>
					</select>
				</td>
				<td><label>订单状态: </label></td>
				<td>
					<select name="orderReq.status">
						<option value="" >全部</option>
						<option value="0" >草稿</option>
						<option value="1" >交易中</option>
						<option value="2" >已完成</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label>账目类型: </label></td>
				<td>
					<select name="orderReq.accountType">
						<option value="" >全部</option>
						<option value="0" >私人</option>
						<option value="1" >对公</option>
					</select>
				</td>
				<td><label>发票类型: </label></td>
				<td>
					<select name="orderReq.invoiceType">
						<option value="" >全部</option>
						<option value="0" >无票</option>
						<option value="1" >普通发票</option>
						<option value="2" >增值税发票</option>
					</select>
				</td>
				<td></td><td></td>
				<td></td>
				<td>
					<button id="clearOrder">重置</button>
					<button id="queryOrder">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addOrder">新增</button>
<button id="deleteOrder">删除</button>
<button id="onOrder">启用</button>
<button id="offOrder">禁用</button>

<div id="orderDiv"></div>

<div id="orderEdit" title="订单信息编辑">
	<form id="orderForm" action="../wms/editOrder.action" method="post"></form>
</div>

<div id="orderDeal" title="订单交易管理"></div>

<div id="orderConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	function query()
	{
		var table=$.ajax({url:"../wms/queryOrder.action", data:$("#orderReq").formSerialize(), async:false});
		$("#orderDiv").html(table.responseText);
	}
	
	query();
	
	// 新增/更新窗口
	$( "#orderEdit" ).dialog({
		height:500,
		width:780,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				var form = $("#orderForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#orderManagerSubmit").val("0");
				$("#orderEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#orderForm").submit(function()
	{
		if ($("#orderManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#orderManagerSubmit").val("0");
		
		var options = { 
			url:"../wms/editOrder.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#orderEdit").dialog("close");
				alert("操作成功");
				// 新增完毕刷新form
				query();
			},
			error:function(){ 
				$("#orderEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#orderForm").ajaxSubmit(options);
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addOrder" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		$("#orderManagerSubmit").val("1");
		$( "#orderEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editOrderPage.action",async:false});
		$("#orderForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteOrder" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#orderManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("orderId");
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
			$("#orderManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteOrder.action?ids=" + ids , // 提交给哪个执行
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
		$("#orderConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#orderConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
				
		return false;
	});
	 
	 // 启用按钮
	$( "#onOrder" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#orderManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("orderId");
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
				$("#orderManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusOrder.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#orderConfirm").ajaxSubmit(options);
			$("#orderManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offOrder" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#orderManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("orderId");
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
				$("#orderManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusOrder.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#orderConfirm").ajaxSubmit(options);
			$("#orderManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryOrder" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearOrder" ).button().click(function() {
			$("#orderReq").clearForm();
		return false;
	});
	
	// 订单交易信息窗口
	$( "#orderDeal" ).dialog({
		height:500,
		width:"90%",
		autoOpen: false,
		show: "fold",
		hide: "fold",
		modal: true,
		buttons:
		{ 
			"关闭": function()
			{
				$("#orderDeal").dialog("close"); 
			} 
		}
	});
});
</script>
