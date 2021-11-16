<%@page import="java.util.List"%>
<%@page import="kr.smhrd.model.BoardListVO"%>
<%@page import="kr.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%
	String cpath = request.getContextPath();
    MemberVO m =(MemberVO) session.getAttribute("succ");
    BoardListVO vo = (BoardListVO) request.getAttribute("select");

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
  <!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Satisfy&display=swap"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Merienda&family=Satisfy&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/BoardUpdate.css">

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
      <h2>board Update</h2>
      <p id="line"></p>
      <form method="post" action="BoardUpdate.do" enctype="multipart/form-data">
      <input type ="hidden" name ="Img_Code" value="<%=vo.getImg_code()%>"/>	
        <div class="col-sm-6 form-group">
          <input class="form-control" id="writer" type="text" name="writer" placeholder="<%=m.getM_id() %>" readonly="readonly" /><br>
          <input class="form-control" id="title" type="text" name="title" value="<%=vo.getTitle() %>" required />

          <div id="example">

            <div id="item1">

              <div class="fileAdd">
           		
                <img id='output1' src="<%=vo.getImg_1() %>" class="output" alt="이미지가 없습니다.">
                <label for='file1' class="btn btn-lg pull-left imgup">image</label>
                <input type="file" id="file1" name="file1" style="display:none" onchange="document.getElementById('output1').src = window.URL.createObjectURL(this.files[0])" />
                <textarea class="form-control col-sm-6 form-group" id="text1" name="text1" placeholder="내용" rows="3"
                  ><%if(vo.getDesc_1()!=null){%><%=vo.getDesc_1() %><%} %></textarea>
                                <div class="fileAdd">
                <img id="output2" src="<%=vo.getImg_2() %>" class="output">
               <label for='file2' class="btn btn-lg pull-left imgup">image</label>
                <input type="file" id="file2" name="file2" style="display:none"  onchange="document.getElementById('output2').src = window.URL.createObjectURL(this.files[0])" />
              <textarea class="form-control col-sm-6 form-group" id="text2" name="text2" placeholder="내용" rows="3"
                ><%if(vo.getDesc_2()!=null){%><%=vo.getDesc_2() %><%} %></textarea></div>
                              <div class="fileAdd">
                <img id="output3" src="<%=vo.getImg_3() %>" class="output">
               <label for='file3' class="btn btn-lg pull-left imgup">image</label>
                <input type="file" id="file3" name="file3" style="display:none"  onchange="document.getElementById('output3').src = window.URL.createObjectURL(this.files[0])" />
              <textarea class="form-control col-sm-6 form-group" id="text" name="text3" placeholder="내용" rows="3"
                ><%if(vo.getDesc_3()!=null){%><%=vo.getDesc_3() %><%} %></textarea></div>
                              <div class="fileAdd">
                <img id="output4" src="<%=vo.getImg_4() %>" class="output">
                <label for='file4' class="btn btn-lg pull-left imgup">image</label>
                <input type="file" id="file4" name="file4" style="display:none"  onchange="document.getElementById('output4').src = window.URL.createObjectURL(this.files[0])" />
              <textarea class="form-control col-sm-6 form-group" id="text" name="text4" placeholder="내용" rows="3"
                ><%if(vo.getDesc_4()!=null){%><%=vo.getDesc_4() %><%} %></textarea></div>
                              <div class="fileAdd">
                <img id="output5" src="<%=vo.getImg_5() %>" class="output">
               <label for='file5' class="btn btn-lg pull-left imgup">image</label>
                <input type="file" id="file5" name="file5" style="display:none"  onchange="document.getElementById('output5').src = window.URL.createObjectURL(this.files[0])" />
              <textarea class="form-control col-sm-6 form-group" id="text" name="text5" placeholder="내용" rows="3"
                ><%if(vo.getDesc_5()!=null){%><%=vo.getDesc_5() %><%} %></textarea></div>
                              <div class="fileAdd">
                <img id="output6" src="<%=vo.getImg_6() %>" class="output">
               <label for='file6' class="btn btn-lg pull-left imgup">image</label>
                <input type="file" id="file6" name="file6" style="display:none"  onchange="document.getElementById('output6').src = window.URL.createObjectURL(this.files[0])" />
              <textarea class="form-control col-sm-6 form-group" id="text" name="text6" placeholder="내용" rows="3"
                ><%if(vo.getDesc_6()!=null){%><%=vo.getDesc_6() %><%} %></textarea></div>

              </div>

            </div>
          </div>
          <div>
            <input class="reset btn btn-default pull-left" type="reset" id="cancelItemBtn" name='reset1' value="취소"
              onclick="cancel()" />
            <input class="btn btn-default pull-right" id="submit" type="submit" value="수정" />
          </div>
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
    <p>5nk
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
  </script>
  <script>
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