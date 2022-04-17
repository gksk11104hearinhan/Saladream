<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="saladream.ProductDTO"%>
<%@page import="saladream.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
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
		
	<%
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductDTO> list = dao.selectAll(); //ProductDAO의 selectAll() 함수 불러오기
		int count = list.size();
						
	%> 
		
		<div id="classic_con01">
			<!-- 상품보여주기 -->
			<ul class="classic_list">

		<%
			for(ProductDTO dto : list) {
		%> 
				<li>
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a태그
								 span class=icon 으로 할인율 이미지
								 button으로 호버 할 경우 상세, 장바구니, 공유 링크 생성 -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=<%= dto.getPno() %>">
								 	<img alt="" src="../p_img/<%= dto.getPimage() %>.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 <!-- <div class="icons">
								     <a href="#"><img src="c_img/classic_hover_icon01.png" width="42px" height="42px"></a>
								     <a href="#"><img src="c_img/classic_hover_icon02.png" width="42px" height="42px"></a>
								     <a href="#"><img src="c_img/classic_hover_icon03.png" width="42px" height="42px"></a>
								  </div> -->
								
						</div>
						
						<div class="classic_info">
							<!-- span class=classic_name 상품이름
								 span class=classic_cost 가격
								 span class=classic_desc 간단 설명 -->
								 <div id="cname">
									 <span class="classic_name">
									 	<%= dto.getPname() %>
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	<%= dto.getPprice() %>원
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	<%= dto.getPdescript() %>
									 </span>
								 </div>
						</div>
						
						<div id="classic_tag">
							<!-- 하트69 부분 -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
		<%
			}
		%>
				

			</ul>
		</div>
		<div id="clear">
			
		</div>

		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>