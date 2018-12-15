<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<h1 class="my-5">회원 정보 수정</h1>

<form:form commandName="member"  enctype="multipart/form-data">
	<form:hidden path="userId" />
	<form:hidden path="name" />
	<div>
		<label>사용자 ID</label>
		<p>
			<img src="avata/${USER.userId}"
				class="rounded-circle avata-sm" >
			${member.userId}</p>
	</div>

	<div>
		<label for="name">이름</label>
		<p>${member.name}</p>
	</div>
	<div>
		<label>아바타</label>
		<p><input type="file" name="avata"/></p>
	</div>


	<div>
		<label for="name">사용자 레벨</label>
		<p>${member.userLevel}</p>
	</div>

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
		<label for="password">비밀번호</label>
		<form:password path="password" class="form-control"/>
		<form:errors cssClass="error"/>
	</div>
	
	<div class="row mt-3">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<button type="submit" class="btn btn-primary">확인</button>
			<a href="view" class="btn btn-primary">돌아가기</a>			
		</div>
	</div>

</form:form>
