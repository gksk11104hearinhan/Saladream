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
	<title>cart_test ������</title>
	</head>
<body>
	<h2>Cart test�������Դϴ�.</h2>
	<hr>
	
	<%
		String myid = (String)session.getAttribute("id"); //ligonproc���� ���� �� ���� id���� �ҷ��´�.	
		
		if (myid == null) {
	%>
			��ǰ �ֹ��� ���ؼ� �α����� �ʿ��մϴ�.
			
	<%		
		}
		else { //�α����� �Ǿ��ִ� ���
			try {
				//1. con����
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("cart_test.jsp�� 1�� Ŀ���� ���� ����");
				
				//2. db����
				String url = "jdbc:mysql://localhost:3306/saladream";
				String user = "root";
				String password = "123456";
				Connection con = DriverManager.getConnection(url, user, password);
				System.out.println("cart_test.jsp�� 2�� Ŀ���� ���� ����");
				
				String cno01 = session.getId(); //cno01�� �޾ƿ��� ��!
				System.out.println("session.getId()");
				
				String product_no01 = request.getParameter("pno");
				System.out.println(request.getParameter("pno"));
				System.out.println(request.getParameter("product_no01"));
				int cproductNum01 = Integer.parseInt(request.getParameter("cproductNum01"));
				
				String sql = "select * from cart where cno01 = ? and product_no01 = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, cno01);
				ps.setString(2, product_no01);
				System.out.println("cart_test.jsp�� 3�� sql�� ���� ����");
				
				ResultSet rs = ps.executeQuery();
				
				if (rs.next()) {
					int sum = rs.getInt("cproductNum01") + cproductNum01; //���� ��ǰ �����ϴ� ��� ������ �ø���
					
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
				System.out.println("cart_test.jsp�� 4�� sql�� ���� ����");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("showCart_test.jsp");
		
		}
	%>
	
</body>
</html>