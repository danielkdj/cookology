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
<link rel="stylesheet" href="/cookology/resources/css/style.css"/>
<link rel="stylesheet" href="/cookology/resources/css/responsive/reponsive.css "/>
<style>
	.post-favourite:hover .reaction,
	.post-comments:hover .reaction{
		color: #fc6c3f;
	}
	{
		color: #fc6c3f;
	}

</style>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var elements = document.querySelectorAll('.post-favourite a, .post-comments a');

			elements.forEach(function(element) {
				element.addEventListener('click', function(event) {
					event.preventDefault();

					var parentElement = event.target.closest('.post-favourite, .post-comments');
					var counterValueElement = parentElement.querySelector('.counterValue');
					var counterValue = parseInt(counterValueElement.textContent.replace(/\D/g, ''), 10);

					if (isNaN(counterValue)) {
						counterValue = 0;
					}

					counterValue += 1;
					counterValueElement.textContent = counterValue.toLocaleString();
				});
			});
		});
	</script>
</head>
<body>

	<!-- Header Start -->
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<!-- Header End -->

	<!-- RecentViewPopup Start -->
	<c:import url="/WEB-INF/views/common/recentView.jsp"></c:import>
	<!-- RecentViewPopup End -->

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
								<h5>내 주변 맛집 찾기</h5>
							</a>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single_catagory wow fadeInUp" data-wow-delay=".6s">
						<img src="/cookology/resources/img/catagory-img/2.jpg" alt="" />
						<div class="catagory-title">
							<a href="#">
								<h5>레시피 구경하기</h5>
							</a>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single_catagory wow fadeInUp" data-wow-delay=".9s">
						<img src="/cookology/resources/img/catagory-img/3.jpg" alt="" />
						<div class="catagory-title">
							<a href="#">
								<h5>밀키트 구매하기</h5>
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
														class="fa fa-heart-o reaction" aria-hidden="true"></i> <span class="counterValue reaction"> 157,759</span></a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
														class="fa fa-comment-o reaction" aria-hidden="true"></i><span class="reaction">&nbsp;9,125</span></a>
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
							<h4 style="text-align: center; color: #ff5932">이번 달 화제의 레시피</h4><br>
						</div>

						<!-- Single Post -->

						<div class="col-12 col-md-6">
							<div class="single-post wow fadeInUp" data-wow-delay=".4s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe src='https://www.youtube.com/embed//87zznFb0-us' frameborder='0' allowfullscreen></iframe></div>
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">백종원</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">Mar 23, 2023</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
														class="fa fa-heart-o reaction" aria-hidden="true"></i> <span class="counterValue reaction"> 414,939</span></a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
														class="fa fa-comment-o reaction" aria-hidden="true"></i><span class="reaction">&nbsp;6,925</span></a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">어묵탕 지겨우셨죠? 오늘 저녁, 빨간 어묵으로 끝내드릴게요!</h4>
									</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12 col-md-6">
							<div class="single-post wow fadeInUp" data-wow-delay=".6s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe src='https://www.youtube.com/embed//2D7KgPqJV-c' frameborder='0' allowfullscreen></iframe></div>
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">
													KBS</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">Feb 17, 2023</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
														class="fa fa-heart-o reaction" aria-hidden="true"></i> <span class="counterValue reaction"> 41,334</span></a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
														class="fa fa-comment-o reaction" aria-hidden="true"></i><span class="reaction">&nbsp;547</span></a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">석화구이 비주얼의 한판 굴전! 이렇게 쉬운 굴전이라니★</h4>
									</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12 col-md-6">
							<div class="single-post wow fadeInUp" data-wow-delay=".8s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe src='https://www.youtube.com/embed//SILoOGBiAyA' frameborder='0' allowfullscreen></iframe></div>
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">백종원</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">Feb 23, 2023</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
														class="fa fa-heart-o reaction" aria-hidden="true"></i> <span class="counterValue reaction"> 468,219</span></a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
														class="fa fa-comment-o reaction" aria-hidden="true"></i><span class="reaction">&nbsp;7,825</span></a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">알면서도 애써 모른 척했습니다... 끈기 있는 팀원에게 이 영상을 바칩니다!</h4>
									</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12 col-md-6">
							<div class="single-post wow fadeInUp" data-wow-delay="1s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe src='https://www.youtube.com/embed//sT5KsSpq8w4' frameborder='0' allowfullscreen></iframe></div>
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">KBS</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">Feb 17, 2023</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
															class="fa fa-heart-o reaction" aria-hidden="true"></i> <span class="counterValue reaction"> 457,585</span></a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
														class="fa fa-comment-o reaction" aria-hidden="true"></i><span class="reaction">&nbsp;6,375</span></a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">오징어 볶음은 평생 이 레시피 하나면 끝!! 1년 반을 고민했다 </h4>
									</a>
								</div>
							</div>
						</div>

						<h4 style="text-align: center; color: #ff5932">유튜브 레시피 </h4><br>
						<!-- ******* List Blog Area Start ******* -->


						<!-- Single Post -->
						<div class="col-12">
							<div class="list-blog single-post d-sm-flex wow fadeInUpBig"
								 data-wow-delay=".4s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe src='https://www.youtube.com/embed//hYQboJTGa-k' frameborder='0' allowfullscreen></iframe></div>
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">매일맛나</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">Mar 30, 2023</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
														class="fa fa-heart-o reaction" aria-hidden="true"></i> <span class="counterValue reaction"> 157,759</span></a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
														class="fa fa-comment-o reaction" aria-hidden="true"></i><span class="reaction">&nbsp;9,125</span></a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
														class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">닭다리구이 이렇게 해보세요, 사 먹는것 같아요 :: 감자구이는 덤 ::</h4>
									</a>
									<p>
										집에서 이렇게 닭다리구이 해보세요. 사먹는 것처럼 고급지고 맛있어요.
									</p>
									<a href="https://www.youtube.com/watch?v=hYQboJTGa-k&t=3s" class="read-more">Continue Reading..</a>
								</div>
							</div>
						</div>


						<!-- Single Post -->
						<div class="col-12">
							<div class="list-blog single-post d-sm-flex wow fadeInUpBig"
								data-wow-delay=".2s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe src='https://www.youtube.com/embed//tef8wIgAQk0' frameborder='0' allowfullscreen></iframe></div>
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">하루한끼</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">Apr 17, 2023</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
														class="fa fa-heart-o reaction" aria-hidden="true"></i> <span class="counterValue reaction"> 12,539</span></a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
														class="fa fa-comment-o reaction" aria-hidden="true"></i><span class="reaction"> 632</span></a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">옛날 떡볶이</h4>
									</a>
									<p>아무튼 옛날 맛<br>
										Instagram: omad.log
										Contact: omad.log@gmail.com</p>
									<a href="https://www.youtube.com/watch?v=tef8wIgAQk0" class="read-more">Continue Reading..</a>
								</div>
							</div>
						</div>



						<!-- Single Post -->
						<div class="col-12">
							<div class="list-blog single-post d-sm-flex wow fadeInUpBig"
								data-wow-delay=".6s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe src='https://www.youtube.com/embed//Vk68HMjQiqc' frameborder='0' allowfullscreen></iframe></div>
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">매일맛나</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
												<a href="#">Nov 25, 2022</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
														class="fa fa-heart-o reaction" aria-hidden="true"></i> <span class="counterValue reaction"> 140,291</span></a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
														class="fa fa-comment-o reaction" aria-hidden="true"></i><span class="reaction"> 2,569</span></a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">3분 반죽으로, 풍선같은 마늘 플랫브레드 만들기(노이스트) :: 커리에 찍먹 ::</h4>
									</a>
									<p>마늘과 대파를 넣어서 감칠맛이 정말 좋아요.</p>
									<a href="https://www.youtube.com/watch?v=Vk68HMjQiqc" class="read-more">Continue Reading..</a>
								</div>
							</div>
						</div>

						<!-- Single Post -->
						<div class="col-12">
							<div class="list-blog single-post d-sm-flex wow fadeInUpBig"
								data-wow-delay=".8s">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe src='https://www.youtube.com/embed/2D7KgPqJV-c' frameborder='0' allowfullscreen></iframe></div>
								</div>
								<!-- Post Content -->
								<div class="post-content">
									<div class="post-meta d-flex">
										<div class="post-author-date-area d-flex">
											<!-- Post Author -->
											<div class="post-author">
												<a href="#">
													KBS Entertain</a>
											</div>
											<!-- Post Date -->
											<div class="post-date">
													<a href="#">Feb 17, 2023</a>
											</div>
										</div>
										<!-- Post Comment & Share Area -->
										<div class="post-comment-share-area d-flex">
											<!-- Post Favourite -->
											<div class="post-favourite">
												<a href="#"><i
														class="fa fa-heart-o reaction" aria-hidden="true"></i> <span class="counterValue reaction">547</span></a>
											</div>
											<!-- Post Comments -->
											<div class="post-comments">
												<a href="#"><i
														class="fa fa-comment-o reaction" aria-hidden="true"></i><span class="reaction">&nbsp;18</span></a>
											</div>
											<!-- Post Share -->
											<div class="post-share">
												<a href="#"><i
													class="fa fa-share-alt" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
									<a href="#">
										<h4 class="post-headline">[어남선생 레시피] 석화구이 비주얼의 한판 굴전! 이렇게 쉬운 굴전이라니★</h4>
									</a>
									<p>#신상출시편스토랑 #편스토랑 #음식 #푸드 #먹방 #편의점 #메뉴 #신상 #Fun-Staurant </p>
									<a href="https://www.youtube.com/watch?v=2D7KgPqJV-c&t=2s" class="read-more">Continue Reading..</a>
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
						<div class="single-widget-area newsletter-widget">
							<div class="widget-title text-center">
								<h6>공지사항</h6>
							</div>
							<p>최근 공지사항 5개</p>
							<div class="newsletter-form">
							</div>
						</div>
						<div class="single-widget-area newsletter-widget">
							<div class="widget-title text-center">
								<h6>공지사항</h6>
							</div>
							<p>최근 공지사항 5개</p>
							<div class="newsletter-form">
							</div>
						</div>
						<div class="single-widget-area newsletter-widget">
							<div class="widget-title text-center">
								<h6>공지사항</h6>
							</div>
							<p>최근 공지사항 5개</p>
							<div class="newsletter-form">
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

	<script>
		function incrementCounter() {
			// Prevent the default behavior of the link
			event.preventDefault();

			// Get the current counter value
			var counterValueElement = document.getElementById('counterValue');
			var counterValue = parseInt(counterValueElement.textContent);

			// Increment the counter value
			counterValue += 1;

			// Update the counter value on the page
			counterValueElement.textContent = counterValue;
		}
	</script>

</body>
</html>