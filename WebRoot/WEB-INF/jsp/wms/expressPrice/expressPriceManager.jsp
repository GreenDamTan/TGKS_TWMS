<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#expressPriceReq{border:0px solid;}
#expressPriceReq td{border:0px solid;}
#expressPriceReq input{width:120px;}
#expressPriceReq select{width:120px;}
</style>
<input type="hidden" id="expressPriceManagerSubmit" name="expressPriceManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="expressPriceReq" action="../wms/queryExpressPrice.action" method="post">
		<table>
			<tr>
				<td><label>快递公司: </label></td>
				<td>
					<select id="expressPriceReqEcid" name="expressPriceReq.ecid">
						<option value="">全部</option>
						<s:iterator value="ecList" var="evt">
							<option value="<s:property value='#evt.id'/>">
								<s:property value="#evt.name" />
							</option>
						</s:iterator>
					</select>
				</td>
				<td>
				
				</td>
				<td>
				<button id="clearExpressPrice">重置</button>
				<button id="queryExpressPrice">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addExpressPrice">新增</button>
<button id="deleteExpressPrice">删除</button>

<div id="expressPriceDiv"></div>

<div id="expressPriceEdit" title="ExpressPrice Edit">
	<form id="expressPriceForm" action="../wms/editExpressPrice.action" method="post"></form>
</div>

<div id="expressPriceConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../wms/queryExpressPrice.action",async:false});
	$("#expressPriceDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../wms/queryExpressPrice.action", data:$("#expressPriceReq").formSerialize(), async:false});
		$("#expressPriceDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#expressPriceEdit" ).dialog({
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
				if (!expressPriceFormCheck())
				{
					return false;
				}
				var form = $("#expressPriceForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#expressPriceManagerSubmit").val("0");
				$("#expressPriceEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#expressPriceForm").submit(function()
	{
		if ($("#expressPriceManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#expressPriceManagerSubmit").val("0");
		
		var options = { 
			url:"../wms/editExpressPrice.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#expressPriceEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#expressPriceEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#expressPriceForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addExpressPrice" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#expressPriceManagerSubmit").val("1");
		$( "#expressPriceEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editExpressPricePage.action",async:false});
		$("#expressPriceForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteExpressPrice" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#expressPriceManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("expressPriceId");
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
			$("#expressPriceManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteExpressPrice.action?ids=" + ids , // 提交给哪个执行
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
		$("#expressPriceConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#expressPriceConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 启用按钮
	$( "#onExpressPrice" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#expressPriceManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("expressPriceId");
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
				$("#expressPriceManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusExpressPrice.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#expressPriceConfirm").ajaxSubmit(options);
			$("#expressPriceManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offExpressPrice" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#expressPriceManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("expressPriceId");
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
				$("#expressPriceManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../wms/changeStatusExpressPrice.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#expressPriceConfirm").ajaxSubmit(options);
			$("#expressPriceManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryExpressPrice" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearExpressPrice" ).button().click(function() {
			$("#expressPriceReq").clearForm();
		return false;
	});
	
	// 页面校验
	function expressPriceFormCheck()
	{
		return true;
	}
});
</script>
