<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cart_장바구니페이지</title>
	<link href="../css/cart_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="cart_wrap">
	<!-- event_wrap의 크기 => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<img alt="" src="../img/topDrop.png">
		
		<!-- <div id="cart_keyimg">
			keyimage부분입니다.
			cart_keyimage부분입니다.
		</div> -->
		
		<div id="key">
			<div class="key_con01">장바구니</div>
			<div class="key_con02">주문하실 상품 및 수량을 확인해주세요.</div>
		</div>
		
		
		<div id="cart_container">
		<!-- step,content를 포함한다. -->
		<!-- 로그인(session) 상태인 경우, step,content를 띄어 준다. -->
		<!-- 로그아웃(session) 상태인 경우, "로그인 후 사용 가능 합니다!"가 포함된 간단한 이미지를 띄어 준다. => 밑에 회원가입, 로그인 버튼 기입하기 -->
			<!-- <div id="step">
			step01 장바구니 > step02 주문결제 > step03 결제 완료
				<h2 class="step_up">01 장바구니 > 02 주문결제 > 03 결제 완료</h2>
			</div> -->
			
			<div id="content">
				<div id="cart_con01">
				<!-- '장바구니' 타이틀 -->
					<h3 class="cart_title">장바구니</h3>
				</div>
				<div id="cart_con02">
				<!-- 장바구니의 메인 => 표 모양의 주문내역 보여주기 -->
					<!-- 장바구니의 메인 => 표 모양의 주문내역 보여주기 -->
					<table border="1">
						<tr>
							<td class="th01">
								<input type="checkbox" value="" name="">
								전체 선택
							</td>
							<td class="th02">상품명</td>
							<td class="th03">수량</td>
							<td class="th04">적립</td>
							<td class="th05">상품금액</td>
							<td class="th06">배송비</td>
						</tr>
						<tr>
							<td class="td01">
								<input type="checkbox" value="" name="">
							</td>
							<td class="td02">임시</td>
							<td class="td03">임시</td>
							<td class="td04">임시</td>
							<td class="td05">임시</td>
							<td class="td06">임시</td>
						</tr>
					</table>
				</div>
				<div id="cart_con03" class="cart_a">
				<!-- 장바구니 비우기, 쇼핑 계속하기, 장바구니 결제하기 -->
					<a>
						<input type="button" title="결제하기" alt="결제하기" value="결제하기"
							 onclick="" class="btn_cart03" id="log.cart">
					</a>
					<a href="classic.jsp">
						<input type="button" title="계속 쇼핑하기" alt="계속 쇼핑하기" value="계속 쇼핑하기" 
							 class="btn_cart02" id="log.cart">
					</a>
					<a>
						<input type="button" title="장바구니 비우기" alt="장바구니 비우기" value="장바구니 비우기"
							 onclick="" class="btn_cart01" id="log.cart">
					</a>
				</div>
			</div>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>