<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   
<div class="row" >

	<div class="col-md-6 offset-md-3">
		<h1 class="my-5">로그인</h1>
		  
		<c:if test="${not empty login.reason}">
			<div class="alert alert-warning">
			  <strong>${login.reason}</strong> 
			  </div>
		</c:if>
		
		<form:form commandName="login">
			<form:hidden path="url"/>

			<div class="md-form">
				<label for="userId">사용자 ID</label>
			    <form:input path="userId" class="form-control"/>
			</div>
			
			<div class="md-form">
			    <label for="password">비밀번호</label>			
			    <form:password path="password" class="form-control"/>
			</div>
			
			<div class="error">${error}</div>
			<button class="btn btn-info btn-block my-4" type="submit">Sign in</button>

		</form:form>
	</div>
	
</div>


