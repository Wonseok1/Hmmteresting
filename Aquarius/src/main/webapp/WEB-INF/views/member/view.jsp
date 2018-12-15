<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<h1 class="my-5">회원 정보 보기</h1> 

<div class="row">
	<div class="col-md-2">사용자 ID</div>
	<div class="col-md-10">
		<img src="avata/${USER.userId}"
			class="rounded-circle avata-sm" ><br>
		${USER.userId}
	</div>
</div>

<div class="row">
	<div class="col-md-2">이름</div>
	<div class="col-md-10">${USER.name}</div>
</div>
<div class="row">
	<div class="col-md-2">레벨</div>
	<div class="col-md-10">${USER.userLevel}</div>
</div>
<div class="row">
	<div class="col-md-2">닉네임</div>
	<div class="col-md-10">${USER.nickName}
	</div>
</div>

<div class="row">
	<div class="col-md-2">전화번호</div>
	<div class="col-md-10">${USER.phoneNumber}</div>
</div>
<div class="row">
	<div class="col-md-2">email</div>
	<div class="col-md-10">${USER.email}</div>
</div>
<div class="row">
	<div class="col-md-2">주소</div>
	<div class="col-md-10">${USER.address}</div>
</div>
<div class="row">
	<div class="col-md-2">등록일</div>
	<div class="col-md-10"><fmt:formatDate value="${USER.regDate}" pattern="yyyy-MM-dd"/></div>
</div>
<div class="row">
	<div class="col-md-2">수정일</div>
	<div class="col-md-10"><fmt:formatDate value="${USER.updateDate}" pattern="yyyy-MM-dd"/></div>

</div>
	
<div class="row mt-3">
	<div class="col-md-2"></div>
	<div class="col-md-10">
		<a href="edit" class="btn btn-primary btn-sm">수정</a>
	</div>
</div>


   