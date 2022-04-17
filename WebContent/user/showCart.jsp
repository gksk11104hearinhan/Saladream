<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>��ٱ��� â �����ֱ�</title>
	<link href="../css/cart_style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="fixtop.jsp"></jsp:include>
	
	<div id="cart_wrap">
	<!-- event_wrap�� ũ�� => width=1000,height=? -->
		
		<!-- <img alt="" src="../img/topDrop.png"> -->
		
		<!-- <div id="cart_keyimg">
			keyimage�κ��Դϴ�.
			cart_keyimage�κ��Դϴ�.
		</div> -->
		
		<div id="key">
			<div class="key_con01">MY CART</div>
			<div class="key_con02">�ֹ��Ͻ� ��ǰ �� ������ ��Ȯ�ϰ� Ȯ�����ּ���.</div>
		</div>
	
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
				<div id="cart_table01">
				<table id="table_line01">
					<tr>
						<td class="table01_Ctd01">��ü ����</td>
						<td class="table01_Ctd02">��ǰ��</td>
						<td class="table01_Ctd03">����</td>
						<td class="table01_Ctd04">����</td>
						<td class="table01_Ctd05">��ǰ�ݾ�</td>
						<td class="table01_Ctd06">��ۺ�</td>
					</tr>
					<tr>
						<td colspan="6"  class="table01_Ctd07">��ٱ��Ͽ� ��� ��ǰ�� �����ϴ�.</td>
					</tr>
				</table>
				</div>
				
				<div id="cart_con01">
					<!-- ��ü ����, ���� ����, ǰ�� ǰ�� ���� -->
					<span class="Ccon01_text01">
						<input type="checkbox">
						��ü ����
					</span>
					<span class="Ccon01_text02">
						���û���
					</span>
					<span class="Ccon01_text03">
						ǰ�� ��ǰ ����
					</span>
				</div>
				
				<div id="cart_con02">
					<!-- �׸� �ڽ� 4�� -->
					<ul>
						<li>
						<div class="Ccon2_box01">
							<div class="Cbox01_text03">
								��ü ��ǰ �ݾ�
							</div>
							<div class="Cbox01_text04">
								0 ��
							</div>
						</div>
						</li>
						<li class="Cbox01_text05"> - </li>
						<li>
						<div class="Ccon2_box01">
							<div class="Cbox01_text03">
								��ǰ ���� �ݾ�
							</div>
							<div class="Cbox01_text04">
								0 ��
							</div>
						</div>
					</li>
						<li class="Cbox01_text05"> + </li>
						<li>
						<div class="Ccon2_box01">
							<div class="Cbox01_text03">
								��ۺ�
							</div>
							<div class="Cbox01_text04">
								0 ��
							</div>
						</div>
						</li>
						<li class="Cbox01_text05"> = </li>
						<li>
						<div class="Ccon2_box01">
							<div class="Cbox01_text03">
								���� �����ݾ�
							</div>
							<div class="Cbox01_text04">
								0 ��
							</div>
						</div>
						</li>
					</ul>
				</div>
				
				<div id="clear"></div>
		
				<div id="cart_con03" class="cart_a">
					<!-- ��ٱ��� ����, ���� ����ϱ�, ��ٱ��� �����ϱ� -->
						<a href="./order.jsp">
							<input type="button" title="�����ϱ�" alt="�����ϱ�" value="�����ϱ�"
								 onclick="" class="btn_cart03" id="log.cart">
						</a>
						<a href="classic.jsp">
							<input type="button" title="��� �����ϱ�" alt="��� �����ϱ�" value="��� �����ϱ�" 
								 class="btn_cart02" id="log.cart">
						</a>
						<a href="./deleteAllCart.jsp">
							<input type="button" title="��ٱ��� ����" alt="��ٱ��� ����" value="��ٱ��� ����"
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
							��ü ����
						</td>
						<td class="table01_Ctd02">��ǰ��</td>
						<td class="table01_Ctd03">����</td>
						<td class="table01_Ctd04">����</td>
						<td class="table01_Ctd05">��ǰ�ݾ�</td>
						<td class="table01_Ctd06">��ۺ�</td>
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
									����
								</td>
								<td class="table01_Ctd02"><%= pname %></td>
								<td class="table01_Ctd03"><%=cproductNum01 %></td>
								<td class="table01_Ctd04"><%=savePrice %></td>
								<td class="table01_Ctd05"><%=allPrice %>��</td>
								<td class="table01_Ctd06">3000��</td>
							</tr>
						<%
							}
						}
						%>
						
						</table>
						</div>
						
						<div id="cart_con01">
							<!-- ��ü ����, ���� ����, ǰ�� ǰ�� ���� -->
							<span class="Ccon01_text01">
								<input type="checkbox">
								��ü ����
							</span>
							<span class="Ccon01_text02">
								���û���
							</span>
							<span class="Ccon01_text03">
								ǰ�� ��ǰ ����
							</span>
						</div>
						
						<div id="cart_con02">
							<!-- �׸� �ڽ� 4�� -->
							<ul>
								<li>
								<div class="Ccon2_box01">
									<div class="Cbox01_text03">
										��ü ��ǰ �ݾ�
									</div>
									<div class="Cbox01_text04">
										[�ӽ�] ��
									</div>
								</div>
								</li>
								<li class="Cbox01_text05"> - </li>
								<li>
								<div class="Ccon2_box01">
									<div class="Cbox01_text03">
										��ǰ ���� �ݾ�
									</div>
									<div class="Cbox01_text04">
										0 ��
									</div>
								</div>
								</li>
								<li class="Cbox01_text05"> + </li>
								<li>
								<div class="Ccon2_box01">
									<div class="Cbox01_text03">
										��ۺ�
									</div>
									<div class="Cbox01_text04">
										3000��
									</div>
								</div>
								</li>
								<li class="Cbox01_text05"> = </li>
								<li>
								<div class="Ccon2_box01">
									<div class="Cbox01_text03">
										���� �����ݾ�
									</div>
									<div class="Cbox01_text04">
										[�ӽ�] ��
									</div>
								</div>
								</li>
							</ul>
						</div>
						
						<div id="clear"></div>
						
					
						<div id="cart_con03" class="cart_a">
							<!-- ��ٱ��� ����, ���� ����ϱ�, ��ٱ��� �����ϱ� -->
								<a href="./order.jsp">
									<input type="button" title="�����ϱ�" alt="�����ϱ�" value="�����ϱ�"
										 onclick="" class="btn_cart03" id="log.cart">
								</a>
								<a href="classic.jsp">
									<input type="button" title="��� �����ϱ�" alt="��� �����ϱ�" value="��� �����ϱ�" 
										 class="btn_cart02" id="log.cart">
								</a>
								<a href="./deleteAllCart.jsp">
									<input type="button" title="��ٱ��� ����" alt="��ٱ��� ����" value="��ٱ��� ����"
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