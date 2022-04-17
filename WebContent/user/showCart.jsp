<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>장바구니 창 보여주기</title>
	<link href="../css/cart_style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="fixtop.jsp"></jsp:include>
	
	<div id="cart_wrap">
	<!-- event_wrap의 크기 => width=1000,height=? -->
		
		<!-- <img alt="" src="../img/topDrop.png"> -->
		
		<!-- <div id="cart_keyimg">
			keyimage부분입니다.
			cart_keyimage부분입니다.
		</div> -->
		
		<div id="key">
			<div class="key_con01">MY CART</div>
			<div class="key_con02">주문하실 상품 및 수량을 정확하게 확인해주세요.</div>
		</div>
	
	<%
		try {
			//1. con연결
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("showcCart_test.jsp의 1번 커넥터 연결 성공");
			
			//2. db연결
			String url = "jdbc:mysql://localhost:3306/saladream";
			String user = "root";
			String password = "123456";
			Connection con = DriverManager.getConnection(url, user, password);
			
			String cno01 = session.getId();
			
			String sql = "select * from cart where cno01 = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cno01);
			
			ResultSet rs = ps.executeQuery();
			
			if (!rs.next()) {
				%>
				<div id="cart_table01">
				<table id="table_line01">
					<tr>
						<td class="table01_Ctd01">전체 선택</td>
						<td class="table01_Ctd02">상품명</td>
						<td class="table01_Ctd03">수량</td>
						<td class="table01_Ctd04">적립</td>
						<td class="table01_Ctd05">상품금액</td>
						<td class="table01_Ctd06">배송비</td>
					</tr>
					<tr>
						<td colspan="6"  class="table01_Ctd07">장바구니에 담긴 상품이 없습니다.</td>
					</tr>
				</table>
				</div>
				
				<div id="cart_con01">
					<!-- 전체 선택, 선택 삭제, 품절 품목 삭제 -->
					<span class="Ccon01_text01">
						<input type="checkbox">
						전체 선택
					</span>
					<span class="Ccon01_text02">
						선택삭제
					</span>
					<span class="Ccon01_text03">
						품절 상품 삭제
					</span>
				</div>
				
				<div id="cart_con02">
					<!-- 네모 박스 4개 -->
					<ul>
						<li>
						<div class="Ccon2_box01">
							<div class="Cbox01_text03">
								전체 상품 금액
							</div>
							<div class="Cbox01_text04">
								0 원
							</div>
						</div>
						</li>
						<li class="Cbox01_text05"> - </li>
						<li>
						<div class="Ccon2_box01">
							<div class="Cbox01_text03">
								상품 할인 금액
							</div>
							<div class="Cbox01_text04">
								0 원
							</div>
						</div>
					</li>
						<li class="Cbox01_text05"> + </li>
						<li>
						<div class="Ccon2_box01">
							<div class="Cbox01_text03">
								배송비
							</div>
							<div class="Cbox01_text04">
								0 원
							</div>
						</div>
						</li>
						<li class="Cbox01_text05"> = </li>
						<li>
						<div class="Ccon2_box01">
							<div class="Cbox01_text03">
								결제 예정금액
							</div>
							<div class="Cbox01_text04">
								0 원
							</div>
						</div>
						</li>
					</ul>
				</div>
				
				<div id="clear"></div>
		
				<div id="cart_con03" class="cart_a">
					<!-- 장바구니 비우기, 쇼핑 계속하기, 장바구니 결제하기 -->
						<a href="./order.jsp">
							<input type="button" title="결제하기" alt="결제하기" value="결제하기"
								 onclick="" class="btn_cart03" id="log.cart">
						</a>
						<a href="classic.jsp">
							<input type="button" title="계속 쇼핑하기" alt="계속 쇼핑하기" value="계속 쇼핑하기" 
								 class="btn_cart02" id="log.cart">
						</a>
						<a href="./deleteAllCart.jsp">
							<input type="button" title="장바구니 비우기" alt="장바구니 비우기" value="장바구니 비우기"
								 onclick="" class="btn_cart01" id="log.cart">
						</a>
					</div>
				
				<%
			} else {
				%>
				<form>
				<div id="cart_table02">
				<table id="table_line01">
					<tr>
						<td class="table01_Ctd01">
							<input type="checkbox">
							전체 선택
						</td>
						<td class="table01_Ctd02">상품명</td>
						<td class="table01_Ctd03">수량</td>
						<td class="table01_Ctd04">적립</td>
						<td class="table01_Ctd05">상품금액</td>
						<td class="table01_Ctd06">배송비</td>
					</tr>
				
				
				<%
					
					String sql5 = "select product_no01, cproductNum01 from cart where cno01 =?";
					PreparedStatement ps5 = con.prepareStatement(sql5);
					ps5.setString(1, cno01);
					
					ResultSet rs5 = ps5.executeQuery();
					int total = 0;
					
					while (rs5.next()) {
						String pno01 = rs5.getString("product_no01");
						int cproductNum01 = rs5.getInt("cproductNum01");
						
						String sql6 = "select pname, pprice from product where pno = ?";
						PreparedStatement ps6 = con.prepareStatement(sql6);
						ps6.setString(1, pno01);
						
						ResultSet rs6 = ps6.executeQuery();
						if (rs6.next()) {
							String pname = rs6.getString("pname");
							int pprice = rs6.getInt("pprice");
						
							int allPrice = pprice * cproductNum01;
							int savePrice = allPrice / 100;
							int totalPrice = allPrice + 3000;
						%>
						
							<tr>
								<td class="table01_Ctd01">
									<input type="checkbox">
									선택
								</td>
								<td class="table01_Ctd02"><%= pname %></td>
								<td class="table01_Ctd03"><%=cproductNum01 %></td>
								<td class="table01_Ctd04"><%=savePrice %></td>
								<td class="table01_Ctd05"><%=allPrice %>원</td>
								<td class="table01_Ctd06">3000원</td>
							</tr>
						<%
							}
						}
						%>
						
						</table>
						</div>
						
						<div id="cart_con01">
							<!-- 전체 선택, 선택 삭제, 품절 품목 삭제 -->
							<span class="Ccon01_text01">
								<input type="checkbox">
								전체 선택
							</span>
							<span class="Ccon01_text02">
								선택삭제
							</span>
							<span class="Ccon01_text03">
								품절 상품 삭제
							</span>
						</div>
						
						<div id="cart_con02">
							<!-- 네모 박스 4개 -->
							<ul>
								<li>
								<div class="Ccon2_box01">
									<div class="Cbox01_text03">
										전체 상품 금액
									</div>
									<div class="Cbox01_text04">
										[임시] 원
									</div>
								</div>
								</li>
								<li class="Cbox01_text05"> - </li>
								<li>
								<div class="Ccon2_box01">
									<div class="Cbox01_text03">
										상품 할인 금액
									</div>
									<div class="Cbox01_text04">
										0 원
									</div>
								</div>
								</li>
								<li class="Cbox01_text05"> + </li>
								<li>
								<div class="Ccon2_box01">
									<div class="Cbox01_text03">
										배송비
									</div>
									<div class="Cbox01_text04">
										3000원
									</div>
								</div>
								</li>
								<li class="Cbox01_text05"> = </li>
								<li>
								<div class="Ccon2_box01">
									<div class="Cbox01_text03">
										결제 예정금액
									</div>
									<div class="Cbox01_text04">
										[임시] 원
									</div>
								</div>
								</li>
							</ul>
						</div>
						
						<div id="clear"></div>
						
					
						<div id="cart_con03" class="cart_a">
							<!-- 장바구니 비우기, 쇼핑 계속하기, 장바구니 결제하기 -->
								<a href="./order.jsp">
									<input type="button" title="결제하기" alt="결제하기" value="결제하기"
										 onclick="" class="btn_cart03" id="log.cart">
								</a>
								<a href="classic.jsp">
									<input type="button" title="계속 쇼핑하기" alt="계속 쇼핑하기" value="계속 쇼핑하기" 
										 class="btn_cart02" id="log.cart">
								</a>
								<a href="./deleteAllCart.jsp">
									<input type="button" title="장바구니 비우기" alt="장바구니 비우기" value="장바구니 비우기"
										 onclick="" class="btn_cart01" id="log.cart">
								</a>
							</div>

						</form>
					<% 
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	%>

		
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>