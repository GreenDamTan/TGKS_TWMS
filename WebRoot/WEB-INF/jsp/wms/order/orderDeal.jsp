<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<style type="text/css">
#dealReq{border:0px solid;}
#dealReq td{border:0px solid;}
#dealReq input{width:120px;}
#dealReq select{width:120px;}
</style>

<div class="ui-widget">
	<form id="dealReq" action="../wms/queryDeal.action" method="post">
		<table>
			<tr>
				<td><label>订单号: </label></td><td><input type="text" name="dealReq.orderId" value="${orderDealOrderId }" id="orderDealOrderId" readonly="readonly" /></td>
				<td><label>商品编号: </label></td><td><input type="text" name="dealReq.commodityId" /></td>
				<td><label>商品名称: </label></td><td><input type="text" name="dealReq.commodityName" /></td>
				<td><label>交易状态: </label>
				<td>
					<select name="dealReq.status">
						<option value="" >全部</option>
						<option value="0" >未付款</option>
						<option value="1" >已付款</option>
					</select>
				</td>
				<td><label>交易类型: </label>
				<td>
					<select name="dealReq.type"  id="orderDealOrderType">
						<s:if test="orderDealOrderType == 0">
							<option value="0" >购入</option>
						</s:if>
						<s:elseif test="orderDealOrderType == 1">
							<option value="1" >售出</option>
						</s:elseif>
					</select>
				</td>
			</tr>
			<tr>
				<td></td><td></td>
				<td></td><td></td>
				<td></td><td></td>
				<td></td><td></td>
				<td></td>
				<td>
					<button id="queryDeal">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addDeal">新增</button>
<button id="deleteDeal">删除</button>
<button id="onDeal">启用</button>
<button id="offDeal">禁用</button>

<div id="dealDiv"></div>

<div id="dealEdit" title="订单交易信息编辑">
	<form id="dealForm" action="../wms/editDeal.action" method="post"></form>
</div>

<div id="dealConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	function query()
	{
		var table=$.ajax({url:"../wms/queryDeal.action", data:$("#dealReq").formSerialize(), async:false});
		$("#dealDiv").html(table.responseText);
	}
	
	query();
	
	// 新增/更新窗口
	$( "#dealEdit" ).dialog({
		height:500,
		width:750,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				var form = $("#dealForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#dealEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#dealForm").submit(function()
	{
		var options = { 
			url:"../wms/editDeal.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#dealEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#dealEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#dealForm").ajaxSubmit(options);
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addDeal" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		$( "#dealEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editDealPage.action?orderId=" + $("#orderDealOrderId").val() + "&orderType=" + $("#orderDealOrderType").val(), async:false});
		$("#dealForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteDeal" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("dealId");
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
		$("#dealConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#dealConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
				
		return false;
	});
	 
	 // 刷新按钮
	$( "#queryDeal" ).button().click(function() {
			query();
		return false;
	});
	 
});
</script>