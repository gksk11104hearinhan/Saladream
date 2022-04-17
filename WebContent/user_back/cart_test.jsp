<%@page import="saladream.ProductDTO"%>
<%@page import="saladream.ProductDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>cart_test 페이지</title>
	</head>
<body>
	<h2>Cart test페이지입니다.</h2>
	<hr>
	
	<%
		String myid = (String)session.getAttribute("id"); //ligonproc에서 정의 한 세션 id값을 불러온다.	
		
		if (myid == null) {
	%>
			상품 주문을 위해선 로그인이 필요합니다.
			
	<%		
		}
		else { //로그인이 되어있는 경우
			try {
				//1. con연결
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("cart_test.jsp의 1번 커넥터 연결 성공");
				
				//2. db연결
				String url = "jdbc:mysql://localhost:3306/saladream";
				String user = "root";
				String password = "123456";
				Connection con = DriverManager.getConnection(url, user, password);
				System.out.println("cart_test.jsp의 2번 커넥터 연결 성공");
				
				String cno01 = session.getId(); //cno01에 받아오는 것!
				System.out.println("session.getId()");
				
				String product_no01 = request.getParameter("pno");
				System.out.println(request.getParameter("pno"));
				System.out.println(request.getParameter("product_no01"));
				int cproductNum01 = Integer.parseInt(request.getParameter("cproductNum01"));
				
				String sql = "select * from cart where cno01 = ? and product_no01 = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, cno01);
				ps.setString(2, product_no01);
				System.out.println("cart_test.jsp의 3번 sql문 연결 성공");
				
				ResultSet rs = ps.executeQuery();
				
				if (rs.next()) {
					int sum = rs.getInt("cproductNum01") + cproductNum01; //동일 상품 존재하는 경우 수량만 올리기
					
					String sql2 = "update cart set cproductNum01 = ? where cno01 = ? and product_no01 = ?";
					PreparedStatement ps2 = con.prepareStatement(sql2);
					ps2.setInt(1, sum);
					ps2.setString(2, cno01);
					ps2.setString(3, product_no01);
					
					ps2.executeUpdate();
					
				} else {
					String sql3 = "insert into cart (cno01, product_no01, cproductNum01) values (?,?,?)";
					PreparedStatement ps3 = con.prepareStatement(sql3);
					ps3.setString(1, cno01);
					ps3.setString(2, product_no01);
					ps3.setInt(3, cproductNum01);
					
					ps3.executeUpdate();
				}
				System.out.println("cart_test.jsp의 4번 sql문 전송 성공");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("showCart_test.jsp");
		
		}
	%>
	
</body>
</html>