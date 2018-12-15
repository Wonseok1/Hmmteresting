<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<h1 class="my-5 text-center">
	<i class="fas fa-images"></i> ${gallery.title}
</h1>
<p>
	${gallery.description}
</p>


<div id="carousel-example-2" class="carousel slide carousel-fade" 
		data-ride="carousel">
  <!--Indicators-->
  <ol class="carousel-indicators">
	<c:forEach var="image" items="${gallery.list}" varStatus="status">
		<li data-target="#carousel-example-2" 
			data-slide-to="${status.index}"
			<c:if test="${status.first}">class="active"</c:if>			
		></li>
	</c:forEach>  
  </ol>

  <!--Slides-->
  <div class="carousel-inner" role="listbox">
  	<c:forEach var="image" items="${gallery.list}" varStatus="status">
	    <div class="carousel-item <c:if test='${status.first}'>active</c:if>">
	      <div class="view">
	        <img class="d-block w-100" src="../image/${image.imageId}">
	        <div class="mask rgba-black-light"></div>
	      </div>
	    </div>
    </c:forEach>
  </div>

  <!--Controls-->
  <a class="carousel-control-prev" href="#carousel-example-2" 
  		role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
  </a>
  <a class="carousel-control-next" href="#carousel-example-2" 
  		role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
  </a>
  
</div>









<%--
<h4>이미지 파일 목록</h4>
<ul>
	<c:forEach var="image" items="${gallery.list}">
		<li>
			<img src="../thumb/${image.imageId}" alt="${image.fileName}"><br>
			${image.title} 
			<a href="../download/${image.imageId}">
				<i class="fas fa-download"></i></a>
		</li>
	</c:forEach>
</ul>
 --%>

		
		









