<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Classic_상품 페이지</title>
	<link href="../css/classic_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id="classic_wrap">
	<!-- classic_wrap의 크기 => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<div id="classic_keyimg">
			<!-- keyimage부분입니다. -->
			<!-- classic_keyimage부분입니다.
				 연두색 박스의 믈래식 샐러드 버튼까지 포함 -> 높이 480px;-->
			<div id="classic_key_button">
				<!-- 연두색 박스 크기 : width: 432px, height: 53px -->
				<img alt="" src="../c_img/classic_key_button.png">
			</div>
		</div>
		
		<div id="classic_word01">
			<!-- "유기농 야채와~클래식한 샐러드"부분 -> 높이 100px -->
			<!-- 컨텐츠의 크기는 width:570px height:100px -->
		</div>
		
		<div id="classic_con01">
			<!-- 상품보여주기 -->
			<ul class="classic_list">

				<li> <!-- 로스트 비프 -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a태그
								 span class=icon 으로 할인율 이미지
								 button으로 호버 할 경우 상세, 장바구니, 공유 링크 생성 -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=01">
								 	<img alt="" src="../p_img/로스트비프.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 <div class="icons">
								     <a href="#"><img src="c_img/classic_hover_icon01.png" width="42px" height="42px"></a>
								     <a href="#"><img src="c_img/classic_hover_icon02.png" width="42px" height="42px"></a>
								     <a href="#"><img src="c_img/classic_hover_icon03.png" width="42px" height="42px"></a>
								  </div>
								
						</div>
						<div class="classic_info">
							<!-- span class=classic_name 상품이름
								 span class=classic_cost 가격
								 span class=classic_desc 간단 설명 -->
								 <div id="cname">
									 <span class="classic_name">
									 	로스트 비프 샐러드
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500원
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	신선한 야채와 토핑과 함께
									 	그릴에서 직화로 구워 낸
									 	스페셜한 비프 샐러드
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- 하트69 부분 -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- 참치 -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a태그
								 span class=icon 으로 할인율 이미지
								 button으로 호버 할 경우 상세, 장바구니, 공유 링크 생성 -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=02">
								 	<img alt="" src="../p_img/참치샐러드.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
							<!-- span class=classic_name 상품이름
								 span class=classic_cost 가격
								 span class=classic_desc 간단 설명 -->
								 <div id="cname">
									 <span class="classic_name">
									 	참치 샐러드
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500원
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	신선한 야채와 토핑과 함께
									 	참치를 올려낸 풍미가 뛰어난 
									 	샐러드
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- 하트69 부분 -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- 하루견과 -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a태그
								 span class=icon 으로 할인율 이미지
								 button으로 호버 할 경우 상세, 장바구니, 공유 링크 생성 -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=03">
								 	<img alt="" src="../p_img/하루견과.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
							<!-- span class=classic_name 상품이름
								 span class=classic_cost 가격
								 span class=classic_desc 간단 설명 -->
								 <div id="cname">
									 <span class="classic_name">
									 	하루견과 샐러드
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500원
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	하루에 챙겨야 하는 견과류가 
									 	들어간 건강한 면역력 증진 
									 	샐러드
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- 하트69 부분 -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				
				<li> <!-- 로스트 치킨 -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=04">
								 	<img alt="" src="../p_img/로스트치킨.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
								 <div id="cname">
									 <span class="classic_name">
									 	로스트 치킨 샐러드
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500원
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	신선한 야채와 닭가슴살을
									 	그릴에서 구워 올려 낸 
									 	고단백 샐러드
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- 하트69 부분 -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- 베이컨 -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=05">
								 	<img alt="" src="../p_img/베이컨.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
								 <div id="cname">
									 <span class="classic_name">
									 	베이컨 샐러드
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500원
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	신선한 야채와 토핑과 함께
									 	그릴에서 구워 올려낸 풍미가 
									 	뛰어난 샐러드
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- 하트69 부분 -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- 연어 아보카도 -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=06">
								 	<img alt="" src="../p_img/연어아보카도.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
								 <div id="cname">
									 <span class="classic_name">
									 	연어 아보카도 샐러드
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500원
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	신선한 야채와 토핑과 함께
									 	생연어와 아보카도가 만난 
									 	슈퍼푸드 샐러드
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- 하트69 부분 -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				
				<li> <!-- 쉬림프 -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a태그
								 span class=icon 으로 할인율 이미지
								 button으로 호버 할 경우 상세, 장바구니, 공유 링크 생성 -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=07">
								 	<img alt="" src="../p_img/쉬림프.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
							<!-- span class=classic_name 상품이름
								 span class=classic_cost 가격
								 span class=classic_desc 간단 설명 -->
								 <div id="cname">
									 <span class="classic_name">
									 	쉬림프 샐러드
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500원
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	신선한 야채와 토핑과 함께
									 	멕시칸 스타일의 매콤한 새우가 
									 	올라간 마성의 샐러드
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- 하트69 부분 -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- 리코타치즈 -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a태그
								 span class=icon 으로 할인율 이미지
								 button으로 호버 할 경우 상세, 장바구니, 공유 링크 생성 -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=08">
								 	<img alt="" src="../p_img/리코타치즈.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
							<!-- span class=classic_name 상품이름
								 span class=classic_cost 가격
								 span class=classic_desc 간단 설명 -->
								 <div id="cname">
									 <span class="classic_name">
									 	리코타 치즈 샐러드
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500원
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	신선한 야채와 리코타치즈와 
									 	빵이 제공되어 건강하고 
									 	든든한 한끼샐러드
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- 하트69 부분 -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- 훈제오리 -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a태그
								 span class=icon 으로 할인율 이미지
								 button으로 호버 할 경우 상세, 장바구니, 공유 링크 생성 -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=09">
								 	<img alt="" src="../p_img/훈제오리.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
							<!-- span class=classic_name 상품이름
								 span class=classic_cost 가격
								 span class=classic_desc 간단 설명 -->
								 <div id="cname">
									 <span class="classic_name">
									 	훈제 오리 샐러드
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500원
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	신선한 야채, 토핑과 함쎄 
									 	훈제오리를 올려낸 풍미가  
									 	뛰어난 샐러드
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- 하트69 부분 -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				

			</ul>
		</div>
		<div id="clear">
			
		</div>

		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>