<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="expressCompanyEvt.id" id="expressCompanyId" value="${expressCompanyEvt.id }" />
<table>
	<tr>
		<td><label>名称</label></td>
		<td><input type="text" name="expressCompanyEvt.name" id="expressCompanyName" value="${expressCompanyEvt.name }" /></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td><label>电话</label></td>
		<td><input type="text" name="expressCompanyEvt.tel" id="expressCompanyTel" value="${expressCompanyEvt.tel }" /></td>
		<td><label>手机</label></td>
		<td><input type="text" name="expressCompanyEvt.mobile" id="expressCompanyMobile" value="${expressCompanyEvt.mobile }" /></td>
	</tr>
	<tr>
		<td><label>网址</label></td>
		<td colspan="3"><input type="text" name="expressCompanyEvt.web" id="expressCompanyWeb" value="${expressCompanyEvt.web }" size="105"/></td>
	</tr>
	<tr>
		<td><label>备注</label></td>
		<td colspan="3"><textarea name="expressCompanyEvt.remark" id="expressRemark" cols="105" rows="5">${expressCompanyEvt.remark }</textarea></td>
	</tr>
</table>
<script type="text/javascript">
</script>