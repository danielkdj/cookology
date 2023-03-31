	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>Cookology - Home</title>
	<!-- Favicon -->
<link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png" />
	<!-- Core Stylesheet -->
<link href="/cookology/resources/css/style.css" rel="stylesheet" />
<link href="/cookology/resources/css/responsive/reponsive.css"
	rel="stylesheet" />
</head>
<body>

	<!-- Header Start -->
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<!-- Header End -->
	
	<!-- ****** Welcome Post Area Start ****** -->
	<section class="welcome-post-sliders owl-carousel">
		<!-- Single Slide -->
		<div class="welcome-single-slide">
			<!-- Post Thumb -->
			<img src="/cookology/resources/img/bg-img/slide-1.jpg" alt="맛있는 음식 사진" />
			<!-- Overlay Text -->
			<div class="project_title">
				<div class="post-date-commnents d-flex">
					<a href="#">March 16, 2023</a> <a href="#">5 Comment</a>
				</div>
				<a href="#">
					<h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
				</a>
			</div>
		</div>

		<!-- Single Slide -->
		<div class="welcome-single-slide">
			<!-- Post Thumb -->
			<img src="/cookology/resources/img/bg-img/slide-2.jpg" alt="맛있는 음식 사진" />
			<!-- Overlay Text -->
			<div class="project_title">
				<div class="post-date-commnents d-flex">
					<a href="#">March 13, 2023</a> <a href="#">5 Comment</a>
				</div>
				<a href="#">
					<h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
				</a>
			</div>
		</div>

		<!-- Single Slide -->
		<div class="welcome-single-slide">
			<!-- Post Thumb -->
			<img src="/cookology/resources/img/bg-img/slide-3.jpg" alt="맛있는 음식 사진" />
			<!-- Overlay Text -->
			<div class="project_title">
				<div class="post-date-commnents d-flex">
					<a href="#">March 11, 2023</a> <a href="#">5 Comment</a>
				</div>
				<a href="#">
					<h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
				</a>
			</div>
		</div>

		<!-- Single Slide -->
		<div class="welcome-single-slide">
			<!-- Post Thumb -->
			<img src="/cookology/resources/img/bg-img/slide-4.jpg" alt="맛있는 음식 사진" />
			<!-- Overlay Text -->
			<div class="project_title">
				<div class="post-date-commnents d-flex">
					<a href="#">March 3, 2023</a> <a href="#">5 Comment</a>
				</div>
				<a href="#">
					<h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
				</a>
			</div>
		</div>

		<!-- Single Slide -->
		<div class="welcome-single-slide">
			<!-- Post Thumb -->
			<img src="/cookology/resources/img/bg-img/slide-2.jpg" alt="맛있는 음식 사진" />
			<!-- Overlay Text -->
			<div class="project_title">
				<div class="post-date-commnents d-flex">
					<a href="#">March 8, 2023</a> <a href="#">5 Comment</a>
				</div>
				<a href="#">
					<h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
				</a>
			</div>
		</div>
	</section>
	<!-- ****** Welcome Area End ****** -->
	
	<!-- ****** Categories Area Start ****** -->
	<section class="categories_area clearfix" id="about">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single_catagory wow fadeInUp" data-wow-delay=".3s">
						<img src="/cookology/resources/img/catagory-img/1.jpg" alt="" />
						<div class="catagory-title">
							<a href="#">
								<h5>오늘의 레시피</h5>
							</a>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single_catagory wow fadeInUp" data-wow-delay=".6s">
						<img src="/cookology/resources/img/catagory-img/2.jpg" alt="" />
						<div class="catagory-title">
							<a href="#">
								<h5>추천 메뉴</h5>
							</a>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single_catagory wow fadeInUp" data-wow-delay=".9s">
						<img src="/cookology/resources/img/catagory-img/3.jpg" alt="" />
						<div class="catagory-title">
							<a href="#">
								<h5>주문하기</h5>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ****** Categories Area End ****** -->

	<!-- ****** Blog Area Start ****** -->
	<section class="blog_area section_padding_0_80">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-8">
					<div class="row">
						<!-- Single Post -->
						<div class="col-12">
							<div class="single-post wow fadeInUp" data-wow-delay=".2s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<img src="/cookology/resources/img/blog-img/1.jpg" alt="" />
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">By Marian</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">May 19, 2017</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
													class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
													class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h2 class="post-headline">Boil The Kettle And Make A Cup
											Of Tea Folks, This Is Going To Be A Big One!</h2>
									</a>
									<p>Tiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation
										ullamco laboris nisi ut aliquip ex ea commodoconsequat.</p>
									<a href="#" class="read-more">Continue Reading..</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12 col-md-6">
							<div class="single-post wow fadeInUp" data-wow-delay=".4s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<img src="/cookology/resources/img/blog-img/2.jpg" alt="" />
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">By Marian</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">May 19, 2017</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
													class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
													class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">Where To Get The Best Sunday
											Roast In The Cotswolds</h4>
									</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12 col-md-6">
							<div class="single-post wow fadeInUp" data-wow-delay=".6s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<img src="/cookology/resources/img/blog-img/3.jpg" alt="" />
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">By Marian</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">May 19, 2017</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
													class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
													class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">The Top Breakfast And Brunch
											Spots In Hove, Brighton</h4>
									</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12 col-md-6">
							<div class="single-post wow fadeInUp" data-wow-delay=".8s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<img src="/cookology/resources/img/blog-img/4.jpg" alt="" />
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">By Marian</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">May 19, 2017</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
													class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
													class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">The 10 Best Pubs In The Lake
											District, Cumbria</h4>
									</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12 col-md-6">
							<div class="single-post wow fadeInUp" data-wow-delay="1s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<img src="/cookology/resources/img/blog-img/5.jpg" alt="" />
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">By Marian</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">May 19, 2017</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
													class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
													class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">The 10 Best Brunch Spots In
											Newcastle, England</h4>
									</a>
								</div>
							</div>
						</div>

						<!-- ******* List Blog Area Start ******* -->

						<!-- Single Post -->
						<div class="col-12">
							<div class="list-blog single-post d-sm-flex wow fadeInUpBig"
								data-wow-delay=".2s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<img src="/cookology/resources/img/blog-img/6.jpg" alt="" />
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">By Marian</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">May 19, 2017</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
													class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
													class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">The 10 Best Bars By The Seaside
											In Blackpool, UK</h4>
									</a>
									<p>Tiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
									<a href="#" class="read-more">Continue Reading..</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12">
							<div class="list-blog single-post d-sm-flex wow fadeInUpBig"
								data-wow-delay=".4s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<img src="/cookology/resources/img/blog-img/7.jpg" alt="" />
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">By Marian</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">May 19, 2017</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
													class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
													class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">How To Get a Narcissist to Feel
											Empathy</h4>
									</a>
									<p>Tiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
									<a href="#" class="read-more">Continue Reading..</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12">
							<div class="list-blog single-post d-sm-flex wow fadeInUpBig"
								data-wow-delay=".6s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<img src="/cookology/resources/img/blog-img/8.jpg" alt="" />
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">By Marian</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">May 19, 2017</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
													class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
													class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">Bristol's 10 Amazing Weekend
											Brunches And Late Breakfasts</h4>
									</a>
									<p>Tiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
									<a href="#" class="read-more">Continue Reading..</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12">
							<div class="list-blog single-post d-sm-flex wow fadeInUpBig"
								data-wow-delay=".8s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<img src="/cookology/resources/img/blog-img/9.jpg" alt="" />
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">By Marian</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">May 19, 2017</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
													class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
													class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">10 Of The Best Places To Eat In
											Liverpool, England</h4>
									</a>
									<p>Tiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
									<a href="#" class="read-more">Continue Reading..</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- ****** Blog Sidebar ****** -->
				<div class="col-12 col-sm-8 col-md-6 col-lg-4">
					<div class="blog-sidebar mt-5 mt-lg-0">
						<!-- Single Widget Area -->
						<div class="single-widget-area about-me-widget text-center">
							<div class="widget-title">
								<h6>이달의 레시피</h6>
							</div>

							<h4 class="font-shadow-into-light">Shopia Bernard</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt</p>
						</div>

						<!-- Single Widget Area -->
						<div class="single-widget-area subscribe_widget text-center">
							<div class="widget-title">
								<h6>Subscribe &amp; Follow</h6>
							</div>
							<div class="subscribe-link">
								<a href="#"><i class="fa fa-facebook"
									aria-hidden="true"></i></a> <a href="#"><i
									class="fa fa-twitter" aria-hidden="true"></i></a> <a href="#"><i
									class="fa fa-google" aria-hidden="true"></i></a> <a href="#"><i
									class="fa fa-linkedin-square" aria-hidden="true"></i></a> <a
									href="#"><i class="fa fa-instagram"
									aria-hidden="true"></i></a> <a href="#"><i class="fa fa-vimeo"
									aria-hidden="true"></i></a>
							</div>
						</div>

						<!-- Single Widget Area -->
						<div class="single-widget-area popular-post-widget">
							<div class="widget-title text-center">
								<h6>많이 본 레시피</h6>
							</div>
							<!-- Single Popular Post -->
							<div class="single-populer-post d-flex">
								<img src="/cookology/resources/img/sidebar-img/1.jpg" alt="" />
								<div class="post-content">
									<a href="#">
										<h6>Top Wineries To Visit In England</h6>
									</a>
									<p>Tuesday, October 3, 2017</p>
								</div>
							</div>
							<!-- Single Popular Post -->
							<div class="single-populer-post d-flex">
								<img src="/cookology/resources/img/sidebar-img/2.jpg" alt="" />
								<div class="post-content">
									<a href="#">
										<h6>The 8 Best Gastro Pubs In Bath</h6>
									</a>
									<p>Tuesday, October 3, 2017</p>
								</div>
							</div>
							<!-- Single Popular Post -->
							<div class="single-populer-post d-flex">
								<img src="/cookology/resources/img/sidebar-img/3.jpg" alt="" />
								<div class="post-content">
									<a href="#">
										<h6>Zermatt Unplugged the best festival</h6>
									</a>
									<p>Tuesday, October 3, 2017</p>
								</div>
							</div>
							<!-- Single Popular Post -->
							<div class="single-populer-post d-flex">
								<img src="/cookology/resources/img/sidebar-img/4.jpg" alt="" />
								<div class="post-content">
									<a href="#">
										<h6>Harrogate's Top 10 Independent Eats</h6>
									</a>
									<p>Tuesday, October 3, 2017</p>
								</div>
							</div>
							<!-- Single Popular Post -->
							<div class="single-populer-post d-flex">
								<img src="/cookology/resources/img/sidebar-img/5.jpg" alt="" />
								<div class="post-content">
									<a href="#">
										<h6>Eating Out On A Budget In Oxford</h6>
									</a>
									<p>Tuesday, October 3, 2017</p>
								</div>
							</div>
						</div>

						<!-- Single Widget Area -->
						<div class="single-widget-area add-widget text-center">
							<div class="add-widget-area">
								<img src="/cookology/resources/img/sidebar-img/6.jpg" alt="" />
								<div class="add-text">
									<div class="yummy-table">
										<div class="yummy-table-cell">
											<h2>Cooking Book</h2>
											<p>Buy Book Online Now!</p>
											<a href="#" class="add-btn">Buy Now</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Single Widget Area -->
						<div class="single-widget-area newsletter-widget">
							<div class="widget-title text-center">
								<h6>Newsletter</h6>
							</div>
							<p>Subscribe our newsletter gor get notification about new
								updates, information discount, etc.</p>
							<div class="newsletter-form">
								<form action="#" method="post">
									<input type="email" name="newsletter-email" id="email"
										placeholder="Your email" />
									<button type="submit">
										<i class="fa fa-paper-plane-o" aria-hidden="true"></i>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ****** Blog Area End ****** -->


	
	<!-- Footer Start -->
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<!-- Footer End -->

	<!-- ****** Footer Menu Area Start ****** -->
	<footer class="footer_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="footer-content">
						<!-- Logo Area Start -->
						<div class="footer-logo-area text-center">
							<a href="${ pageContext.servletContext.contextPath}/main.do" class="yummy-logo">
								Cookology</a>
						</div>
						<!-- Menu Area Start -->
						<nav class="navbar navbar-expand-lg">
							<button class="navbar-toggler" type="button"
									data-toggle="collapse" data-target="#yummyfood-footer-nav"
									aria-controls="yummyfood-footer-nav" aria-expanded="false"
									aria-label="Toggle navigation">
								<i class="fa fa-bars" aria-hidden="true"></i> Menu
							</button>
							<!-- Menu Area Start -->
							<div class="collapse navbar-collapse justify-content-center"
								 id="yummyfood-footer-nav">
								<ul class="navbar-nav">
									<li class="nav-item active"><a class="nav-link"
																   href="${ pageContext.servletContext.contextPath}/main.do">Home <span
											class="sr-only">(current)</span></a></li>
									<li class="nav-item"><a class="nav-link" href="best.html">베스트</a>
									</li>
									<li class="nav-item"><a class="nav-link"
															href="recipes.html">레시피</a></li>
									<li class="nav-item"><a class="nav-link" href="event.html">이벤트</a>
									</li>
									<li class="nav-item"><a class="nav-link"
															href="contact.html">배송조회</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>