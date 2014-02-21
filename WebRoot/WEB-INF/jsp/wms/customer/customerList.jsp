<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="customerListSubmit" name="customerListSubmit" value="0" />
<div id="customerTableDiv" class="ui-widget">
    <table id="customerTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allCustomerId" name="allCustomerId"/></th>
				<th>供应商名称</th>
				<th>主营商品类别</th>
				<th>联系人</th>
				<th>手机</th>
				<th>QQ</th>
				<th>阿里旺旺</th>
				<th>网址URL</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="customerId" value="<s:property value='#evt.id'/>"/></td>
					<td><b id="<s:property value='#evt.id'/>" class="customerUpdate"><s:property value="#evt.name"/></b></td>
					<td><s:property value="#evt.category"/></td>
					<td><s:property value="#evt.person"/></td>
					<td><s:property value="#evt.mobile"/></td>
					<td>
						<s:if test="#evt.qq==''">
								无信息
							</s:if>
							<s:else>
								<a target="blank" href="tencent://message/?uin=<s:property value='#evt.qq'/>&Site=www.0dunet.com&Menu=no">
									<img border="0" src="http://wpa.qq.com/pa?p=1:<s:property value='#evt.qq'/>:42" alt="点这里">
								</a>
								<s:property value="#evt.qq"/>
							</s:else>
					</td>
					<td>
						<s:if test="#evt.alww==''">
							无信息
						</s:if>
						<s:else>
							<a target="_blank" href="http://www.taobao.com/webww/ww.php?ver=3&touid=<s:property value='#evt.alww'/>&siteid=cntaobao&status=1&charset=utf-8">
								<img border="0" src="http://amos.alicdn.com/realonline.aw?v=2&uid=<s:property value='#evt.alww'/>&site=cntaobao&s=1&charset=utf-8" alt="点击这里给我发消息" />
							</a>
							<s:property value="#evt.alww"/>
						</s:else>
					</td>
					<td><a href='<s:property value="#evt.url"/>'  target="new_window">点击进入</a></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$("#customerTable").longtable({
			'perPage' : 8
		});

		// 点击记录首栏进入更新操作
		$(".customerUpdate").click(function() {
			$("#customerManagerSubmit").val("1");
			$("#customerEdit").dialog("open");
			var edit = $.ajax({
				url : "../wms/editCustomerPage.action?id=" + this.id,
				async : false
			});
			$("#customerForm").html(edit.responseText);
		});

		// 全选
		$("#allCustomerId").click(function() {
			var checkbox = $("#customerTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
