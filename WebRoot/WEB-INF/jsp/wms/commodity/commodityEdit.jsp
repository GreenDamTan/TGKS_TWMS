<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<table>
	<input type="hidden" name="commodityEvt.id" id="commodityId" value="${commodityEvt.id }" />
	<tr>
		<td><label for="name">商品名称</label></td>
		<td><input type="text" name="commodityEvt.name" id="commodityName" class="text ui-widget-content ui-corner-all" value="${commodityEvt.name }" /></td>
		<td><label for="images">预览图片</label></td>
		<td><input type="text" name="commodityEvt.images" id="commodityImages" class="text ui-widget-content ui-corner-all" value="${commodityEvt.images }" /></td>
	</tr>
	<tr>
		<td><label for="name">商品编号</label></td>
		<td><input type="text" name="commodityEvt.code" id="commodityCode" class="text ui-widget-content ui-corner-all" value="${commodityEvt.code }" /></td>
		<td><label for="categoryId">商品类别</label></td>
		<td>
			<select id="commodityCategoryId" name="commodityEvt.categoryId">
				<s:iterator value="categoryList" var="evt">
					<s:if test="#evt.id == commodityEvt.categoryId">
						<option value="<s:property value='#evt.id'/>" selected="selected">
							<s:property value="#evt.name" />
						</option>
					</s:if>
					<s:else>
						<option value="<s:property value='#evt.id'/>" >
							<s:property value="#evt.name" />
						</option>
					</s:else>
				</s:iterator>
			</select>
		</td>
	</tr>
	<tr>
		<td><label for="brand">品牌</label></td>
		<td><input type="text" name="commodityEvt.brand" id="commodityBrand" class="text ui-widget-content ui-corner-all" value="${commodityEvt.brand }" /></td>
		<td><label for="type">型号</label></td>
		<td><input type="text" name="commodityEvt.type" id="commodityType" class="text ui-widget-content ui-corner-all" value="${commodityEvt.type }" /></td>
	</tr>
	<tr>
		<td><label for="details">详细信息</label></td>
		<td colspan="3"><textarea name="commodityEvt.details" id="commodityDetails" class="text ui-widget-content ui-corner-all" cols="93" rows="5">${commodityEvt.details }</textarea></td>
	</tr>
	<tr>
		<td><label for="supplierId">供货商</label></td>
		<td><input type="text" name="commodityEvt.supplierId" id="commoditySupplierId" class="text ui-widget-content ui-corner-all" value="${commodityEvt.supplierId }" /></td>
		<td><label for="url">进货网址</label></td>
		<td><input type="text" name="commodityEvt.url" id="commodityUrl" class="text ui-widget-content ui-corner-all" value="${commodityEvt.url }" /></td>
	</tr>
	<tr>
		<td><label for="price">进货价</label></td>
		<td><input type="text" name="commodityEvt.price" id="commodityPrice" class="text ui-widget-content ui-corner-all" value="${commodityEvt.price }" /></td>
		<td><label for="netPrice">网上参考报价</label></td>
		<td><input type="text" name="commodityEvt.netPrice" id="commodityNetPrice" class="text ui-widget-content ui-corner-all" value="${commodityEvt.netPrice }" /></td>
	</tr>
	<tr>
		<td><label for="remark">备注</label></td>
		<td colspan="3"><textarea name="commodityEvt.remark" id="commodityRemark" class="text ui-widget-content ui-corner-all" cols="93" rows="5">${commodityEvt.remark }</textarea></td>
	</tr>
</table>
<script type="text/javascript">
</script>