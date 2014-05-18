<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:iterator  value="list" var="evt">
	<s:property value='#evt.area'/>♂
</s:iterator>

