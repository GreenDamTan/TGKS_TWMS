<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#expressCompanyReq{border:0px solid;}
#expressCompanyReq td{border:0px solid;}
#expressCompanyReq input{width:120px;}
#expressCompanyReq select{width:120px;}
</style>
<input type="hidden" id="expressCompanyManagerSubmit" name="expressCompanyManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="expressCompanyReq" action="../wms/queryExpressCompany.action" method="post">
		<table>
			<tr>
				<td><label>快递名称: </label></td><td><input type="text" name="expressCompanyReq.name" /></td>
				<td>
				
				</td>
				<td>
				<button id="clearExpressCompany">重置</button>
				<button id="queryExpressCompany">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addExpressCompany">新增</button>
<button id="deleteExpressCompany">删除</button>

<div id="expressCompanyDiv"></div>

<div id="expressCompanyEdit" title="ExpressCompany Edit">
	<form id="expressCompanyForm" action="../wms/editExpressCompany.action" method="post"></form>
</div>

<div id="expressCompanyConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../wms/queryExpressCompany.action",async:false});
	$("#expressCompanyDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../wms/queryExpressCompany.action", data:$("#expressCompanyReq").formSerialize(), async:false});
		$("#expressCompanyDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#expressCompanyEdit" ).dialog({
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
				if (!expressCompanyFormCheck())
				{
					return false;
				}
				var form = $("#expressCompanyForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#expressCompanyManagerSubmit").val("0");
				$("#expressCompanyEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#expressCompanyForm").submit(function()
	{
		if ($("#expressCompanyManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#expressCompanyManagerSubmit").val("0");
		
		var options = { 
			url:"../wms/editExpressCompany.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#expressCompanyEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#expressCompanyEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#expressCompanyForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addExpressCompany" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#expressCompanyManagerSubmit").val("1");
		$( "#expressCompanyEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editExpressCompanyPage.action",async:false});
		$("#expressCompanyForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteExpressCompany" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#expressCompanyManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("expressCompanyId");
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
			$("#expressCompanyManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteExpressCompany.action?ids=" + ids , // 提交给哪个执行
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
		$("#expressCompanyConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#expressCompanyConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 启用按钮
	$( "#onExpressCompany" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#expressCompanyManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("expressCompanyId");
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
				$("#expressCompanyManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusExpressCompany.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#expressCompanyConfirm").ajaxSubmit(options);
			$("#expressCompanyManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offExpressCompany" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#expressCompanyManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("expressCompanyId");
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
				$("#expressCompanyManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusExpressCompany.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#expressCompanyConfirm").ajaxSubmit(options);
			$("#expressCompanyManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryExpressCompany" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearExpressCompany" ).button().click(function() {
			$("#expressCompanyReq").clearForm();
		return false;
	});
	
	// 页面校验
	function expressCompanyFormCheck()
	{
		return true;
	}
});
</script>
