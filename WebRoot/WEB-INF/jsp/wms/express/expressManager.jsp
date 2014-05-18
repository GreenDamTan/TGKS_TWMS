<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#expressReq{border:0px solid;}
#expressReq td{border:0px solid;}
#expressReq input{width:120px;}
#expressReq select{width:120px;}
</style>
<input type="hidden" id="expressManagerSubmit" name="expressManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="expressReq" action="../wms/queryExpress.action" method="post">
		<table>
			<tr>
				<td><label>快递单号: </label></td><td><input type="text" name="expressReq.number" /></td>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>创建时间：</td>
				<td><input type="text" class="datepicker" name="expressReq.createTimeStart" /></td>
				<td>~</td>
				<td><input type="text" class="datepicker" name="expressReq.createTimeEnd" /></td>
				<td>
				<button id="clearExpress">重置</button>
				<button id="queryExpress">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addExpress">新增</button>
<button id="deleteExpress">删除</button>

<div id="expressDiv"></div>

<div id="expressEdit" title="Express Edit">
	<form id="expressForm" action="../wms/editExpress.action" method="post"></form>
</div>

<div id="expressConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../wms/queryExpress.action",async:false});
	$("#expressDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../wms/queryExpress.action", data:$("#expressReq").formSerialize(), async:false});
		$("#expressDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#expressEdit" ).dialog({
		modal: true,
		height:450,
		width:780,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				// 页面校验
				if (!expressFormCheck())
				{
					return false;
				}
				var form = $("#expressForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#expressManagerSubmit").val("0");
				$("#expressEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#expressForm").submit(function()
	{
		if ($("#expressManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#expressManagerSubmit").val("0");
		
		var options = { 
			url:"../wms/editExpress.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#expressEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#expressEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#expressForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addExpress" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#expressManagerSubmit").val("1");
		$( "#expressEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editExpressPage.action",async:false});
		$("#expressForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteExpress" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#expressManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("expressId");
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
			$("#expressManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteExpress.action?ids=" + ids , // 提交给哪个执行
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
		$("#expressConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#expressConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 启用按钮
	$( "#onExpress" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#expressManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("expressId");
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
				$("#expressManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusExpress.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#expressConfirm").ajaxSubmit(options);
			$("#expressManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offExpress" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#expressManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("expressId");
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
				$("#expressManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusExpress.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#expressConfirm").ajaxSubmit(options);
			$("#expressManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryExpress" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearExpress" ).button().click(function() {
			$("#expressReq").clearForm();
		return false;
	});
	
	// 页面校验
	function expressFormCheck()
	{
		return true;
	}
});
</script>
