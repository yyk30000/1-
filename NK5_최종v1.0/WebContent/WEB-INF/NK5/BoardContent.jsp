<%@page import="kr.smhrd.model.MemberVO"%>
<%@page import="kr.smhrd.model.BoardListVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%
MemberVO m =(MemberVO) session.getAttribute("succ");
	String cpath = request.getContextPath();
BoardListVO vo = (BoardListVO) request.getAttribute("select");
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<title>Document</title>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
<link rel="stylesheet" href="css/BoardList.css">

<script>
        // 파일업로드
        var count = 0;
        var a = 1;
        $(document).ready(function () {
            // 옵션추가 버튼 클릭시
            $("div#item1").show();

            $("#addItemBtn").on("click", function (event) {
                var test = "<div id = 'fileAdd'><input type='file' name='file" + a + "'/><br><textarea name = 'text" + a + "'></textarea></div>"
                // var test = "<tr><td id = 'fileAdd'><input type='file' name='file"+a+"'/><br><textarea name = 'text"+a+"'></textarea></td></tr>"
                $("#example").append(test);
                a++;

                if (count == 4) {
                    $(this).off(event);
                    alert("6개까지만 등록이 가능합니다.");
                    $("#addItemBtn").hide();
                }
                count++;
            })
        });
       
        function delFn(){
            // 삭제페이지로 이동?
            location.href="<%=cpath%>/BoardDelete.do?Delete="+<%=vo.getImg_code()%>;
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
	<!--(end)카테고리 -->
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
	<!--#####글쓰기 페이지#####-->

	<div class="container-fluid text-center">
		<h2>Board</h2>
		<!-- 선긋기 -->
		<p id="line"></p>
		<div class="col-sm-7 slideanim"></div>
		<div class="row">
			<div class="col-sm-6 form-group">
				<input class="form-control" id="writer" type="text" name="writer"
					placeholder="작성자" readonly="readonly" value="<%=vo.getM_id()%>" /><br>
				<input class="form-control" id="title" type="text" name="title"
					placeholder="제목" readonly="readonly" value="<%=vo.getTitle()%>" />


				<div id="item1">



					<div id="blog1">

						<%if(vo.getImg_1() != null){ %>
						<p>
							<img class ="output" id="img_1" src="<%=vo.getImg_1()%>" alt="">
						</p>
						<%} %>
						<%if(vo.getDesc_1() != null){ %>
						<p id="text1"><%=vo.getDesc_1()%></p>
						<%} %>
					</div>
					<div id="blog2">
						<%if(vo.getImg_2() != null){ %>
						<p>
							<img class ="output" id="img_2" src="<%=vo.getImg_2()%>" alt="">
						</p>
						<%} %>
						<%if(vo.getDesc_2() != null){ %>
						<p id="text2"><%=vo.getDesc_2()%></p>
						<%} %>

					</div>
					<div id="blog3">
						<%if(vo.getImg_3() != null){ %>
						<p>
							<img class ="output" id="img_3" src="<%=vo.getImg_3()%>" alt="">
						</p>
						<%} %>
						<%if(vo.getDesc_3() != null){ %>
						<p id="text3"><%=vo.getDesc_3()%></p>
						<%} %>
					</div>
					<div id="blog4">
						<%if(vo.getImg_4() != null){ %>
						<p>
							<img class ="output" id="img_4" src="<%=vo.getImg_4()%>" alt="">
						</p>
						<%} %>
						<%if(vo.getDesc_4() != null){ %>
						<p id="text4"><%=vo.getDesc_4()%></p>
						<%} %>
					</div>
					<div id="blog5">
						<%if(vo.getImg_5() != null){ %>
						<p>
							<img class ="output" id="img_5" src="<%=vo.getImg_5()%>" alt="">
						</p>
						<%} %>
						<%if(vo.getDesc_5() != null){ %>
						<p id="text5"><%=vo.getDesc_5()%></p>
						<%} %>
					</div>
					<div id="blog6">
						<%if(vo.getImg_6() != null){ %>
						<p>
							<img class ="output" id="img_6" src="<%=vo.getImg_6()%>" alt="">
						</p>
						<%} %>
						<%if(vo.getDesc_6() != null){ %>
						<p id="text6"><%=vo.getDesc_6()%></p>
						<%} %>
					</div>
				</div>
			</div>
		</div>
		<%if(m != null){ 
			if(m.getM_id().equals(vo.getM_id())){%>


		
		<form action="BoardUpdateGo.do">
			<button class="btn btn-default pull-center" type="button"
			class="btn btn-info btn-sm" onclick="delFn()"">삭제</button>
			<input type="hidden" name="Img_Code" value="<%=vo.getImg_code()%>" />
			<button class="btn btn-default pull-center" type="submit"
				class="btn btn-primary btn-sm">수정</button>
			<%} %>
			<% }%>
			<button class="btn btn-default pull-center" type="button"
				class="btn btn-success btn-sm"
				onclick="location.href='<%=cpath%>/BoardList.do'">목록</button>
	</div>

	</form>
	</div>
<footer class="container-fluid text-center">
		<a href="#myPage" title="To Top"> <span
			class="glyphicon glyphicon-chevron-up"></span>
		</a>
		<p>One Meal of the Day</p>
	</footer>


	<script>
		$(document).ready(
				function() {
					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage']").on('click',
							function(event) {
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
	<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/618c7cb46885f60a50bb448c/1fk6ce864';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
</html>