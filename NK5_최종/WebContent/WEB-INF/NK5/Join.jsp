<%@page import="kr.smhrd.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="kr.smhrd.model.RecipeBasicsVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String cpath = request.getContextPath();
MemberVO m = (MemberVO) session.getAttribute("succ");
%>


<!DOCTYPE html>
<html lang="en">

<head>
<!-- Theme Made By www.w3schools.com -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/51db22a717.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">
<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Satisfy&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Merienda&family=Satisfy&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/Join.css">
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<!--(start)카테고리 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">

				<a class="navbar-brand" href="<%=cpath%>/MainPage.do">5nk</a>
				<!--(start)test님 환영합니다. -->
				<%
					if (m != null) {
				%>
				<span><a class="navbar-toggle welcome"><%=m.getM_name()%>님
						환영합니다!</a></span>
				<%
					}
				%>
				<!--(end)test님 환영합니다. -->
				<!--S 로그인 로그아웃 -->
				<%
					if (m == null) {
				%>
				<a class="log navbar-brand" href="<%=cpath%>/LoginPage.do">
					Login</a>
				<%
					} else {
				%>
				<span><a name="Logout" class="log navbar-brand"
					onclick="outFn()">Logout</a></span>
				<%
					}
				%>
				<!--E 로그인 로그아웃 -->
				<button type="button" class="navbar-toggle" id="category"
					data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>


			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<%
						if (m != null) {
					%>


					<li><a href="#" id="mypage">MyPage</a></li>
					<li><a href='<%=cpath%>/MyRecipick.do'>MyRecipick</a></li>
					<%
						}
					%>
					<li><a href="<%=cpath%>/BoardList.do">Board</a></li>
					<li><a href="<%=cpath%>/RecipesKategorie.do?key=0">All of
							Recipe</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!--(end)카테고리 -->
	<!--(start)검색창 -->
	<div class="jumbotron text-center">
		<p class="title_first">One Meal of the Day</p>
		<h1>오냉끼</h1>
		<form action="RecipeList.do" method="post">
			
			</div>
		</form>
	</div>
	<!-- Container (About Section) -->
	<div class="main-container">
		<div class="main-wrap">
			<!-- <div class="row text-center slideanim"> -->
			<div class="row text-center">

				<div class="logo-wrap">
					<img src="img/오냉끼_로고.png">
				</div>


				<form action="MemberRegister.do" method="post">
					<!-- wrapper -->
					<!-- <div id="wrapper"> -->

					<!-- content-->
					<div id="content">
						<h3>&nbsp</h3>
						<!-- ID -->
						<div>
							<h2>
								<strong>JOIN</strong>
							</h2>
							<hr style="border: 1px solid #ff9933">
							<h3 class="join_title">
								<label for="id">아이디</label>
							</h3>
							<span class="box int_id"> <input type="text" id="m_id"
								name="m_id" class="int" maxlength="20">
							</span> <span class="error_next_box"></span>
						</div>

						<!-- PW1 -->
						<div>
							<h3 class="join_title">
								<label for="pswd1">비밀번호</label>
							</h3>
							<span class="box int_pass"> <input type="password"
								id="m_pwd" name="m_pwd" class="int" maxlength="20">
							</span> <span class="error_next_box"></span>
						</div>

						<!-- NAME -->
						<div>
							<h3 class="join_title">
								<label for="name">이름</label>
							</h3>
							<span class="box int_name"> <input type="text" id="m_name"
								name="m_name" class="int" maxlength="20">
							</span> <span class="error_next_box"></span>
						</div>

						<!-- BIRTH -->
						<div>
							<h3 class="join_title">
								<label for="yy">생년월일</label>
							</h3>
							<div id="bir_wrap">
								<!-- BIRTH_YY -->
								<div id="bir_yy">
									<span class="box"> <input type="text" id="yy" name="y"
										class="int" maxlength="4" placeholder="년(4자)">
									</span>
								</div>

								<!-- BIRTH_MM -->
								<div id="bir_mm">
									<span class="box"> <select id="mm" name="m" class="sel">
											<option>월</option>
											<option value="01">1</option>
											<option value="02">2</option>
											<option value="03">3</option>
											<option value="04">4</option>
											<option value="05">5</option>
											<option value="06">6</option>
											<option value="07">7</option>
											<option value="08">8</option>
											<option value="09">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
									</select>
									</span>
								</div>

								<!-- BIRTH_DD -->
								<div id="bir_dd">
									<span class="box"> <input type="text" id="dd" name="d"
										class="int" maxlength="2" placeholder="일">
									</span>
								</div>

							</div>
							<span class="error_next_box"></span>
						</div>

						<!-- GENDER -->
						<div>
							<h3 class="join_title">
								<label for="gender">성별</label>
							</h3>
							<span class="box gender_code"> <select id="m_gender"
								name="m_gender" class="sel">
									<option>성별</option>
									<option value="M">남자</option>
									<option value="F">여자</option>
							</select>
							</span> <span class="error_next_box">필수 정보입니다.</span>
						</div>

						<!-- JOIN BTN-->
						<div class="btn_area">
							<button type="submit" id="btnJoin">
								<span>가입하기</span>
							</button>
						</div>
					</div>
				</form>

			</div>


			<footer class="text-center">
				<a href="#myPage" title="To Top"> <span
					class="glyphicon glyphicon-chevron-up"></span>
				</a>
				<p>One Meal of the Day</p>
			</footer>
</body>

<!-- Image of location/map -->
<script>
	$(document).ready(function() {
		// Add smooth scrolling to all links in navbar + footer link
		$(".navbar a, footer a[href='#myPage']").on('click', function(event) {
			// Make sure this.hash has a value before overriding default behavior
			if (this.hash !== "") {
				// Prevent default anchor click behavior
				event.preventDefault();

				// Store hash
				var hash = this.hash;

				// Using jQuery's animate() method to add smooth page scroll
				// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
				$('html, body').animate({
					scrollTop : $(hash).offset().top
				}, 900, function() {

					// Add hash (#) to URL when done scrolling (default click behavior)
					window.location.hash = hash;
				});
			} // End if
		});

		$(window).scroll(function() {
			$(".slideanim").each(function() {
				var pos = $(this).offset().top;

				var winTop = $(window).scrollTop();
				if (pos < winTop + 600) {
					$(this).addClass("slide");
				}
			});
		});
	})
</script>

</body>

</html>