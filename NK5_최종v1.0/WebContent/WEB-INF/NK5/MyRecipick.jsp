<%@page import="kr.smhrd.model.MyRecipesVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.model.RecipeBasicsVO"%>
<%@page import="kr.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
    MemberVO m =(MemberVO) session.getAttribute("succ");
    String cpath = request.getContextPath();
    List<RecipeBasicsVO> a = (List<RecipeBasicsVO>)request.getAttribute("name");
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
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
<link rel="stylesheet" href="css/MyRecipick.css">
<script type="text/javascript">
  function Deletmyrecipe(result) {
	 
	  location.href = "<%=cpath%>/DeletMyRecipes.do?key=1&rcp_code="+ result ;
		
	}
  
  function outFn(){
	  location.href="<%=cpath%>/LogOut.do";			
	  }
  
</script>


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


					<li><a href="<%=cpath%>/MainPage.do">Home</a></li>
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
	<!--(start)검색창 -->
	<div class="jumbotron text-center">
		<p class="title_first">One Meal of the Day</p>
		<h1>오냉끼</h1>
		<form action="RecipeList.do" method="post">
			<div class="input-group-menu">
				<input type="radio" name="SelectValue" value="ingre">재료명
				&nbsp&nbsp&nbsp
				</h2>
				<input type="radio" name="SelectValue" value="recipe" checked>요리명
			</div>

			<div class="input-group">

				<input type="text" name="RecipeList" class="form-control" size="50"
					placeholder="검색어를 입력하세요." required>

				<div class="input-group-btn">
					<input type="submit" class="btn btn-danger" value="&nbsp검색&nbsp" />
				</div>
			</div>
		</form>
	</div>
	<!--#####여기서까지검색창##### -->
	<!-- Container (About Section) -->
	<div class="row">
		<!-- Container (Portfolio Section) -->
		<div id="services" class="container-fluid text-center">
			<h2>My reciPick!</h2>
			<hr style="border: 1px solid #ff9933">
			<div class="row text-center">
				<% int p = 1; %>
				<%for(RecipeBasicsVO vo : a) {%>
				<div class="col-sm-4">
					<div class="thumbnail">
						<a
							href="<%=cpath%>/SelectRecipePage.do?code=<%=vo.getRcp_code()%>"
							style="color: black" text-decoration-line: none><img
							src="<%=vo.getRcp_pic1()%>" alt="" width="230" height="230">
							<p class="font-rcp">
								<strong><%=vo.getRcp_name()%></strong>
							</p>
							<p class="font-rcp-desc"><%=vo.getRcp_desc() %></p></a>
						<!-- 합체! -->
						<button id="rcpickStar" class="btn btn-lg myrecipick"
							onclick="Deletmyrecipe(<%=vo.getRcp_code()%>);">
							Pick 해제<i class="fas fa-check"></i>
						</button>
						<%
            p++;
            %>
					</div>
				</div>
				<%} %>

				<br>
				<br>

			</div>

		</div>
	</div>

	<footer class="container-fluid text-center">
		<a href="#myPage" title="To Top"> <span
			class="glyphicon glyphicon-chevron-up"></span>
		</a>
		<p>One Meal of the Day</p>
	</footer>

	<script>
$(document).ready(function(){
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
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})

// 합체!
		// 찜하기 버튼 기능
		function togglePick(a) {
			if(a === '1') {
				const Star = document.querySelector("#rcpickStar1");
				const Check = document.querySelector("#rcpickCheck1");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '2') {
				const Star = document.querySelector("#rcpickStar2");
				const Check = document.querySelector("#rcpickCheck2");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '3') {
				const Star = document.querySelector("#rcpickStar3");
				const Check = document.querySelector("#rcpickCheck3");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '4') {
				const Star = document.querySelector("#rcpickStar4");
				const Check = document.querySelector("#rcpickCheck4");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '5') {
				const Star = document.querySelector("#rcpickStar5");
				const Check = document.querySelector("#rcpickCheck5");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '6') {
				const Star = document.querySelector("#rcpickStar6");
				const Check = document.querySelector("#rcpickCheck6");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '7') {
				const Star = document.querySelector("#rcpickStar7");
				const Check = document.querySelector("#rcpickCheck7");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '8') {
				const Star = document.querySelector("#rcpickStar8");
				const Check = document.querySelector("#rcpickCheck8");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '9') {
				const Star = document.querySelector("#rcpickStar9");
				const Check = document.querySelector("#rcpickCheck9");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '10') {
				const Star = document.querySelector("#rcpickStar10");
				const Check = document.querySelector("#rcpickCheck10");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '11') {
				const Star = document.querySelector("#rcpickStar11");
				const Check = document.querySelector("#rcpickCheck11");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '12') {
				const Star = document.querySelector("#rcpickStar12");
				const Check = document.querySelector("#rcpickCheck12");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '13') {
				const Star = document.querySelector("#rcpickStar13");
				const Check = document.querySelector("#rcpickCheck13");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '14') {
				const Star = document.querySelector("#rcpickStar14");
				const Check = document.querySelector("#rcpickCheck14");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}else if(a === '15') {
				const Star = document.querySelector("#rcpickStar15");
				const Check = document.querySelector("#rcpickCheck15");
				if(Star.style.display === 'block'){
					Star.style.display = 'none';
					Check.style.display = 'block';
				}else{
					Star.style.display = 'block';
					Check.style.display = 'none';
				}
			}
		}




</script>

</body>
</html>
