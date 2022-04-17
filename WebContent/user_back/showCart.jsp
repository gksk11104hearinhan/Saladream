<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>장바구니 창 보여주기</title>
</head>
<body>
	<h2>장바구니 내역입니다.</h2>
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
				<form>
				<div>
				<table border="1">
					<tr>
						<td>상품명</td>
						<td>수량</td>
						<td>상품금액</td>
						<td>배송비</td>
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
						%>
						
							<tr>
								<td><%= pname %></td>
								<td><%=cproductNum01 %></td>
								<td><%=allPrice %>원</td>
								<td>3000원</td>
							</tr>
						
						<%
						}
					}
					%>
						</table>
						</div>
						<a href="./deleteAllCart.jsp">비우기</a>
						<a href="./order.jsp">구매하기</a>
						</form>
					<% 
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	%>

</body>
</html>