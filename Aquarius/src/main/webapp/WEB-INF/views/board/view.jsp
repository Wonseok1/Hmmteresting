<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
<script>
$(function(){
	$('#delete-btn').click(function(e){
		e.preventDefault();
		$('.password-panel').show();		
	});	
	
	$('#delete-cancel').click(function(){
		$('#password').val('');
		$('.password-panel').hide();		
	});
	
	$('#delete-confirm').click(function(){
		var password = $('#password').val();
		var boardId = $(this).data('target');
		if(password == '') {
			alert('비밀번호를 입력하세요');
			$('#password').focus();
			return;
		}
		
		var result = confirm("게시글을 삭제할까요?");
		if(!result) return;
		
		var url='../delete';
		var params = {
				boardId : boardId,
				password : password,
		};
		
		$.get(url, params, function(result) {
			if(result == 'ok') {
				// 어디로 어떻게 이동할 것인가?
				location = '../list';		
			} else {
				alert('삭제 실패 : ' + result);
			}
		});	
	})
});

</script>


<iot:page-header title="${board.title}"/>

<div class="text-right">
	작성자: 
		<img src="${context}/member/avata/${board.writer}" class="rounded-circle avata-sm" > 
		${board.writer}/ 
	조회수: ${board.readCnt}/
	수정일: <fmt:formatDate value="${board.updateDate}" 
				pattern="yyyy-MM-dd"/>
</div>	
<div  class="text-right">
	<c:if test="${not empty board.attachList }">
	첨부파일 : 
	<c:forEach var="file" items="${board.attachList}">
		<a href="../download/${file.attachmentId}">
			<i class="fa fa-download"></i> ${file.fileName}
		</a>
		<br>
	</c:forEach>	
	</c:if>
</div>		
<hr/>
<div>
	<c:forEach var="file" items="${board.attachList}">
		<img src="../download/${file.attachmentId}">
		<br>
	</c:forEach>
	${board.content}
	
</div>

<c:if test="${not empty USER}">
	<jsp:include page="reply-form.jsp" />
</c:if>
<div id="reply-list" class="mt-5">
	<jsp:include page="reply-list.jsp" />
</div>

<div class="text-center">
	<c:if test="${USER.userId == board.writer }">
		<a href="../edit/${board.boardId}?page=${param.page}" class="mr-4">
			<i class="fas fa-edit mr-2"></i> 수정</a>
		<a href="#" id="delete-btn" class="mr-4">
			<i class="fas fa-trash mr-2"></i> 삭제</a>
	</c:if>	
	<a href="../list?page=${param.page}">
			<i class="fas fa-arrow-left mr-2"></i> 돌아가기</a>
</div>

<div class="password-panel text-center my-3"
		style="display:none">
	삭제 비밀번호 : <input type="password" id="password">
	<button type="button" id="delete-confirm" 
			data-target="${board.boardId}">확인</button>
	<button type="button" id="delete-cancel">취소</button>
</div>







