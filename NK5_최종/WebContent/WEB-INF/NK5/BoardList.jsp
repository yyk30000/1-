<%@page import="kr.smhrd.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.model.BoardListVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
    MemberVO m =(MemberVO) session.getAttribute("succ");
    List<BoardListVO> list = (List<BoardListVO>)request.getAttribute("BoardList");
    String cpath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5nk company</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Satisfy&display=swap"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Merienda&family=Satisfy&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/BoardList.css">
<title>board</title>
<script type="text/javascript">
  function outFn(){
  location.href="<%=cpath%>/LogOut.do";
	}
</script>
<script>
    $(document).on('click', '#btnWrite',function(e)
    {
         //e.preventDefalt 버튼 고유의 기능을 막는 명령어
        e.preventDefault();
        // location.href 뒤에 오는 주소로 페이지를 이동시키는 거래요
        location.href="/NK5/BoardFormgo.do";
    });
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
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

<div class="container-fluid text-center">
    <h2>Board</h2>
    <!-- 선긋기 -->
    <p id="line"></p>
    
    <div class="table-responsive">
	<table class="table table-striped table-sm">
		<colgroup>
			<col style="width:5%;" />
			<col style="width:auto;" />
			<col style="width:20%;" />
		</colgroup>
		<thead>
			<tr>
				<th>NO</th>
				<th>글제목</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
           
       		
                <!-- empty 태그안에있는 요소 지우기 -->
			    <%if (list == null){%>
					<tr><td colspan="4" align="center">데이터가 없습니다.</td></tr>
                    <%}else if (list != null){%>
                        <%for(BoardListVO vo : list){%>

						<tr>
						
							<td><a href="<%=cpath%>/BoardContent.do?Img_Code=<%=vo.getImg_code() %>"><%=vo.getImg_code()%></a></td>
							<td><a href="<%=cpath%>/BoardContent.do?Img_Code=<%=vo.getImg_code() %>"><%=vo.getTitle()%></a></td>
							<td><a href="<%=cpath%>/BoardContent.do?Img_Code=<%=vo.getImg_code() %>"><%=vo.getM_id()%></a></td>
					
						</div>
						</tr>
                        <% } %>
                        <% } %>

        </tbody>
        </div>
	</table>
</div>
<div>
<%if(m != null){ %>
    <button class="btn btn-write" type="button" class="btn btn-sm btn-primary" id="btnWrite">글쓰기</button>
<%} %>
</div>
</div>
</body>
<footer class="container-fluid text-center">
		<a href="#myPage" title="To Top"> <span
			class="glyphicon glyphicon-chevron-up"></span>
		</a>
		<p>One Meal of the Day</p>
	</footer>

  <script>
    $(document).ready(function () {
      // Add smooth scrolling to all links in navbar + footer link
      $(".navbar a, footer a[href='#myPage']").on('click', function (event) {
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
          }, 900, function () {

            // Add hash (#) to URL when done scrolling (default click behavior)
            window.location.hash = hash;
          });
        } // End if
      });

      $(window).scroll(function () {
        $(".slideanim").each(function () {
          var pos = $(this).offset().top;

          var winTop = $(window).scrollTop();
          if (pos < winTop + 600) {
            $(this).addClass("slide");
          }
        });
      });
    })
  </script>
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