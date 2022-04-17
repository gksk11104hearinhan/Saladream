<%@page import="saladream.ProductDTO"%>
<%@page import="saladream.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    	//인코딩, 글씨 깨지는것 방지
    	request.setCharacterEncoding("EUC-KR");
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>classicViewProduct_상품 상세 페이지</title>
	<link href="../css/viewPro_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function directOrd()        //  "즉시구매하기" 버튼을 클릭시 호출
		{
			/* var str=productFrm.qty.value; */
			var frm = document.productFrm;
			frm.action = "directOrder.jsp";
			frm.submit();
		}
	
	
		function addCart()              //  "장바구니담기" 버튼을 클릭시 호출
		{
			/* var str=productFrm.qty.value; */
			var frm = document.productFrm;
			/* frm.action = "cart.jsp"; */
			frm.action = "cart_test.jsp"    // 장바구니 DB확인을 위한 임시 연결 페이지
			frm.submit();
		}
	</script>
</head>
<body>
<form action="" method="post" name="productFrm">
	<div id="viewPro_wrap">
	<!-- viewPro_wrap의 크기 => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<img alt="" src="../img/topDrop.png">
		
		<!-- <div id="viewPro_keyimg">
			keyimage부분입니다.
			viewPro_keyimage부분입니다.
		</div> -->
		
		<div id="viewPro_content">
			<!-- 상품 상세 페이지 입니다. -->
			
			<jsp:useBean id="dto" class="saladream.ProductDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="dto"/>
			
			<%
				ProductDAO dao = new ProductDAO();
				ProductDTO dto2 = dao.select(dto);
				
				String pno = request.getParameter("pno"); //상세조회하고자하는 상품번호를 받아온다.
			%>
			<div id="viewPro_con">
				<div id="viewPro_con01">
					<!-- 상품 이미지 -->
					<img alt="" src="../p_img/<%= dto2.getPdetailimage() %>.png">
				</div>
				<div id="viewPro_con02">
					<div id="vP_con001">
					<!-- Salad > 상품번호
						 상품이름
						 판매가 (권장 소비가)
						 총량 (샐러드의 무게)
						 들어간 재료 (샐러드 재료들 나열)
						 수량 선책 혹은 (이벤트)할인율 확인 
						 총 판매 단가 : 할인된 가격 혹은 수량선택 후 최종 가격 -->
						<div class="vP_text01">
							[샐러드림] <%= dto2.getPname() %>
						</div>
						<div class="vP_text02">
							<%= dto2.getPprice() %>원
						</div>
						<div class="vP_text03">
							<%= dto2.getPdescript() %>
						</div>
						<div class="vP_text04">
							<span class="text04_001">배송방법</span>
							<span class="text04_002">택배 배송</span>
						</div>
						<div class="vP_text05">
							<span class="text04_001">배송비</span>
							<span class="text04_003">3000원</span>
						</div>
						<div class="vP_text06">
							<span class="text04_001">중량 추가 선택</span>
							<div class="text06_con">
								<select name="option01" id="option01" class="selClassic">
									<option value="0">중량 추가 선택(선택)</option>
									<option value="350">350g(1인분)</option>
									<option value="450">450g</option>
									<option value="550">550g</option>
									<option value="650">650g</option>
									<option value="750">750g</option>
									<option value="850">850g</option>
								</select>
							</div>
						</div>
						<div class="vP_text07">
							<span class="text04_001">드레싱 선택</span>
							<div class="text06_con">
								<select name="option02" id="option02" class="selClassic">
									<option value="0">드레싱 선택(선택)</option>
									<option value="sesame">sesame소스</option>
									<option value="indian">indian소스</option>
									<option value="arabian">arabian소스</option>
									<option value="chilli">chilli소스</option>
									<option value="singa">singa소스</option>
									<option value="miso">miso소스</option>
								</select>
							</div>
						</div>
						<div class="vP_text08">
							<span class="text04_001">구매수량</span>
							<div class="text06_con">
								<select name="option03" id="option03" class="selClassic">
									<option value="0">수량 선택(선택)</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div id="clear"></div>
			
			<div id="viewPro_con03">
				<!-- 총 상품 금액, 장바구니 담기, 바로 구매하기 -->
				<div class="vPcon03_text01">
					<span class="text04_004">총 상품금액: </span>
					<span class="priceClassic"><%= dto2.getPprice() %>원</span>
				</div>
				<div id="clear"></div>
				<div class="vPcon03_text02">
					<a href="classic.jsp">
						<input type="button" title="목록으로" alt="목록으로" value="목록으로"
							 class="btn_classicVp01" id="log.classicView">
					</a>
					<a>
						<input type="button" title="장바구니 담기" alt="장바구니 담기" value="장바구니 담기"
							 onclick="addCart()" class="btn_classicVp02" id="log.classicView">
					</a>
					<a>
						<input type="button" title="구매하기" alt="구매하기" value="구매하기"
							 onclick="directOrd()" class="btn_classicVp03" id="log.classicView">
					</a>
				</div>
				
				<div id="vPcon03_text03">
				<!-- 관련상품(버튼 누르면 타 상품 나옴) -->
					<div id="vPtext03_title">관련상품</div>
					<div id="vPtext03_content">
					<!-- height:333px -->
						<ul class="">
							<li class="">
							<!-- width:168px, height:198px -->
								<div class="tumnail">
									<!-- 이미지 -->
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div id="viewPro_con04">
				<!-- 상세 상품 설명 창(디자인) -->
				<!-- 상세 정보, 고객 후기, Q&A, 배송/교환/반품 -->
				<div id="vPtext04_title01">
					<ul>
						<li>상세 정보</li>
						<li>고객후기</li>
						<li>Q&A</li>
						<li>배송/교환/반품</li>
					</ul>
				</div>
				<div id="vPtext04_content01">
					상세정보 컨텐츠
				</div>
				
				<div id="clear"></div>
				
				<div id="vPtext04_title02">
					<ul>
						<li>상세 정보</li>
						<li>고객후기</li>
						<li>Q&A</li>
						<li>배송/교환/반품</li>
					</ul>
				</div>
				<div id="vPtext04_content02">
					고객후기 컨텐츠
				</div>
				
				<div id="vPtext04_title03">
					<ul>
						<li>상세 정보</li>
						<li>고객후기</li>
						<li>Q&A</li>
						<li>배송/교환/반품</li>
					</ul>
				</div>
				<div id="vPtext04_content03">
					Q&A 컨텐츠
				</div>
				
				<div id="vPtext04_title04">
					<ul>
						<li>상세 정보</li>
						<li>고객후기</li>
						<li>Q&A</li>
						<li>배송/교환/반품</li>
					</ul>
				</div>
				<div id="vPtext04_content04">
					배송/교환/반품 컨텐츠
				</div>
			</div>
			
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
	
</form>
</body>
</html>