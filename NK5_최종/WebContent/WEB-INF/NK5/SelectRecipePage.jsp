<%@page import="kr.smhrd.model.AlternativeIngredientsVO"%>
<%@page import="kr.smhrd.model.MyRecipesVO"%>
<%@page import="kr.smhrd.model.MemberVO"%>
<%@page import="kr.smhrd.model.RecipeIngredientsVO"%>
<%@page import="kr.smhrd.model.RecipeTipsVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.model.RecipeCookingVO"%>
<%@page import="kr.smhrd.model.RecipeBasicsVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	RecipeBasicsVO RBvo = (RecipeBasicsVO) request.getAttribute("RBvo");
List<RecipeCookingVO> RCvo = (List<RecipeCookingVO>) request.getAttribute("RCvo");
List<RecipeTipsVO> RTvo = (List<RecipeTipsVO>) request.getAttribute("RTvo");
List<RecipeIngredientsVO> RIvo = (List<RecipeIngredientsVO>) request.getAttribute("RIvo");
String cpath = request.getContextPath();
int listnum = (int)request.getAttribute("listnum");
MemberVO m =(MemberVO) session.getAttribute("succ");
MyRecipesVO MRvo = (MyRecipesVO)request.getAttribute("MRvo");
List<AlternativeIngredientsVO> ATvo =(List<AlternativeIngredientsVO>)request.getAttribute("ATvo");
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
<script src="https://code.responsivevoice.org/responsivevoice.js?key=6l85RGeJ"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Satisfy&display=swap"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Merienda&family=Satisfy&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/SelectRecipePage.css">

<script type="text/javascript">

function outFn(){
	  location.href="<%=cpath%>/LogOut.do";			
	  }	

function Insertmyrecipe(result) {
<%if(m != null){%>
		location.href = "<%=cpath%>/InsertMyRecipes.do?key=0&rcp_code="+result;
<%}else{%>
	alert("로그인을 해주세요")
	<%}%>
	 
}

function Deletmyrecipe(result) {
	location.href = "<%=cpath%>/DeletMyRecipes.do?key=0&rcp_code="+result;
	
}

function pickDefault() {
		let Star = document.querySelector("#rcpickStar");
		let Check = document.querySelector("#rcpickCheck");
		if(MRvo == null) {
			Star.style.display = 'block';
			Check.style.display = 'none';
		}else{
			Star.style.display = 'none';
			Check.style.display = 'block';
		}
	}

function togglePick() {
		let Star = document.querySelector("#rcpickStar");
		let Check = document.querySelector("#rcpickCheck");
		if(Star.style.display == 'block'){
			Star.style.display = 'none';
			Check.style.display = 'block';
		}else{
			Star.style.display = 'block';
			Check.style.display = 'none';
		}
	}
function DelTip(code){

	location.href = "<%=cpath%>/DeletRecipeTip.do?key=0&tip_code="+code;
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

	<!-- Container (Pricing Section) -->
	<div id="Portfolio" class="container-fluid text-center">
		<h2>Your Recipick</h2>
    <!-- 선긋기 -->
    <p id="line"></p>
		<div class="row">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<img src="<%=RBvo.getRcp_pic1()%>" alt="" width="75%"><br>
					<%if(MRvo == null){ %>
					<button id="rcpickStar" class="btn btn-lg myrecipick" onclick="Insertmyrecipe(<%=RBvo.getRcp_code() %>);pickDefault();togglePick()">Pick등록<i class="fas fa-star"></i></button>
					<%}else{
						%>
					<button id="rcpickCheck" class="btn btn-lg myrecipick" onclick="Deletmyrecipe(<%=RBvo.getRcp_code() %>);pickDefault();togglePick()">Pick해제<i class="fas fa-check"></i></button>
					<%} %>
					<br><h3 class="rcp_name"><strong><%=RBvo.getRcp_name()%></strong></h3>
					
					
					<h5 class="font-rcp-desc"><%=RBvo.getRcp_desc()%></h5>
				</div>
				<div class="panel-body">
					<div class="thumbnail font-rcp-desc">
						<p>
							<strong><%=RBvo.getRcp_cooking_time()%></strong> 예상
						</p>
						<p>
							난이도 : <strong><%=RBvo.getRcp_level()%></strong>
						</p>
						<p>
							<strong><%=RBvo.getRcp_size()%></strong>
						</p>
					</div>
					<div class="panel-body">
						<div class="thumbnail">
							<div class="ingredients font-rcp-desc">
								<h3 class="main"><strong>주재료</strong></h3>
								<hr class="ingre_hr">
								<%
									for (RecipeIngredientsVO vo : RIvo) {
										if (vo.getIngre_t_code() == 3060001) {
								%>
								<p class="main"><%=vo.getIngre_name()%>
									/
									<%=vo.getIngre_weight()%></p>
								<%
									}
								%>
								<%
									}
								%>
							</div>

							<div class="ingredients">
								<br>
								<h3 class="main"><strong>부재료</strong></h3>
								<hr class="ingre_hr">
								<%
									int a = 1;
								%>
								<%
									for (RecipeIngredientsVO vo : RIvo) {
									if (vo.getIngre_t_code() == 3060002) {
										boolean s = false;
								%>
								<p class="ingre_look">
									<span class="main"><%=vo.getIngre_name()%> / <%=vo.getIngre_weight()%></span>
									<%for(AlternativeIngredientsVO vo2 : ATvo){ 
										if(vo.getIngre_name().equals(vo2.getRaw_ingre_name())) {
											s = true;
										}
									}

									if(s){%>
											<button class="alter_ingre_font btn btn-lg" onclick="toggleDiv('<%=a%>')" >다른 식재료?</button>
										<%}
									%>
									
								</p>
								<div id="alter<%=a%>" class="alter_ingredients bg-grey slide">
									
									<%for(AlternativeIngredientsVO vo2 : ATvo){ 
									if(vo.getIngre_name().equals(vo2.getRaw_ingre_name())){%>
									<p title="<%=vo2.getBrief_desc() %>"><%=vo2.getAlter_ingre_name() %></p>
									<%}
								} %>
								</div>
								<%
									a++;
								%>
								<%
									}
								%>
								<%
									}
								%>
							</div>

							<div class="ingredients">
								<br>
								<h3 class="main"><strong>양념</strong></h3>
								<hr class="ingre_hr">
								<%
									int b = 16;
								%>
								<%
									for (RecipeIngredientsVO vo : RIvo) {
									if (vo.getIngre_t_code() == 3060003) {
										boolean s = false;
								%>
								<p>
									<span class="main"><%=vo.getIngre_name()%> / <%=vo.getIngre_weight()%></span>
									<%for(AlternativeIngredientsVO vo2 : ATvo){ 
										if(vo.getIngre_name().equals(vo2.getRaw_ingre_name())) {
											s = true;
										}
									}

									if(s){%>
											<button class="alter_ingre_font btn btn-lg" onclick="toggleDiv('<%=b%>')" >다른 양념?</button>
										<%}
									%>
								</p>
								<div id="alter_source<%=b%>" class="alter_ingredients bg-grey slide">
									<%for(AlternativeIngredientsVO vo2 : ATvo){ 
									if(vo.getIngre_name().equals(vo2.getRaw_ingre_name())){%>
									<p title="<%=vo2.getBrief_desc() %>"><%=vo2.getAlter_ingre_name() %></p>
									<%}
									} %>
								</div>
								<%
									b++;
								%>
								<%
									}
								%>
								<%
									}
								%>
							</div>
						</div>
						
						<!-- submit-value에 이미지 찾아서 넣기 -->
						<div class="recipe_cookings">
							<h3 id="order"><strong>조리 과정</strong></h3>
							<form class="look" action='SelectRecipePage.do'>
							<button type="submit" class="btn btn-lg button_"><i class="fas fa-images"></i> <i class="fas fa-align-left"></i> <i class="fas fa-comments"></i></button>
							<input type="hidden" name="listnum" sytle="display:none;" value="0"/>
							<input type="hidden" name="code" sytle="display:none;" value="<%=RBvo.getRcp_code()%>"/>
							</form>
							
							<form class="look" action='SelectRecipePage.do'>
							<button id="num2" type="submit" class="btn btn-lg button_"><i class="fas fa-images"></i> <i class="fas fa-align-left"></i></button>
							<input type="hidden" name="listnum" sytle="display:none;" value="1"/>
							<input type="hidden" name="code" sytle="display:none;" value="<%=RBvo.getRcp_code()%>"/>
							</form>
							
							<form class="look" action='SelectRecipePage.do'>
							<button type="submit" class="btn btn-lg button_"><i class="fas fa-align-left"></i></button>
							<input type="hidden" name="listnum" sytle="display:none;" value="2"/>
							<input type="hidden" name="code" sytle="display:none;" value="<%=RBvo.getRcp_code()%>"/>
							</form>
							<button class="btn btn-lg alltts button_"><i class="fas fa-volume-up"></i></button>
							

							<div class="thumbnail">
							
							<!-- 전체 조리 과정 음성 안내 기능 -->
							<div class="tts_speakAll">
								<% String ttsAll = ""; 
								 for (RecipeCookingVO vo : RCvo) { 
									 ttsAll += vo.getCooking_order() + "번. "; 
									 ttsAll += vo.getCooking_content() + "  "; 
									 if(!(vo.getCooking_tip().equals(" "))){ 
										ttsAll += "Tip!" + vo.getCooking_tip();
										} 
								} %>
								<input class="tts_all" type ="text" style="display:none;" value="<%= ttsAll %>"/>
								</div>
								
								<!-- 조리 과정 별 설명 -->
								<!-- 조리 과정 별 음성 안내 기능 -->
								<%
									for (RecipeCookingVO vo : RCvo) {
								%>
								<div class="cook_order">
								<div class="recipe_cookings">
									<hr><br>
								<%if(listnum!=2){ %>
									<img src="<%=vo.getCooking_img1()%>" alt="" width="100%">
									<%} %>
									<button class="btn btn-lg tts button_"><i class="fas fa-volume-up"></i></button>
									<p class="tts_text font-rcp-desc"><%=vo.getCooking_order()%>번. 
										<br><%=vo.getCooking_content()%>
										<% if(!(vo.getCooking_tip().equals(" "))){ %>
										<br><br>Tip! 
										<br><%=vo.getCooking_tip()%>
										<%} %></p>
								</div>
								
								<%if(listnum == 0){ %>
								
								<div id="" class="contact container-fluid text-center">
									<h4 class="text-center"><strong>Comments</strong></h4>
									<div class="comments_list row">
										<%boolean s = false;%>
										<%for(RecipeTipsVO vo2 : RTvo){
											if(vo2.getCooking_code() == vo.getCooking_code())
											{
												s = true;%>
												<%} 
											} %>
										<%if(s){%>
											<table class="panel-body table_font row">
											<tr class="panel-heading">
												<th id="writer" class="text-center">작성자</th>
												<th id="neyong" class="text-center"  colspan="2">내용</th>
											</tr>
										<%for(RecipeTipsVO vo2 : RTvo)
										{
										if(vo2.getCooking_code() == vo.getCooking_code())
											{%>
											<tr>
												<td><%=vo2.getM_id() %></td>
												<%if(m!=null){ %>
													<% if(m.getM_id().equals(vo2.getM_id())) {%>
														<td><%=vo2.getUser_tip() %></td>
														<td class="del">
													<button id="delBtn" class="btn btn-lg"><i class="fas fa-times" onclick="DelTip(<%=vo2.getTip_code() %>)"></i></button>
													<%}else{ %>
														<td colspan="2"><%=vo2.getUser_tip() %></td>
													<%} %>
													<%}else{ %>
														<td colspan="2"><%=vo2.getUser_tip() %></td>
														<%} %>
												</td>
											</tr>
											<%} 
										} %>
										</table>
									<%}%>
									</div>
									
									<div class="row">
                              <form action="Commnet.do">
                              <input type="hidden" name="CookingCode" value=<%=vo.getCooking_code() %>>
                                 <div class="row">
                                 <%if(m != null){ %>
                                    <textarea class="form-control" id="Comment" name="Comment"
                                       placeholder="Comment" rows="5"></textarea>
                                    <br>
                                    <div class="row">
                                       <div class="col-sm-12 form-group">
                                          <button class="btn btn-lg pull-right" type="submit">등록</button>
                                          <%} %>
                                          <br> <br>
                                       </div>
                                    </div>
                                 </div>
                              </form>
									</div>
								</div>
								<%} %>
							</div>
								<%
									}
									
								%>
							</div>
						</div>
					</div>
				</div>

				<footer class="container-fluid text-center">
					<a href="#myPage" title="To Top">
					  <span class="glyphicon glyphicon-chevron-up"></span>
					</a>
					<p>One Meal of the Day</p>
				  </footer>

				<script>
					$(document)
							.ready(
									function() {
										// Add smooth scrolling to all links in navbar + footer link
										$(".navbar a, footer a[href='#myPage']")
												.on(
														'click',
														function(event) {
															// Make sure this.hash has a value before overriding default behavior
															if (this.hash !== "") {
																// Prevent default anchor click behavior
																event
																		.preventDefault();

																// Store hash
																var hash = this.hash;

																// Using jQuery's animate() method to add smooth page scroll
																// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
																$('html, body')
																		.animate(
																				{
																					scrollTop : $(
																							hash)
																							.offset().top
																				},
																				900,
																				function() {

																					// Add hash (#) to URL when done scrolling (default click behavior)
																					window.location.hash = hash;
																				});
															} // End if
														});

										$(window)
												.scroll(
														function() {
															$(".slideanim")
																	.each(
																			function() {
																				var pos = $(
																						this)
																						.offset().top;

																				var winTop = $(
																						window)
																						.scrollTop();
																				if (pos < winTop + 600) {
																					$(
																							this)
																							.addClass(
																									"slide");
																				}
																			});
														});
									})
									

	var alltts = true;
	var tts = true;
	
	document.querySelector(".alltts").addEventListener("click", e=>{
		if(alltts){
		responsiveVoice.speak(document.querySelector(".tts_all").value,"Korean Female");
		alltts = false;
		}else {
			responsiveVoice.cancel();
			alltts = true;
		}

	})	
	
	Ellist = document.querySelectorAll(".tts");
	console.log('test1')
	for(var i =0; i< Ellist.length;i++){
		
		Ellist[i].addEventListener("click", e=>{
			if(tts) {
			responsiveVoice.speak(e.currentTarget.parentElement.querySelector('p').innerText,"Korean Female");
			tts = false;
			}else {
				responsiveVoice.cancel();
				tts = true;
			}

		})	
	}

		
		

					//함수 합치기

					function toggleDiv(order) {
						if (order === '1') {
							const div = document.querySelector("#alter1");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '2') {
							const div = document.querySelector("#alter2");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '3') {
							const div = document.querySelector("#alter3");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '4') {
							const div = document.querySelector("#alter4");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '5') {
							const div = document.querySelector("#alter5");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '6') {
							const div = document.querySelector("#alter6");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '7') {
							const div = document.querySelector("#alter7");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '8') {
							const div = document.querySelector("#alter8");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '9') {
							const div = document.querySelector("#alter9");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '10') {
							const div = document.querySelector("#alter10");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '11') {
							const div = document.querySelector("#alter11");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '12') {
							const div = document.querySelector("#alter12");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '13') {
							const div = document.querySelector("#alter13");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '14') {
							const div = document.querySelector("#alter14");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '15') {
							const div = document.querySelector("#alter15");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '16') {
							const div = document
									.querySelector("#alter_source16");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '17') {
							const div = document
									.querySelector("#alter_source17");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '18') {
							const div = document
									.querySelector("#alter_source18");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '19') {
							const div = document
									.querySelector("#alter_source19");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '20') {
							const div = document
									.querySelector("#alter_source20");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '21') {
							const div = document
									.querySelector("#alter_source21");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '22') {
							const div = document
									.querySelector("#alter_source22");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '23') {
							const div = document
									.querySelector("#alter_source23");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '24') {
							const div = document
									.querySelector("#alter_source24");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '25') {
							const div = document
									.querySelector("#alter_source25");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '26') {
							const div = document
									.querySelector("#alter_source26");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '27') {
							const div = document
									.querySelector("#alter_source27");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '28') {
							const div = document
									.querySelector("#alter_source28");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '29') {
							const div = document
									.querySelector("#alter_source29");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						} else if (order === '30') {
							const div = document
									.querySelector("#alter_source30");
							if (div.style.display === 'none') {
								div.style.display = 'block';
							} else {
								div.style.display = 'none';
							}
						}
					};
				</script>
</body>

</html>