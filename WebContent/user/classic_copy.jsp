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
	<title>Classic_��ǰ ������</title>
	<link href="../css/classic_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>

<%
ArrayList<ProductDTO> list = new ArrayList<>();
	try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("product��ǰ �ҷ����� �Լ� 1�� Ŀ���� ����");
		
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("product��ǰ �ҷ����� �Լ� 2�� DB���� ����");
		
		String ctgType = request.getParameter("ctgType");
		
		String jsql = "select * from product where ctgType = ?";
		PreparedStatement ps = con.prepareStatement(jsql);
		ps.setString(1, ctgType);
		System.out.println("product��ǰ �ҷ����� �Լ� 3�� sql�� ����");
		
		ResultSet rs = ps.executeQuery();
		System.out.println("product��ǰ �ҷ����� �Լ� 4�� sql�� ����");
					
		%> 
			<h2>��ǰ ������</h2>
			<hr color="red">
			<table border="1">
			<tr>
				<td>��ǰ��ȣ</td>
				<td>��ǰ �̸�</td>
				<td>��ǰ ����</td>
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