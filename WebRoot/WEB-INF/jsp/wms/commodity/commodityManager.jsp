<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
#commodityReq{border:0px solid;}
#commodityReq td{border:0px solid;}
#commodityReq input{width:120px;}
#commodityReq select{width:120px;}
</style>
<input type="hidden" id="commodityManagerSubmit" name="commodityManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="commodityReq" action="../wms/queryCommodity.action" method="post">
		<table>
			<tr>
				<td><label>商品名称: </label></td><td><input type="text" name="commodityReq.name" /></td>
				<td><label>商品编号: </label></td><td><input type="text" name="commodityReq.code" /></td>
				<td><label>商品类别: </label></td>
				<td>
					<select name="commodityReq.categoryId">
						<option value="" ></option>
						<s:iterator value="categoryList" var="evt">
							<option value="<s:property value='#evt.id'/>">
								<s:property value="#evt.name" />
							</option>
						</s:iterator>
					</select>
				</td>
				<td><label>型号: </label></td><td><input type="text" name="commodityReq.type" /></td>
			</tr>
			<tr>
				<td><label>品牌: </label></td><td><input type="text" name="commodityReq.brand" /></td>
				<td>价格区间: </td><td><input type="text" name="commodityReq.priceStart" /></td>
				<td> ~ </td><td><input type="text" name="commodityReq.priceEnd" /></td>
				<td></td>
				<td>
				<button id="clearCommodity">重置</button>
				<button id="queryCommodity">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addCommodity">新增</button>
<button id="deleteCommodity">删除</button>
<button id="copyCommodity">复制</button>

<div id="commodityDiv"></div>

<div id="commodityEdit" title="商品信息编辑">
	<form id="commodityForm" action="../wms/editCommodity.action" method="post"></form>
</div>

<div id="commodityConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	function query()
	{
		var table=$.ajax({url:"../wms/queryCommodity.action", data:$("#commodityReq").formSerialize(),async:false});
		$("#commodityDiv").html(table.responseText);
	}
	
	query();
	
	// 新增/更新窗口
	$( "#commodityEdit" ).dialog({
		height:500,
		width:850,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				var form = $("#commodityForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#commodityManagerSubmit").val("0");
				$("#commodityEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#commodityForm").submit(function()
	{
		if ($("#commodityManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#commodityManagerSubmit").val("0");
		
		var options = { 
			url:"../wms/editCommodity.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#commodityEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#commodityEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#commodityForm").ajaxSubmit(options);
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addCommodity" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		$("#commodityManagerSubmit").val("1");
		$( "#commodityEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editCommodityPage.action",async:false});
		$("#commodityForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteCommodity" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#commodityManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("commodityId");
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
			$("#commodityManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteCommodity.action?ids=" + ids , // 提交给哪个执行
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
		$("#commodityConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#commodityConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
				
		return false;
	});
	 
	 // 刷新按钮
	$( "#queryCommodity" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearCommodity" ).button().click(function() {
			$("#commodityReq").clearForm();
		return false;
	});
	
	// 复制按钮
	$( "#copyCommodity" ).button({
		icons: {
			primary: "ui-icon-copy"
			}
		}).click(function() {
		$("#commodityManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("commodityId");
		var num = 0;
		
		for (var i=0; i<array.length; i++)
	   	{
	   		if (array[i].checked)
  			{
	   			if (ids == "")
   				{
	   				ids += array[i].value;
	   				num = 1;
   				}
	   			else
	   			{
	   				ids += "," + array[i].value;
	   				num++;
	   			}
  			}
	   	}
		
		// 操作验证
		if (ids == "")
		{
			alert("请选择至少一条记录");
			$("#commodityManagerSubmit").val("0");
			return false;
		}
		
		if (num > 1)
		{
			alert("只能复制一条记录");
			$("#commodityManagerSubmit").val("0");
			return false;
		}
		
		$( "#commodityEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/copyCommodity.action?id=" + ids,async:false});
		$("#commodityForm").html(edit.responseText);
		
		return false;
	});
});
</script>
