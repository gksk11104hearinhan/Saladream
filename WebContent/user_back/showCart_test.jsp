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
				
				<table border="1">
					<tr>
						<td>전체 선택</td>
						<td>상품명</td>
						<td>수량</td>
						<td>적립</td>
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
						String pno01 = rs5.getString("pno01");
						int cproductNum01 = rs5.getInt("cproductNum01");
						
						String sql6 = "select pname, pprice from product where pno = ?";
						PreparedStatement ps6 = con.prepareStatement(sql6);
						ps6.setString(1, pno01);
						
						ResultSet rs6 = ps6.executeQuery();
						if (rs6.next()) {
							String pname = rs6.getString("pname");
							int pprice = rs6.getInt("pprice");
						
						
						%>
						
							<tr>
								<td>선택창(checkbox)</td>
								<td><%= pname %></td>
								<td>수량(option03값)</td>
								<td><%= pprice %> 적립값 계산식</td>
								<td><%= pprice %>원</td>
								<td>3000</td>
							</tr>
						
						<%
						}
					}
					
					%>
					
						<tr>
							<td>전체 선택</td>
							<td>상품명</td>
							<td>수량</td>
							<td>적립</td>
							<td>상품금액</td>
							<td>배송비</td>
						</tr>
						</table>
					
					<%
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	%>

</body>
</html>