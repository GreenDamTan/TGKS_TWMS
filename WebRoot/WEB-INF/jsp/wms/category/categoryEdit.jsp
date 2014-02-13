<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<table>
	<input type="hidden" name="categoryEvt.id" id="categoryId" value="${categoryEvt.id }" />
	<tr>
		<td><label for="name">分类名</label></td>
		<td><input type="text" name="categoryEvt.name" id="categoryName" class="text ui-widget-content ui-corner-all" value="${categoryEvt.name }"/></td>
	</tr>
	<tr>
		<td><label for="preId">上级分类</label></td>
		<td>
			<select id="categoryPreId" name="categoryEvt.preId">
				<option value="0" >新分类</option>
				<s:iterator value="list" var="evt">
					<s:if test="#evt.id == categoryEvt.preId">
						<option value="<s:property value='#evt.id'/>" selected="selected">
							<s:property value="#evt.name" />
						</option>
					</s:if>
					<s:else>
						<option value="<s:property value='#evt.id'/>">
							<s:property value="#evt.name" />
						</option>
					</s:else>
				</s:iterator>
			</select>
		</td>
	</tr>
</table>
<script type="text/javascript">
</script>