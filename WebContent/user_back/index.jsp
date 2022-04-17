<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Main_메인 페이지</title>
	
	<!-- <link href="../css/main_style.css" rel="stylesheet" type="text/css"> -->
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
	<link href="../css/index_style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
		String id = (String)session.getAttribute("id");
	%>

	<div id="main_wrap">
	<!-- main_wrap의 크기 => width=1000,height=3750 -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<div id="main_keyimg">
			<!-- keyimage부분입니다. -->
			<!-- keyimage부분입니다. 높이 : 470 -->
		</div>
		<div id="main_key_sliceimg">
			<!-- 잘린  키 이미지 부분 : 토마토 밑 부분, 높이:110 -->
		</div>
		<div id="main_con_classic">
			<!-- 35.28cm 24.59cm //border => 1.3px (1000 697(700)) <br>
			높이 700-110 : 590임! -> 640
			content -> classic 소개 -->
			
		</div>
		<div id="main_classic_custom_mid">
			<!-- 높이 50의 토마토와 잎사귀 짤린부분을 커버해주는 부분 -->
		</div>
		<div id="main_con_custom">
			<div id="con_custom_01">
				<!-- 1000px 590px -> 540px; <br>
				content -> "베지메뉴"라고 쓰인 부분 custom 소개 -->
			</div>
			<div id="con_custom_02">
				<!-- 1000px 240px <br>
				content -> custom(커스텀) 소개 -->
			</div>
		</div>
		<div id="main_con_brand">
			<!-- 35.28cm 20.53cm (1000 582(580)) <br>
			content -> brand 소개, -->
			<ul>
				<li class="snip1431">
				<figure class="snip1432">
					<img src="../m_img/main_brand_con01.png" alt="Quality" />
					<figcaption>
				    <div>
				    	<h3>최고의 맛과 품질을 위해 노력합니다</h3>
				    	<h3>최고의 맛과 품질을 위해 노력합니다</h3>
				    </div>
				    <div>
				    	<h2>Quality</h2>
				    </div>
					</figcaption>
					<!-- <a href="#"></a> -->
				</figure>
				</li>
				<li>
				<figure class="snip1433">
					<img src="../m_img/main_brand_con02.png" alt="Customer" />
					<figcaption>
				    <div>
				    	<h3>고객의 행복을 먼저 생각하는 기업입니다</h3>
				    	<h3>고객의 행복을 먼저 생각하는 기업입니다</h3>
				    </div>
				    <div>
				    	<h2>Customer</h2>
				    </div>
					</figcaption>
					<!-- <a href="#"></a> -->
				</figure>
				</li>
			</ul>
		</div>
		<div id="main_con_event">
			<!-- 35.28cm 28.19cm (1000 799(800)) <br>
			content -> event 소개 -->
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>