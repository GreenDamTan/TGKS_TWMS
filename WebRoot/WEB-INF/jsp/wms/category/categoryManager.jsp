<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
#categoryReq{border:0px solid;}
#categoryReq td{border:0px solid;}
#categoryReq input{width:120px;}
#categoryReq select{width:120px;}
</style>
<input type="hidden" id="categoryManagerSubmit" name="categoryManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="categoryReq" action="../wms/queryCategory.action" method="post">
		<table>
			<tr>
				<td><label>菜单名称: </label></td><td><input type="text" name="categoryReq.name" /></td>
				<td><label>上级菜单: </label></td>
				<td>
					<select name="categoryReq.preId">
						<option value="" ></option>
						<s:iterator value="list" var="evt">
							<option value="<s:property value='#evt.id'/>">
								<s:property value="#evt.name" />
							</option>
						</s:iterator>
					</select>
				</td>
				</td><td></td><td>
				</td><td></td><td>
				<td>
				<button id="clearCategory">重置</button>
				<button id="queryCategory">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addCategory">新增</button>
<button id="deleteCategory">删除</button>

<div id="categoryDiv"></div>

<div id="categoryEdit" title="分类信息编辑">
	<form id="categoryForm" action="../wms/editCategory.action" method="post"></form>
</div>

<div id="categoryConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	function query()
	{
		var table=$.ajax({url:"../wms/queryCategory.action", data:$("#categoryReq").formSerialize(), async:false});
		$("#categoryDiv").html(table.responseText);
	}
	
	query();
	
	// 新增/更新窗口
	$( "#categoryEdit" ).dialog({
		height:500,
		width:750,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				var form = $("#categoryForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#categoryManagerSubmit").val("0");
				$("#categoryEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#categoryForm").submit(function()
	{
		if ($("#categoryManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#categoryManagerSubmit").val("0");
		
		var options = { 
			url:"../wms/editCategory.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#categoryEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#categoryEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#categoryForm").ajaxSubmit(options);
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addCategory" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		$("#categoryManagerSubmit").val("1");
		$( "#categoryEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../wms/editCategoryPage.action",async:false});
		$("#categoryForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteCategory" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#categoryManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("categoryId");
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
			$("#categoryManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../wms/deleteCategory.action?ids=" + ids , // 提交给哪个执行
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
		$("#categoryConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#categoryConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
				
		return false;
	});
	 
	 // 刷新按钮
	$( "#queryCategory" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearCategory" ).button().click(function() {
			$("#categoryReq").clearForm();
		return false;
	});
});
</script>
