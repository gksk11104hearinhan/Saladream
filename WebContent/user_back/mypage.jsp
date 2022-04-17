<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Mypage_마이페이지</title>
</head>
	<link href="../css/mypage_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="mypage_wrap">
	<!-- mypage_wrap의 크기 => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<div id="mypage_keyimg">
			<!-- keyimage부분입니다. -->
			mypage_keyimage부분입니다.
		</div>
		
		<div id="mypage_content">
			마이페이지 -> 내 주문내역, 회원정보 수정
			<div id="mypage_con01">
				내 주문내역
			</div>
			<div id="mypage_con02">
				회원정보 수정
			</div>
		</div>
		
		<div id="mypage_button" class="mypage_bt">
			<!-- 장바구니 비우기, 쇼핑 계속하기, 장바구니 결제하기 -->
			<a href="#">
				<input type="button" title="내 주문내역" alt="내 주문내역" value="내 주문내역" class="btn_mypage01" id="log.mypage">
			</a>
			<a href="#">
				<input type="button" title="회원정보 수정" alt="회원정보 수정" value="회원정보 수정" class="btn_mypage02" id="log.mypage">
			</a>
			<a href="logout.jsp">
			<input type="button" title="로그아웃" alt="로그아웃" value="로그아웃" class="btn_mypage03" id="log.mypage">
			</a>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>