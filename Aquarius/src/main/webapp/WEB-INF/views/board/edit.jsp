<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="${context}/resources/bower_components/tinymce/tinymce.min.js">
</script>
<script>
$(function(){
	tinymce.init({ 
		selector:'textarea',
		height : "300"
	});
	
	$('.delete-attachment').click(function(e){
		e.preventDefault();
		
		var boardId = $('#boardId').val();
		var password = $('#password').val();
		var attachmentId = $(this).data('target');
		var parent = $(this).parent();
		if(password == '') {
			alert('비밀번호를 입력하세요');
			$('#password').focus();
			return;
		}
		
		var result = confirm("첨부파일을 삭제할까요?");
		
		var url='../delete_attachment';
		var params = {
				boardId : boardId,
				password : password,
				attachmentId : attachmentId
		};
		
		$.get(url, params, function(result) {
			// 결과 응답 데이터는 result로 전달됨
			if(result == 'ok') {
				alert('첨부파일을 삭제 했습니다.');
				// 추가로 해야할 일 ?
				parent.remove();
			} else {
				console.log(result);
				alert('삭제 실패 : ' + result);
			}
		});	
		
	});
	
})
</script>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>

<iot:page-header icon="edit" title="게시글 수정"/>

<form:form commandName="board"  enctype="multipart/form-data">
	<form:hidden path="boardId"/>
	<form:hidden path="writer"/>
	<div class="md-form">
		<label>제목</label>
		<form:input path="title" class="form-control"  
			required="required" />			
		<form:errors path="title"/>
	</div>

	<div class="mb-3">
		<label>작성자 : ${board.writer}</label>
	</div>

	<div class="md-form">
		<label>비밀번호</label>
		<form:password path="password"  class="form-control" 
		 	required="required"/>			
		<form:errors/>
	</div>
	<div class="row">
		<div class="col-md-2">첨부파일</div>
		<div class="col-md-10">
			<c:forEach var="file" items="${board.attachList}">
				<div>
					<i class="fa fa-file"></i> ${file.fileName}
					<a href="#" data-target="${file.attachmentId}"
						 class="delete-attachment">
						<i class="fa fa-trash"></i> 
					</a>
				</div>
			</c:forEach>	
		</div>	
	</div>		
	
	<div>
		<label>파일첨부</label>
		<input type="file" name="files" multiple="multiple">
	</div>
		<form:textarea path="content"/>		
	<div class="text-center mt-3">
		<button type="submit" class="btn btn-primary btn-md">
			<i class="fa fa-check mr-2"></i> 확인</button>
		<a href="../view/${board.boardId}?page=${param.page}" 
			class="btn btn-primary btn-md">
			<i class="fas fa-arrow-left mr-2"></i> 돌아가기</a>
	</div>
</form:form>





	