<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>주문하기</title>
	<link href="../css/viewPro_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="viewPro_wrap">
	<!-- viewPro_wrap의 크기 => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
	<hr>
	
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
				
				장바구니가 비어있습니다.
				
				<%
			} else {
				%>
				<div>
				<table border="1">
					<tr>
						<td>상품명</td>
						<td>수량</td>
						<td>상품금액</td>
						<td>상품삭제</td>
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
							total += allPrice;
						%>
						
							<tr>
								<td><%= pname %></td>
								<td><%=cproductNum01 %></td>
								<td><%=allPrice %>원</td>
								<td><a href="./deleteCart.jsp?prdNo=<%= pno01%>">상품삭제</a></td>
							</tr>
						
						<%
						}
					}
					%>
						<tr>
							<td>전체 주문 총액</td>
							<td colspan="3"><%=total %>원</td>
						</tr>
						</table>
						</div>
						<div>
				<form name="form" method="POST" action="orderOK.jsp" accept-charset="utf-8">
				<div id="viewPro_con03">
				<input type="hidden" name="opay" value="<%=total%>">
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
				
				<div id="clear"></div>
				<div class="vPcon03_text02">
					<a>
						<input type="submit" title="주문확인" alt="주문확인" value="주문확인">
					</a>
				</div>
			</div>
		
		
				</form>
	</div>
					<% 
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	%>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>