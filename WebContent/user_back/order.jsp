<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>�ֹ��ϱ�</title>
	<link href="../css/viewPro_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="viewPro_wrap">
	<!-- viewPro_wrap�� ũ�� => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
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
				<div>
				<table border="1">
					<tr>
						<td>��ǰ��</td>
						<td>����</td>
						<td>��ǰ�ݾ�</td>
						<td>��ǰ����</td>
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
								<td><%=allPrice %>��</td>
								<td><a href="./deleteCart.jsp?prdNo=<%= pno01%>">��ǰ����</a></td>
							</tr>
						
						<%
						}
					}
					%>
						<tr>
							<td>��ü �ֹ� �Ѿ�</td>
							<td colspan="3"><%=total %>��</td>
						</tr>
						</table>
						</div>
						<div>
				<form name="form" method="POST" action="orderOK.jsp" accept-charset="utf-8">
				<div id="viewPro_con03">
				<input type="hidden" name="opay" value="<%=total%>">
				<div>
					<div>
						<span>�ֹ��� �̸�</span>
						<input type="text" name="ordrecv">
					</div>
					<div>
						<span>�ֹ��� �ּ�</span>
						<input type="text" name="ordrecvaddr">
					</div>
					<div>
						<span>�ֹ��� ����ó</span>
						<input type="text" name="ordrecvtel01">
						<input type="text" name="ordrecvtel02">
					</div>
					<div>
						<span>�Ա�����</span>
						<input type="text" name="obank">
					</div>
					<div>
						<span>ī���ȣ</span>
						<input type="text" name="ocardNum">
					</div>
					<div>
						<span>ī���й�ȣ</span>
						<input type="text" name="ocardPassword">
					</div>
				</div>
				
				<div id="clear"></div>
				<div class="vPcon03_text02">
					<a>
						<input type="submit" title="�ֹ�Ȯ��" alt="�ֹ�Ȯ��" value="�ֹ�Ȯ��">
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