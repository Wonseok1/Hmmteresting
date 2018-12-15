<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row" >
	<div class="col-md-8 offset-md-2">	
		<h1 class="my-5"><i class="fas fa-images"></i> 갤러리 수정</h1> 
		<form:form commandName="gallery">
			<form:hidden path="galleryId"/>
			<form:hidden path="owner"/>
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
		
		
		<h4>이미지 파일 목록</h4>
		<ul>
			<c:forEach var="image" items="${gallery.list}">
				<li>${image.fileName}</li>
			</c:forEach>
		</ul>
		
		
		
		<!--  파일 업로드 FORM 구성 -->
		<hr>
		
<h4>이미지 파일 추가</h4>
<form action="add_images" method="post" 
	enctype="multipart/form-data">
	<input type="hidden" name="galleryId" 
			value="${gallery.galleryId}">
	<div class="md-form">
		<label>타이틀</label>
		<input type="text" name="title" class="form-control">
	</div>
	<div class="md-form">
		<label>출처</label>
		<input type="text" name="source" class="form-control">
	</div>
	<input type="file" name="files" 
		multiple="multiple" accept="image/*" required>
	<p>
		<button type="submit" class="btn btn-primary">
			<i class="fas fa-check"></i> 확인
		</button>
		<button type="reset" class="btn btn-success">
			<i class="fas fa-undo"></i> 취소
		</button>
	</p>
</form>
		
	</div>
</div>











