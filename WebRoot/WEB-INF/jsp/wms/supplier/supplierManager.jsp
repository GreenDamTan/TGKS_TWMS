<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<style type="text/css">
#supplierReq{border:0px solid;}
#supplierReq td{border:0px solid;}
#supplierReq input{width:120px;}
#supplierReq select{width:120px;}
</style>
<input type="hidden" id="supplierManagerSubmit" name="supplierManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="supplierReq" action="../wms/querySupplier.action" method="post">
		<table>
			<tr>
				<td><label>供货商名称: </label></td><td><input type="text" name="supplierReq.name" /></td>
				<td><label>主营商品类别: </label></td><td><input type="text" name="supplierReq.category" /></td>
				<td><label>联系人: </label></td><td><input type="text" name="supplierReq.person" /></td>
				<td>
				<button id="clearSupplier">重置</button>
				<button id="querySupplier">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addSupplier">新增</button>
<button id="deleteSupplier">删除</button>

<div id="supplierDiv"></div>

<div id="supplierEdit" title="供货商信息编辑">
	<form id="supplierForm" action="../wms/editSupplier.action" method="post"></form>
</div>

<div id="supplierConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	function query()
	{
		var table=$.ajax({url:"../wms/querySupplier.action", data:$("#supplierReq").formSerialize(), async:false});
		$("#supplierDiv").html(table.responseText);
	}
	
	query();
	
	// 新增/更新窗口
	$( "#supplierEdit" ).dialog({
		height:500,
		width:750,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				var form = $("#supplierForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#supplierManagerSubmit").val("0");
				$("#supplierEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#supplierForm").submit(function()
	{
		if ($("#supplierManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#supplierManagerSubmit").val("0");
		
		var options = { 
			url:"../wms/editSupplier.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#supplierEdit").dialog("close");
				// 新增完毕刷新form
				alert("操作成功");
				query();
			},
			error:function(){ 
				$("#supplierEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#supplierForm").ajaxSubmit(options);
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addSupplier" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#supplierManagerSubmit").val("1");
		$( "#supplierEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editSupplierPage.action",async:false});
		$("#supplierForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteSupplier" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#supplierManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("supplierId");
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
			$("#supplierManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteSupplier.action?ids=" + ids , // 提交给哪个执行
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
		$("#supplierConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#supplierConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
				
		return false;
	});
	
	 // 刷新按钮
	$( "#querySupplier" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearSupplier" ).button().click(function() {
			$("#supplierReq").clearForm();
		return false;
	});
});
</script>
