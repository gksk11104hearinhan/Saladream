<%@page import="saladream.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
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
	<title>Classic_상품 페이지</title>
	<link href="../css/classic_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>

<%
ArrayList<ProductDTO> list = new ArrayList<>();
	try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("product상품 불러오는 함수 1번 커넥터 성공");
		
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("product상품 불러오는 함수 2번 DB연결 성공");
		
		String ctgType = request.getParameter("ctgType");
		
		String jsql = "select * from product where ctgType = ?";
		PreparedStatement ps = con.prepareStatement(jsql);
		ps.setString(1, ctgType);
		System.out.println("product상품 불러오는 함수 3번 sql문 생성");
		
		ResultSet rs = ps.executeQuery();
		System.out.println("product상품 불러오는 함수 4번 sql로 전송");
					
		%> 
			<h2>상품 페이지</h2>
			<hr color="red">
			<table border="1">
			<tr>
				<td>상품번호</td>
				<td>상품 이름</td>
				<td>상품 가격</td>
			<tr>
		<%

					while(rs.next()) {
						String pno = rs.getString("pno");
						String pname = rs.getString("pname");	
						String pinfo = rs.getString("pinfo");
						/* String company = rs.getString("prdCompany"); */
						int pprice = rs.getInt("pprice");
						String pimage = rs.getString("pimage");
						
					
						%>
						<tr>
							<td><%=pno %></td>
							<td><%=pname %> </td>
							<td><%=pprice %></td>
						</tr>
						<%
						
					}
		%> 
			</table>
		<%
					
					
		    } catch (Exception e) {
		    	e.printStackTrace();
		}
	
	%>
		
</body>
</html>