<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row" >
	<div class="col-md-8 offset-md-2">	
		<h1 class="my-5"><i class="fas fa-images"></i> 갤러리 추가</h1> 
		<form:form commandName="gallery">
			<input type="hidden" name="owner" value="${USER.userId}">
			<div class="md-form">
				<label for="title">타이틀 </label>
				<form:input  path="title" class="form-control"/>
				<form:errors path="title" element="div" cssClass="error" />	
			</div>
			

			
		
			<div class="md-form">
				<label for="description">설명 </label>
				<form:textarea  path="description" class="form-control"
						rows="4"/>
			</div>
			
			<p>
				<button type="submit" class="btn btn-primary">
					<i class="fas fa-check"></i> 확인
				</button>
				<button type="reset" class="btn btn-success">
					<i class="fas fa-undo"></i> 취소
				</button>
			</p>	
		
		
		</form:form>
	</div>
</div>