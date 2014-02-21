<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<style type="text/css">
#customerReq{border:0px solid;}
#customerReq td{border:0px solid;}
#customerReq input{width:120px;}
#customerReq select{width:120px;}
</style>
<input type="hidden" id="customerManagerSubmit" name="customerManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="customerReq" action="../wms/queryCustomer.action" method="post">
		<table>
			<tr>
				<td><label>供货商名称: </label></td><td><input type="text" name="customerReq.name" /></td>
				<td><label>主营商品类别: </label></td><td><input type="text" name="customerReq.category" /></td>
				<td><label>联系人: </label></td><td><input type="text" name="customerReq.person" /></td>
				<td>
				<button id="clearCustomer">重置</button>
				<button id="queryCustomer">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addCustomer">新增</button>
<button id="deleteCustomer">删除</button>

<div id="customerDiv"></div>

<div id="customerEdit" title="供货商信息编辑">
	<form id="customerForm" action="../wms/editCustomer.action" method="post"></form>
</div>

<div id="customerConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	function query()
	{
		var table=$.ajax({url:"../wms/queryCustomer.action", data:$("#customerReq").formSerialize(), async:false});
		$("#customerDiv").html(table.responseText);
	}
	
	query();
	
	// 新增/更新窗口
	$( "#customerEdit" ).dialog({
		height:500,
		width:750,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				var form = $("#customerForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#customerManagerSubmit").val("0");
				$("#customerEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#customerForm").submit(function()
	{
		if ($("#customerManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#customerManagerSubmit").val("0");
		
		var options = { 
			url:"../wms/editCustomer.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#customerEdit").dialog("close");
				// 新增完毕刷新form
				alert("操作成功");
				query();
			},
			error:function(){ 
				$("#customerEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#customerForm").ajaxSubmit(options);
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addCustomer" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#customerManagerSubmit").val("1");
		$( "#customerEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editCustomerPage.action",async:false});
		$("#customerForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteCustomer" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#customerManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("customerId");
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
			$("#customerManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteCustomer.action?ids=" + ids , // 提交给哪个执行
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
		$("#customerConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#customerConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
				
		return false;
	});
	
	 // 刷新按钮
	$( "#queryCustomer" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearCustomer" ).button().click(function() {
			$("#customerReq").clearForm();
		return false;
	});
});
</script>
