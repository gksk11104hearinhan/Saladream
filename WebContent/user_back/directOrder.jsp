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
	<title>directOrder_즉시주문</title>
	<link href="../css/viewPro_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function directOrd()        
		{
			var frm = document.directOrdFrm;
			frm.action = "directOrderOK.jsp";
			frm.submit();
		}
	
	</script>
</head>
<body>
<form action="" method="post" name="directOrdFrm" accept-charset="utf-8">
	<div id="viewPro_wrap">
	<!-- viewPro_wrap의 크기 => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<img alt="" src="../img/topDrop.png">
		
		<div id="viewPro_content">
			<!--즉시주문 페이지 입니다. -->
			
			<jsp:useBean id="dto" class="saladream.ProductDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="dto"/>
			
			<%
				System.out.print(dto);
				ProductDAO dao = new ProductDAO();
				ProductDTO dto2 = dao.select(dto);

				if(request.getParameter("option03") == null){
					response.sendRedirect("./classic.jsp");
					return;
				}
				
				if(request.getParameter("pno") == null){
					response.sendRedirect("./classic.jsp");
					return;
				}
				if(request.getParameter("option03").equals("0")){
					response.sendRedirect("./classicViewProduct.jsp?pno="+request.getParameter("pno"));
					return;
				}
				
				String pno = request.getParameter("pno"); //상세조회하고자하는 상ㅇ품번호를 받아온다.
				int cnt = Integer.parseInt(request.getParameter("option03"));
			%>
			<div id="viewPro_con">
				<input type="hidden" value="<%=pno%>" name="pno">
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
							<%=dto2.getPprice() %>원
						</div>
						<div class="vP_text08">
							<span class="text04_001">구매수량</span>
							<div class="text06_con">
								<input type="text" value="<%=cnt  %>" name="oproductNum" readonly="readonly">
								 개
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div id="clear"></div>
			
			<div id="viewPro_con03">
				<div>
					<div>
						<span>주문자 이름</span>
						<input type="text" name="ordrecv">
					</div>
					<div>
						<span>주문자 주소</span>
						<input type="text" name="ordrecvaddr">
					</div>
					<div>
						<span>주문자 연락처</span>
						<input type="text" name="ordrecvtel01">
						<input type="text" name="ordrecvtel02">
					</div>
					<div>
						<span>입금은행</span>
						<input type="text" name="obank">
					</div>
					<div>
						<span>카드번호</span>
						<input type="text" name="ocardNum">
					</div>
					<div>
						<span>카드비밀번호</span>
						<input type="text" name="ocardPassword">
					</div>
				</div>
				
				<!-- 총 상품 금액, 장바구니 담기, 바로 구매하기 -->
				<div class="vPcon03_text01">
					<span class="text04_004">총 상품금액: </span>
					<span class="priceClassic">
					<input type="hidden" value="<%= dto2.getPprice() * cnt %>" name="opay" readonly="readonly"> 
					<%= dto2.getPprice() * cnt %>원
					</span>
				</div>
				<div id="clear"></div>
				<div class="vPcon03_text02">
					<a>
						<input type="button" title="주문확인" alt="주문확인" value="주문확인"
							 onclick="directOrd()" class="btn_classicVp03" id="log.classicView">
					</a>
				</div>
			</div>
			
			<div id="viewPro_con04">
				<!-- 상세 상품 설명 창(디자인) -->
			</div>
			
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
	
</form>
</body>
</html>