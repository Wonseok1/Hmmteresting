<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	
	<div class="row my-3">
		<!--Grid column-->
		<c:forEach var="board" items="${list}" varStatus="status">
			<div class="col-lg-4 col-md-12">
				<div class="card">
					<div class="view overlay">
						<img src="resources/images/Koala.jpg" class="card-img-top" alt="">
						<a href="#">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>
					<div class="card-body">
						
							<h4 class="card-title">${board.title}</h4>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="col-lg-4 col-md-6">
			<div class="card">
				<div class="view overlay">
					<img src="resources/images/Lighthouse.jpg" class="card-img-top"
						alt=""> <a href="#">
						<div class="mask rgba-white-slight"></div>
					</a>
				</div>
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#!" class="btn btn-primary">Button</a>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6">
			<div class="card">
				<div class="view overlay">
					<img src="resources/images/Tulips.jpg" class="card-img-top" alt="">
					<a href="#">
						<div class="mask rgba-white-slight"></div>
					</a>
				</div>
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#!" class="btn btn-primary">Button</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row my-3">
		<!--Grid column-->
		<div class="col-lg-4 col-md-12">
			<div class="card">
				<div class="view overlay">
					<img src="resources/images/Koala.jpg" class="card-img-top" alt="">
					<a href="#">
						<div class="mask rgba-white-slight"></div>
					</a>
				</div>
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#!" class="btn btn-primary">Button</a>
				</div>
			</div>

		</div>
		<div class="col-lg-4 col-md-6">
			<div class="card">
				<div class="view overlay">
					<img src="resources/images/Lighthouse.jpg" class="card-img-top"
						alt=""> <a href="#">
						<div class="mask rgba-white-slight"></div>
					</a>
				</div>
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#!" class="btn btn-primary">Button</a>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6">
			<div class="card">
				<div class="view overlay">
					<img src="resources/images/Tulips.jpg" class="card-img-top" alt="">
					<a href="#">
						<div class="mask rgba-white-slight"></div>
					</a>
				</div>
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#!" class="btn btn-primary">Button</a>
				</div>
			</div>
		</div>
	</div>
</div>