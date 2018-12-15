<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ attribute name="label" required="true" type="String" %>
<%@ attribute name="path" required="true" type="String" %>

<div class="md-form">
	<label for="${path}">${label} </label>
	<form:input  path="${path}" class="form-control"/>
	<form:errors path="${path}" element="div" cssClass="error" />	
</div>