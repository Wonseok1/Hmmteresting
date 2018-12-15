<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<h1 class="my-5">회원 정보 수정</h1>

<form:form commandName="member">
	<form:hidden path="userId" />
	<form:hidden path="name" />
	<div>
		<label>사용자 ID</label>
		<p>${member.userId}</p>
	</div>

	<div>
		<label for="name">이름</label>
		<p>${member.name}</p>
	</div>

	<label for="userLevel">권한</label>
	<form:select path="userLevel" items="${userLevels}" />

	<div class="md-form">
		<label for="nickName">닉네임</label>
		<form:input path="nickName" class="form-control"/>
	</div>

	<div class="md-form">
		<label for="phoneNumber">전화번호</label>
		<form:input path="phoneNumber" class="form-control"/>
		<form:errors path="phoneNumber" cssClass="error"/>
	</div>
	
	<div class="md-form">
		<label for="email">email</label>
		<form:input path="email" class="form-control"/>
		<form:errors path="email" cssClass="error"/>
	</div>	
	
	<div class="md-form">
		<label for="address">주소</label>
		<form:input path="address" class="form-control"/>
	</div>	
	
	<div class="md-form">
		<label for="password">관리자 비밀번호</label>
		<form:password path="password" class="form-control"/>
		<form:errors cssClass="error"/>
	</div>
	
	<div class="row mt-3">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<button type="submit" class="btn btn-primary">확인</button>
			<a href="../view/${member.userId}?page=${param.page}" 
					class="btn btn-primary">돌아가기</a>			
		</div>
	</div>

</form:form>
