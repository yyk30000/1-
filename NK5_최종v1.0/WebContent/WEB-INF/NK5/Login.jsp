
<%@page import="kr.smhrd.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="kr.smhrd.model.RecipeBasicsVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
Boolean check = (Boolean)request.getAttribute("check");
String cpath = request.getContextPath();
MemberVO m =(MemberVO) session.getAttribute("succ");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com -->
  <title>Bootstrap Theme Company Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
  <!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Satisfy&display=swap"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Merienda&family=Satisfy&display=swap" rel="stylesheet">
  
  <link rel="stylesheet" href="css/Login.css">
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<%
if(!check){
	%>
<script type="text/javascript">
alert("잘못된 접근입니다.");
</script>
<% 
}
%>

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
				<a class="log navbar-brand" href="<%=cpath%>/LoginPage.do">　Login</a>
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
			
			</div>
		</form>
	</div>
<!-- Container (About Section) -->
<div class="main-container">
  <div class="main-wrap">
    <div class="row text-center">


      <img src="img/오냉끼_로고.png">


  <form action="LoginCheckPage.do" name="login_form" method="post">
   
  <section class="login-input-section-wrap text-center">

    <div class="login-input-wrap">	
      <input placeholder="아이디" type="text" id="m_id" name="m_id"></input>
    </div>
    <div class="login-input-wrap password-wrap">	
      <input placeholder="비밀번호" type="password" id="m_pwd" name="m_pwd"></input>
    </div>
    <div class="login-button-wrap">
      <button id="islogin" type="submit" vlaue="로그인" onclick="login()">로그인</button>
    </div>
    
    </section>
  </form>
  <form action="Join.do">
    <div class="memberRegister-button-wrap">
         <button type="submit" vlaue="회원가입">회원가입</button>
       </div>
   </form>
    <script>
    
      function login() {
        if(!document.login_form.m_id.value){
          alert("아이디를 입력하세요!");
          document.login_form.id.focus();
          return;
        }
        if(!document.login_form.m_pwd.value){
          alert("비밀번호를 입력하세요!")
          return;
        }
        document.login_form.submit();
      }
    </script>
    <!-- <div class="login-stay-sign-in">
      <i class="far fa-check-circle"></i>
      <span>로그인정보 저장하기</span>
    </div> -->
    

   
  </div>
  </section>
  <footer class="text-center">
    <a href="#myPage" title="To Top">
      <span class="glyphicon glyphicon-chevron-up"></span>
    </a>
    <p>One Meal of the Day</p>
  </footer>
  </div>
</div>

    </div>
  </div>
</div>

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
</script>

</body>
</html>
