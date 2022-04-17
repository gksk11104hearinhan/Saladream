<%@page import="saladream.MemberDTO"%>
<%@page import="saladream.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>�ֹ��ϱ�</title>
	<link href="../css/order_style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:useBean id="dto" class="saladream.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	<%
	if(session.getAttribute("id") == null){
		response.sendRedirect("./login.jsp");
		return;
	}
	
	String sid = (String)session.getAttribute("id");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto2 = dao.selectOne(new MemberDTO(sid));
		String id = request.getParameter("id");
		
	%>
	
	<jsp:include page="fixtop.jsp"></jsp:include>
		
	<div id="order_wrap">
	<!-- viewPro_wrap�� ũ�� => width=1000,height=? -->
	
		<div id="key">
			<div class="key_con01">
				�ֹ��� �ۼ�
			</div>
			<div class="key_con02">
				�ֹ��Ͻ� ��ǰ �� ������ ��Ȯ�ϰ� Ȯ�����ּ���.
			</div>
		</div>
		
		<div id="Otable01_title01">
			��ǰ ����
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
				<div id="order_table01">
					<table class="infoBox_table">
						<tr>
							<td>��ǰ��</td>
							<td>����</td>
							<td>��ǰ�ݾ�</td>
							<td>����</td>
						</tr>
					<tr>
						<td colspan="4">��ٱ��ϰ� ����ֽ��ϴ�.</td>
					</tr>
					</table>
				</div>
				
				<%
			} else {
				%>
			<div id="order_table01">
				<table class="infoBox_table">
					<tr>
						<td class="Otable_td01">��ǰ��</td>
						<td class="Otable_td02">����</td>
						<td class="Otable_td03">��ǰ�ݾ�</td>
						<td class="Otable_td04">��ǰ����</td>
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
								<td class="Otable_td05"><%= pname %></td>
								<td class="Otable_td06"><%=cproductNum01 %></td>
								<td class="Otable_td07"><%=allPrice %>��</td>
								<td class="Otable_td08"><a href="./deleteCart.jsp?prdNo=<%= pno01%>">����</a></td>
							</tr>
						
						<%
						}
					}
					%>
						<tr>
							<td colspan="4" class="Otable_td09">
								<span class="Otable_text01">��ü �ֹ� �Ѿ�</span> 
								<span class="Otable_text02">&nbsp;&nbsp; <%=total %> ��</span>
							</td>
						</tr>
					</table>
				</div>
						
				<div id="order_infoBox">	
				<form name="form" method="POST" action="" accept-charset="utf-8">
					
					<div id="order_content">
					<input type="hidden" name="opay" value="<%=total%>">
					<input type="hidden" name="id" value="<%= id%>">
						
						<div id="OinfoBox01">
							<div id="OinfoBox01_title">
								�ֹ��� ����
							</div>
							<table class="infoBox_table">
								<tr>
									<td class="infoBox01_td01">
										<span class="infoBox01_subtitle">�̸�**</span>
									</td>
									<td class="infoBox02_td01">
										<input type="text" name="ordrecv" value="<%=dto2.getName()%>">
										<%-- <input type="text" name="ordrecv" value="<%= dto2.getName()%>" class="int"> --%>
									</td>
								</tr>
								<tr>
									<td class="infoBox01_td02">
										<span class="infoBox01_subtitle">����ó**</span>
									</td>
									<td class="infoBox02_td02">
										<input type="text" name="ordrecvtel01" value="<%=dto2.getPhone01()%>">
										<input type="text" name="ordrecvtel02" value="<%=dto2.getPhone02()%>">
									</td>
								</tr>
								<tr>
									<td class="infoBox01_td03">
										<span class="infoBox01_subtitle">�̸���*</span> <!-- DB���� ��� -->
									</td>
									<td class="infoBox02_td03">
										<input type="text" value="<%=dto2.getEmail().split("@")[0]%>"> @
										<input type="text" value="<%=dto2.getEmail().split("@")[1]%>">
									</td>
								</tr>
							</table>
						</div>
						
						<div id="OinfoBox02">
							<div id="OinfoBox02_title">
								��� ����
							</div>
							<table class="infoBox_table">
								<tr>
									<td class="infoBox01_td01">
										<span class="infoBox01_subtitle">�̸�**</span>
									</td>
									<td class="infoBox02_td01">
										<input type="text" value="<%=dto2.getName()%>">
									</td><!-- ���� �ֹ��� �������� �̹� DB�� �Ѿ -->
								</tr>
								<tr>
									<td class="infoBox01_td02">
										<span class="infoBox01_subtitle">����ó**</span>
									</td>
									<td class="infoBox02_td02">
										<input type="text" value="<%=dto2.getPhone01()%>"><!-- ���� �ֹ��� �������� �̹� DB�� �Ѿ -->
										<input type="text" value="<%=dto2.getPhone02()%>">
									</td><!-- ���� �ֹ��� �������� �̹� DB�� �Ѿ -->
								</tr>
								<tr>
									<td class="infoBox01_td03">
										<span class="infoBox01_subtitle">�ּ�**</span>
									</td>
									<td class="infoBox02_td03">
										<input type="text" value="�����ȣ">
										<span>�����ȣ</span>
										<input type="text" name="ordrecvaddr" value="<%=dto2.getAddr01()%>">
									</td>
								</tr>
								<tr>
									<td class="infoBox01_td04">
										<span class="infoBox01_subtitle">��۽� ��û����</span>
									</td>
									<td class="infoBox02_td04">
										<textarea rows="5" cols="70"></textarea>
										<br>
										<small>������� �� ��� ������ �����˴ϴ�.</small>
									</td>
								</tr>
								<tr>
									<td class="infoBox01_td01">
										<span class="infoBox01_subtitle">�������� ���� ���</span>
									</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td class="infoBox01_td03">
										<span class="infoBox01_subtitle">�������� ��� ��ȣ</span>
									</td>
									<td><input type="text"></td>
								</tr>
							</table>
						</div>
						
						<div id="OinfoBox03">
							<div id="OinfoBox03_title">
								����/������ ����
							</div>
							<table class="infoBox_table">
								<tr>
									<td class="infoBox01_td01">
										<span class="infoBox01_subtitle">���� ����</span>
									</td>
									<td>
										<select>
											<option>������ ������ �������ּ���.</option>
											<option>����01</option>
											<option>����02</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="infoBox01_td03">
										<span class="infoBox01_subtitle">������ ���</span>
									</td>
									<td>
										<input type="text" placeholder="0"> �� 
										<input type="checkbox"> ��λ�� <br>
										<small>���� �������� �����ϴ�.</small> <!-- ���߿� ���� -->
									</td>
								</tr>
							</table>
						</div>
						
						<!-- <div id="OinfoBox04">
							<div id="OinfoBox04_title">
								���� ����
							</div>
							<table class="infoBox_table">
								<tr>
									<td class="infoBox01_td01">
										<span class="infoBox01_subtitle">�Ա�����**</span>
									</td>
									<td><input type="text" name="obank"></td>
							
								</tr>
								<tr>
									<td class="infoBox01_td02">
										<span class="infoBox01_subtitle">ī���ȣ**</span>
									</td>
									<td><input type="text" name="ocardNum"></td>
							
								</tr>
								<tr>
									<td class="infoBox01_td03">
										<span class="infoBox01_subtitle">ī���й�ȣ**</span>
									</td>
									<td><input type="text" name="ocardPassword"></td>
								</tr>
							</table>
						</div> -->
						
						<div id="OinfoBox05">
							<div id="OinfoBox05_title">
								�ֹ��� ����
							</div>
							<hr class="OinfoBox05_hr" color="#82cf2c" size="2">
							<input type="checkbox">
							<span class="OinfoBox05_text00">���� ���� �ʼ� ����</span>
							<div class="OinfoBox05_con01">
								<span class="OinfoBox05_text01">
									������������/�̿� ����
								</span>
								<span class="OinfoBox05_text02">
									(�ʼ�)
								</span>
								<a>
									<span class="OinfoBox05_text03">���Ȯ��></span>
								</a>
							</div>
							<div class="OinfoBox05_con02">
								<span class="OinfoBox05_text01">
									���� ���� ���� ��� ����
								</span>
								<span class="OinfoBox05_text02">
									(�ʼ�)
								</span>
								<a>
									<span class="OinfoBox05_text03">���Ȯ��></span>
								</a>
							</div>
						</div>
						
						<div id="OinfoBox05">
							<div id="OinfoBox05_title">
								���� ���
							</div>
							<div class="OinfoBox05_con04">
								<table class="infoBox_table">
									<tr>
										<td class="infoBox01_td009">�Ϲ� �����ϱ� &nbsp;&nbsp;��</td>
										<td class="infoBox01_td010">
											<input type="submit" value="�ֹ��ϱ�" onclick="javascript: form.action='orderOK.jsp'" class="OrderBuy01_style01">
										</td>
									</tr>
									<tr>
										<td class="infoBox01_td008">īī������ �����ϱ� &nbsp;&nbsp;��</td>
										<td class="infoBox01_td010">
											<input type="submit" value="�ֹ��ϱ�" onclick="javascript: form.action='test01.jsp'" class="OrderBuy01_style02">
										</td>
									</tr>
									<tr>
										<td colspan="2" class="infoBox01_td007">
											<input type="reset" title="�ֹ����" alt="�ֹ����" value="�ֹ����" class="OrderBuy01_style03">
										</td>
									</tr>
								</table>
							</div>
						</div>
						
						<div id="clear"></div>
						
						<div id="OinfoBox06">
							<span class="infoBox06_text01">���� ���� �ݾ� </span>
							<span class="infoBox06_text02"> <%=total %> </span>
							<span class="infoBox06_text03"> ��</span>
						</div>
						
						<div id="OinfoBox07">
							<!-- <a>
								<input type="submit" title="�ֹ�Ȯ��" alt="�ֹ�Ȯ��" value="�ֹ�Ȯ��">
							</a>
								<input type="reset" title="�ֹ����" alt="�ֹ����" value="�ֹ����"> -->
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
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>