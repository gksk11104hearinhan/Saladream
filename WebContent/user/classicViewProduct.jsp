<%@page import="java.util.ArrayList"%>
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
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	
	<link href="../css/viewPro_style.css" rel="stylesheet" type="text/css">
	<link href="../css/vpSwiper_style.css" rel="stylesheet" type="text/css">
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
			//frm.action = "cart_test.jsp"    // 장바구니 DB확인을 위한 임시 연결 페이지
			frm.action = "inCart.jsp" 
			frm.submit();
		}
	</script>
</head>
<body>

<jsp:include page="fixtop.jsp"></jsp:include>

<form action="" method="post" name="productFrm">
	
	<div id="viewPro_wrap">
	<!-- viewPro_wrap의 크기 => width=1000,height=? -->
		
		<!-- <img alt="" src="../img/topDrop.png"> -->
		
		<!-- <div id="viewPro_keyimg">
			keyimage부분입니다.
			viewPro_keyimage부분입니다.
		</div> -->
		
		<div id="viewPro_content">
			<!-- 상품 상세 페이지 입니다. -->
			
			<jsp:useBean id="dto" class="saladream.ProductDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="dto"/>
			
			<%
				System.out.print(dto);
				ProductDAO dao = new ProductDAO();
				ProductDTO dto2 = dao.select(dto);
				
				String pno = request.getParameter("pno"); //상세조회하고자하는 상ㅇ품번호를 받아온다.
			%>
			<input type="hidden" name="pno" value="<%=pno%>">
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
							<span class="text04_001">중량선택</span>
							<div class="text06_con">
								<select name="option01" id="option01" class="selClassic">
									<option value="0">중량 선택(선택)</option>
									<option value="400">400g(1인분)</option>
									<option value="600">600g</option>
									<option value="800">800g</option>
									<option value="1000">1000g</option>
								</select>
							</div>
						</div>
						<div class="vP_text07">
							<span class="text04_001">소스선택</span>
							<div class="text06_con">
								<select name="option02" id="option02" class="selClassic">
									<option value="0">소스 선택(선택)</option>
									<option value="참깨소스">참깨소스</option>
									<option value="화이트소스">화이트소스</option>
									<option value="오리엔탈소스">오리엔탈소스</option>
									<option value="라임칠리소스">라임칠리소스</option>
									<option value="칠리마요소스">칠리마요소스</option>
									<option value="와사비꿀소스">와사비꿀소스</option>
								</select>
							</div>
						</div>
						<div class="vP_text08">
							<span class="text04_001">구매수량</span>
							<div class="text06_con">
								<select name="option03" id="option03" class="selClassic">
									<option value="0">수량 선택(선택)</option>
									<option value="1">01</option>
									<option value="2">02</option>
									<option value="3">03</option>
									<option value="4">04</option>
									<option value="5">05</option>
									<option value="6">06</option>
									<option value="7">07</option>
									<option value="8">08</option>
									<option value="9">09</option>
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
			</div>
			
			
			<%
				ProductDAO dao3 = new ProductDAO();
				ArrayList<ProductDTO> list = dao3.selectAll(); //ProductDAO의 selectAll() 함수 불러오기
				int count = list.size();
								
			%> 
			<div id="viewPro_con04">
				<!-- 다른 상품 -->
				<div id="vP_con_title01">
					<img alt="" src="../img/mini_logo.png" style="width: 23px; height: 21px;">
					관련상품
				</div>
				<!-- Swiper -->
				  <div class="swiper-container">
				    <div class="swiper-wrapper">
				    <%
						for(ProductDTO dto3 : list) {
					%> 
				      <div class="swiper-slide" id="swipe_slide_style">
				      	<ul>
				      	<li>
					      	<div>
					      	<a class="slide_thum_img" href="classicViewProduct.jsp?pno=<%= dto3.getPno() %>">
								<img alt="" src="../p_img/<%= dto3.getPimage() %>.png" class="swipe_img" >
							</a>
							</div>
						</li>
						<li>
							<div id="swiper_name">
								<%= dto3.getPname() %>
							</div>
						</li>
						<li>
							<div id="swiper_price">
								<%= dto3.getPprice() %>원
							</div>
						</li>
				      </ul>
				      </div>
				    <%
						}
				    %>
				    </div>
				    <div class="swiper-button-next">
				    	<img alt="" src="../vp_img/arrow_right.png">
				    </div>
				    <div class="swiper-button-prev">
						<img alt="" src="../vp_img/arrow_left.png">
				    </div>
				  </div>
				  <!-- Initialize Swiper -->
				  <script>
				    var swiper = new Swiper('.swiper-container', {
				      slidesPerView: 4,
				      direction: getDirection(),
				      navigation: {
				        nextEl: '.swiper-button-next',
				        prevEl: '.swiper-button-prev',
				      },
				      on: {
				        resize: function () {
				          swiper.changeDirection(getDirection());
				        }
				      }
				    });
				
				    function getDirection() {
				      var windowWidth = window.innerWidth;
				      var direction = window.innerWidth <= 700 ? 'vertical' : 'horizontal';
				
				      return direction;
				    }
				  </script>
			</div>
			
		</div>
		
		<div id="viewPro_content02">
			<!-- 상세보기부터 ~ 푸터 전까지
				 width:602px -->
			<div id="vP_content02_title01">
				<ul>
					<li class="con02_subtitle01">
						<a href="#vP_content02_title01">
							상세정보
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title02">
							고객후기
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title03">
							Q&A
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title04">
							배송/교환/반품
						</a>
					</li>
				</ul>
			</div>
			<div id="clear"></div>
			<div id="vP_content02_con01">
				<img alt="" src="../vp_img/tunaproductdetail.png"> <!-- product에서 값 불러오는 걸로 교체 요망 -->
			</div>
			
			<div id="vP_content02_title02">
				<ul>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title01">
							상세정보
						</a>
					</li>
					<li class="con02_subtitle01">
						<a href="#vP_content02_title02">
							고객후기
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title03">
							Q&A
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title04">
							배송/교환/반품
						</a>
					</li>
				</ul>
			</div>
			<div id="clear"></div>
			<div id="vP_content02_con02">
				<div class="vPCon02_matTile01">
					고객 후기
				</div>
				<div class="vPCon02_matTile02">
					상품을 구매하신 분들이 작성한 후기입니다.
				</div>
				<div>
					<table class="table_line01">
						<tr style="text-align: center; height: 45px;">
							<td class="table_line02">번호</td>
							<td class="table_line03">제목</td>
							<td class="table_line04">작성자</td>
							<td class="table_line05">작성일</td>
						</tr>
						<tr> <!-- reply를 작성하여 데이터 처리 요망! -->
							<td class="table_line02">001</td>
							<td class="table_line03">참치마요샐러드 너무 맛있어요~</td>
							<td class="table_line04">익명</td>
							<td class="table_line05">2020.06.09</td>
						</tr>
						<tr> <!-- reply를 작성하여 데이터 처리 요망! -->
							<td class="table_line02">002</td>
							<td class="table_line03">리뷰이벤트 참여해요~</td>
							<td class="table_line04">익명</td>
							<td class="table_line05">2020.06.16</td>
						</tr>
					</table>
				</div>
				<div class="vPCon_matBtn00">
					<a href="#">후기쓰기</a> <!-- jQuery로 받아오기 -->
				</div>
			</div>
			
			<div id="vP_content02_title03">
				<ul>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title01">
							상세정보
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title02">
							고객후기
						</a>
					</li>
					<li class="con02_subtitle01">
						<a href="#vP_content02_title03">
							Q&A
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title04">
							배송/교환/반품
						</a>
					</li>
				</ul>
			</div>
			<div id="clear"></div>
			<div id="vP_content02_con03">
				<div class="vPCon02_matTile01">
					Q&A
				</div>
				<div class="vPCon02_matTile02">
					구매하시려는 상품에 대해 궁금하신 점이 있으시면 답변해 드리겠습니다.
				</div>
				<div>
					<table class="table_line01">
						<tr style="text-align: center; height: 45px;">
							<td class="table_line02">상태</td>
							<td class="table_line03">제목</td>
							<td class="table_line04">작성자</td>
							<td class="table_line05">작성일</td>
						</tr>
						<tr> <!-- reply를 작성하여 데이터 처리 요망! -->
							<td class="table_line02">미답변</td>
							<td class="table_line03">소스는 2개 선택할 수 없나요?</td>
							<td class="table_line04">익명</td>
							<td class="table_line05">2020.06.08</td>
						</tr>
					</table>
				</div>
				<div class="vPCon_matBtn00">
					<a href="#">상품문의</a> <!-- jQuery로 받아오기 -->
				</div>
			</div>
			
			<div id="vP_content02_title04">
				<ul>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title01">
							상세정보
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title02">
							고객후기
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title03">
							Q&A
						</a>
					</li>
					<li class="con02_subtitle01">
						<a href="#vP_content02_title04">
							배송/교환/반품
						</a>
					</li>
				</ul>
			</div>
			<div id="clear"></div>
			<div id="vP_content02_con04">
				<img alt="" src="../vp_img/productdetailWarning.png"> <!-- product에서 값 불러오는 걸로 교체 요망 -->
			</div>
		</div>
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</form>
</body>
</html>