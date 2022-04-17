<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>��ٱ��� â �����ֱ�</title>
</head>
<body>
	<h2>��ٱ��� �����Դϴ�.</h2>
	<hr>
	
	<%
		try {
			//1. con����
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("showcCart_test.jsp�� 1�� Ŀ���� ���� ����");
			
			//2. db����
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
				
				��ٱ��ϰ� ����ֽ��ϴ�.
				
				<%
			} else {
				%>
				
				<table border="1">
					<tr>
						<td>��ü ����</td>
						<td>��ǰ��</td>
						<td>����</td>
						<td>����</td>
						<td>��ǰ�ݾ�</td>
						<td>��ۺ�</td>
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
								<td>����â(checkbox)</td>
								<td><%= pname %></td>
								<td>����(option03��)</td>
								<td><%= pprice %> ������ ����</td>
								<td><%= pprice %>��</td>
								<td>3000</td>
							</tr>
						
						<%
						}
					}
					
					%>
					
						<tr>
							<td>��ü ����</td>
							<td>��ǰ��</td>
							<td>����</td>
							<td>����</td>
							<td>��ǰ�ݾ�</td>
							<td>��ۺ�</td>
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