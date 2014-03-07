<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#currencyReq{border:0px solid;}
#currencyReq td{border:0px solid;}
#currencyReq input{width:120px;}
#currencyReq select{width:120px;}
</style>
<input type="hidden" id="currencyManagerSubmit" name="currencyManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="currencyReq" action="../wms/queryCurrency.action" method="post">
		<table>
			<tr>
				<td><label>名称: </label></td><td><input type="text" name="currencyReq.name" /></td>
				<td>
				
				</td>
				<td>
				<button id="clearCurrency">重置</button>
				<button id="queryCurrency">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addCurrency">新增</button>
<button id="deleteCurrency">删除</button>
<button id="onCurrency">启用</button>
<button id="offCurrency">禁用</button>

<div id="currencyDiv"></div>

<div id="currencyEdit" title="资金编辑">
	<form id="currencyForm" action="../wms/editCurrency.action" method="post"></form>
</div>

<div id="currencyConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../wms/queryCurrency.action",async:false});
	$("#currencyDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../wms/queryCurrency.action", data:$("#currencyReq").formSerialize(), async:false});
		$("#currencyDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#currencyEdit" ).dialog({
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
				if (!currencyFormCheck())
				{
					return false;
				}
				var form = $("#currencyForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#currencyManagerSubmit").val("0");
				$("#currencyEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#currencyForm").submit(function()
	{
		if ($("#currencyManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#currencyManagerSubmit").val("0");
		
		var options = { 
			url:"../wms/editCurrency.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#currencyEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#currencyEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#currencyForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addCurrency" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#currencyManagerSubmit").val("1");
		$( "#currencyEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editCurrencyPage.action",async:false});
		$("#currencyForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteCurrency" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#currencyManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("currencyId");
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
			$("#currencyManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteCurrency.action?ids=" + ids , // 提交给哪个执行
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
		$("#currencyConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#currencyConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 启用按钮
	$( "#onCurrency" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#currencyManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("currencyId");
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
				$("#currencyManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusCurrency.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#currencyConfirm").ajaxSubmit(options);
			$("#currencyManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offCurrency" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#currencyManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("currencyId");
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
				$("#currencyManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusCurrency.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#currencyConfirm").ajaxSubmit(options);
			$("#currencyManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryCurrency" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearCurrency" ).button().click(function() {
			$("#currencyReq").clearForm();
		return false;
	});
	
	// 页面校验
	function currencyFormCheck()
	{
		return true;
	}
});
</script>
