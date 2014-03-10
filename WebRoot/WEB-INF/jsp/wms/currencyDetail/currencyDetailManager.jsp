<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#currencyDetailReq{border:0px solid;}
#currencyDetailReq td{border:0px solid;}
#currencyDetailReq input{width:120px;}
#currencyDetailReq select{width:120px;}
</style>
<input type="hidden" id="currencyDetailManagerSubmit" name="currencyDetailManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="currencyDetailReq" action="../wms/queryCurrencyDetail.action" method="post">
		<table>
			<tr>
				<td><label>名称: </label></td><td><input type="text" name="currencyDetailReq.name" /></td>
				<td><label>币种: </label></td><td><input type="text" name="currencyDetailReq.type" /></td>
				<td><label>缩写: </label></td><td><input type="text" name="currencyDetailReq.code" /></td>
				<td>
					<label>流向: </label>
				</td>
				<td>
					<select name="currencyDetailReq.direction">
						<option value="" >全部</option>
						<option value="0">流入</option>
						<option value="1">流出</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label>订单编号: </label></td><td><input type="text" name="currencyDetailReq.orderCode" /></td>
				<td>交易时间：</td>
				<td><input type="text" class="datepicker" name="currencyDetailReq.createTimeStart" /></td>
				<td>~</td>
				<td><input type="text" class="datepicker" name="currencyDetailReq.createTimeEnd" /></td>
				<td></td><td><button id="clearCurrencyDetail">重置</button><button id="queryCurrencyDetail">查询</button></td>
			</tr>
		</table>
	</form>
</div>

<button id="addCurrencyDetail">新增</button>
<button id="deleteCurrencyDetail">删除</button>
<button id="onCurrencyDetail">启用</button>
<button id="offCurrencyDetail">禁用</button>

<div id="currencyDetailDiv"></div>

<div id="currencyDetailEdit" title="资金流动信息">
	<form id="currencyDetailForm" action="../wms/editCurrencyDetail.action" method="post"></form>
</div>

<div id="currencyDetailConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../wms/queryCurrencyDetail.action",async:false});
	$("#currencyDetailDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../wms/queryCurrencyDetail.action", data:$("#currencyDetailReq").formSerialize(), async:false});
		$("#currencyDetailDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#currencyDetailEdit" ).dialog({
		modal: true,
		height:500,
		width:750,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				// 页面校验
				if (!currencyDetailFormCheck())
				{
					return false;
				}
				var form = $("#currencyDetailForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#currencyDetailManagerSubmit").val("0");
				$("#currencyDetailEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#currencyDetailForm").submit(function()
	{
		if ($("#currencyDetailManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#currencyDetailManagerSubmit").val("0");
		
		var options = { 
			url:"../wms/editCurrencyDetail.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#currencyDetailEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#currencyDetailEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#currencyDetailForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addCurrencyDetail" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#currencyDetailManagerSubmit").val("1");
		$( "#currencyDetailEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editCurrencyDetailPage.action",async:false});
		$("#currencyDetailForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteCurrencyDetail" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#currencyDetailManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("currencyDetailId");
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
			$("#currencyDetailManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteCurrencyDetail.action?ids=" + ids , // 提交给哪个执行
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
		$("#currencyDetailConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#currencyDetailConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 启用按钮
	$( "#onCurrencyDetail" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#currencyDetailManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("currencyDetailId");
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
				$("#currencyDetailManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusCurrencyDetail.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#currencyDetailConfirm").ajaxSubmit(options);
			$("#currencyDetailManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offCurrencyDetail" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#currencyDetailManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("currencyDetailId");
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
				$("#currencyDetailManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusCurrencyDetail.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#currencyDetailConfirm").ajaxSubmit(options);
			$("#currencyDetailManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryCurrencyDetail" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearCurrencyDetail" ).button().click(function() {
			$("#currencyDetailReq").clearForm();
		return false;
	});
	
	// 页面校验
	function currencyDetailFormCheck()
	{
		return true;
	}
});
</script>
