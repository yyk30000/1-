<%@page import="kr.smhrd.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.model.BoardListVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String cpath = request.getContextPath();
    MemberVO m =(MemberVO) session.getAttribute("succ");
    

    %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
  <title>Document</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/BoardWriting.css">
  <!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Satisfy&display=swap"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Merienda&family=Satisfy&display=swap" rel="stylesheet">
  <script>
    // 파일업로드
    var count = 0;
    var a = 2;
    $(document).ready(function () {
      // 옵션추가 버튼 클릭시
      $("div#item1").show();

      $("#addItemBtn").on("click", function (event) {
    	  var test = "<div class = 'fileAdd'><img id='output"+a+"'  class=\"output\" src=''><label for='file"+a+"' class=\"btn btn-lg pull-left imgup\">image</label><input type='file' id=\"file"+a+"\" name='file" + a + "' style=\"display:none\" onchange=\"document.getElementById('output"+a+"').src = window.URL.createObjectURL(this.files[0])\"/><br><textarea class='form-control col-sm-6 form-group' name = 'text" + a + "' placeholder=\"내용\" rows=\"3\"></textarea></div>"
        // var test = "<tr><td id = 'fileAdd'><input type='file' name='file"+a+"'/><br><textarea name = 'text"+a+"'></textarea></td></tr>"
        $("#item2").append(test);
        a++;
        if (count == 4) {
          $(this).off(event);
          alert("6개까지만 등록이 가능합니다.");
          $("#addItemBtn").hide();
        }
        count++;
      })
    });
    function cancel() {
      document.querySelector("#item2").innerHTML = "";
    }

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
  <article>
    <div class="container-fluid text-center si">
      <h2>board Form</h2>
      <p class="line"></p>
      <form method="post" action="BoardForm.do" enctype="multipart/form-data">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="writer" type="text" name="user_name" placeholder="<%=m.getM_name()%>" readonly="readonly" value="<%=m.getM_name() %>"/><br>
          <input type ="hidden" name ="writer" value="<%=m.getM_id()%>">
          <input class="form-control" id="title" type="text" name="title" placeholder="제목" required />

          <div id="example">

            <div id="item1">
                     
              <input class="reset btn btn-lg-center" type="reset" id="cancelItemBtn" name='reset1'
              value="취소" onclick="cancel()"/>
              <button class="btn btn-lg-center" type="button" id="addItemBtn">추가</button><br>
                
              <div class="fileAdd">
                <img id="output1" class="output" src="">
                <label for='file1'  class="btn btn-lg pull-left imgup">image</label>
                <input type="file" id="file1" name="file1" style="display:none"  onchange="document.getElementById('output1').src = window.URL.createObjectURL(this.files[0])" />
              <textarea class="form-control col-sm-6 form-group" id="text" name="text1" placeholder="내용" rows="3"
                required></textarea>
              </div>
    
            </div>
            <div id="item2">

            </div>
          </div>
          <div><input class="btn btn-lg pull-center" id="subBtn" type="submit" value="제출" /></div>
        </div>
      </form>
    </div>
    </div>
  </article>
  </script>

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
  <footer class="container-fluid text-center">
    <a href="#myPage" title="To Top">
      <span class="glyphicon glyphicon-chevron-up"></span>
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
    
  </script>
</body>

</html>