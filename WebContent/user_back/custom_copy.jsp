<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Custom_커스터마이징페이지</title>
	<link href="../css/custom_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="custom_wrap">
	<!-- custom_wrap의 크기 => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<div id="custom_keyimg">
			<!-- keyimage부분입니다. -->
			<!-- custom_keyimage부분입니다.
				 연두색 박스의 믈래식 샐러드 버튼까지 포함 -> 높이 435(3)px;-->
			<div id="custom_key_button">
				<!-- 연두색 박스 크기 : width: 432px, height: 53px -->
				<img alt="" src="../cus_img/custom_key_button.png">
			</div>
		</div>
		
		<form action="" method="post" name="" >
		<div id="custom_content_wrap">
		<!-- width:1000px, height:2120px -->
			<div id="custom_word01">
			<!-- "내 마음대로 ~ 만들어 보세요"부분 -> 높이 100px -->
			<!-- 컨텐츠의 크기는 width:570px height:100px -->
				<img alt="Custom_intro" src="../cus_img/custom_word.png">
			</div>
			
			<div id="custom_menubar" class="menubar_text">
			<!-- 커스텀 메뉴바 -->
			<!-- width:1000px, height:55px -->
				<ul>
					<li><img alt="" src="../cus_img/custom_menu_rec.png"></li>
					<li class="custom_mtext01"><a href="#">베이스</a></li>
					<li class="custom_mtext01"><a href="#">채소</a></li>
					<li class="custom_mtext01"><a href="#">고기/생선</a></li>
					<li class="custom_mtext01"><a href="#">토핑</a></li>
					<li class="custom_mtext01"><a href="#">치즈</a></li>
					<li class="custom_mtext01"><a href="#">드레싱</a></li>
					<li><img alt="" src="../cus_img/custom_menu_rec.png"></li>
				</ul>
			</div>
			
			<div id="custom_step01">
			<!--step01.베이스  -->
			<!-- width:1000px(840px), height:271px -->
			<!-- 아이템 하나 크기 -> 115px x 115px -->
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 1.<br>베이스를 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
					<ul>
						<li class="step01_con01">
							<img alt="" src="../cus_img/base/양상추.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/base/양배추.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/base/적양배추.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/base/양배추믹스.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/base/시금치.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/base/로즈잎.png">
						</li>
					</ul>
				</div>
			
				
			</div>
			<div id="custom_step02">
			<!--step02.첫번째 토핑  -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 2.<br>첫번째 토핑을 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
					<ul>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping1/토마토.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping1/피망.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping1/브로콜리.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping1/양파.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping1/오이.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping1/피클.png">
						</li>
					</ul>
				</div>
				
			</div>
			<div id="custom_step03">
			<!--step03.두번째 토핑 -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 3.<br>두번째 토핑을 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
					<ul>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping2/닭가슴살.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping2/베이컨.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping2/케이준.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping2/햄.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping2/연어.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping2/살라미.png">
						</li>
					</ul>
				</div>
				
			</div>
			<div id="custom_step04">
			<!--step04.그 외 토핑  -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 4.<br>그 외 토핑을 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
					<ul>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping3/아보카도.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping3/아몬드.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping3/호두.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping3/옥수수.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping3/크렌베리.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/topping3/건포도.png">
						</li>
					</ul>
				</div>
				
			</div>
			<div id="custom_step05">
			<!--step05.치즈  -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 5.<br>치즈를 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
					<ul>
						<li class="step01_con01">
							<img alt="" src="../cus_img/cheese/치즈01.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/cheese/치즈02.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/cheese/치즈03.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/cheese/치즈04.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/cheese/치즈05.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/cheese/치즈06.png">
						</li>
					</ul>
				</div>
				
			</div>
			<div id="custom_step06">
			<!--step06.드레싱 -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 6.<br>소스를 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
					<ul>
						<li class="step01_con01">
							<img alt="" src="../cus_img/source/sesame.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/source/indian.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/source/arabian.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/source/chilli.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/source/singa.png">
						</li>
						<li class="step01_con01">
							<img alt="" src="../cus_img/source/jap_miso.png">
						</li>
					</ul>
				</div>
				
			</div>
			
			<div id="custom_under">
			<!-- 밑에 버튼들 -->
			<!-- width:1000px, height:271px -->
			
				<div id="custom_button" class="custom_bt">
					<!-- 다시 선택하기, 구매하기 -->
					<a href="#">
						<input type="button" title="다시 선택" alt="다시 선택" value="다시 선택" class="btn_custom01" id="log.custom">
					</a>
					<a href="#">
						<input type="button" title="구매하기" alt="구매하기" value="구매하기" class="btn_custom02" id="log.custom">
					</a>
				</div>
			
			</div>
			
			
		</div>
		
		</form>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>