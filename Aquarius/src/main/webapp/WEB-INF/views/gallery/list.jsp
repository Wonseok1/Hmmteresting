<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
  
<h1 class="my-5"><i class="fas fa-images"></i> 갤러리</h1> 

<div>
	<div class="float-left">
		<form action="list">
			정렬 기준 
			<select name="orderBy">
				<option value="gallery_id"  
					<c:if test="${orderBy=='gallery_id'}">selected</c:if>
				>등록일</option>
				<option value="read_cnt"
					<c:if test="${orderBy=='read_cnt'}">selected</c:if>    
				>조회수</option>
			</select>
			<button type="submit"
				class="btn btn-primary btn-sm"
			><i class="fas fa-share-square"></i></button>
		</form>
	</div>
	<div class="float-right">
		<a href="create"><i class="fas fa-plus"></i> 추가</a>
		/ 전체 : ${pagination.total} 건
	</div>
</div>

<table class="table table-striped">
	<thead>
		<tr>
			<th>#</th>
			<th>타이틀</th>
			<th>소유자</th>
			<th>이미지#</th>
			<th><a href="?orderBy=read_cnt">조회수</a></th>
			<th><a href="?orderBy=reg_date">등록일</a></th>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list}" varStatus="status">
			<fmt:formatDate var="regDate" value="${item.regDate}" 
					pattern="yyyy-MM-dd"/>
			<tr>
				<td>${item.galleryId}</td>
				<td>
					<a href="view/${item.galleryId}?page=${pagination.page}">
						<c:if test="${not empty item.list[0]}">
							<img src="thumb/${item.list[0].imageId}"
								width="30">
						</c:if>	
						${item.title}</a>
					<c:if test="${today==regDate}">
						<span class="badge badge-pill badge-danger">
							<i class="fas fa-tag"></i> New</span>
					</c:if> 
				</td>
				<td>${item.owner}</td>
				
				<td>${item.list.size()}</td>
				<td>${item.readCnt}</td>
				<td>${regDate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<iot:pagination />

