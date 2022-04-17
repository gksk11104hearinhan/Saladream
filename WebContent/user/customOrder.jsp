<%@page import="saladream.SelCustomDAO"%>
<%@page import="saladream.SelCustomDTO"%>
<%@page import="java.sql.*"%>
<%@page import="saladream.MaterialDTO"%>
<%@page import="saladream.MaterialDAO"%>
<%@page import="saladream.CustomCartDAO"%>
<%@page import="saladream.CustomCartDTO"%>
<%@page import="saladream.MemberDTO"%>
<%@page import="saladream.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Ŀ���� �ֹ��ϱ�</title>
	<link href="../css/customOrd_style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		if (session.getAttribute("id") == null) {
			response.sendRedirect("./login.jsp");
			return;
		}

		String cno = session.getId();

		String base, topping1, topping2, topping3, cheese, source;
		int id = 0;
		
		CustomCartDAO ccDao = new CustomCartDAO();
		SelCustomDTO scDto = null;
		
		if(request.getParameter("caseNo") != null){
			
			if (request.getParameter("base") == null) {
				out.print("<script>alert('���̽��� �����ϼ���!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("topping1") == null) {
				out.print("<script>alert('����1�� �����ϼ���!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("topping2") == null) {
				out.print("<script>alert('����2�� �����ϼ���!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("topping3") == null) {
				out.print("<script>alert('����3�� �����ϼ���!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("cheese") == null) {
				out.print("<script>alert('ġ� �����ϼ���!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("source") == null) {
				out.print("<script>alert('�ҽ��� �����ϼ���!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}

			base = request.getParameter("base");
			topping1 = request.getParameter("topping1");
			topping2 = request.getParameter("topping2");
			topping3 = request.getParameter("topping3");
			cheese = request.getParameter("cheese");
			source = request.getParameter("source");

			SelCustomDAO scDao = new SelCustomDAO();

			id = scDao.selectId();

			if (id == 0) {
				return;
			}
			scDto = new SelCustomDTO();
			scDto.setScNo(id);
			scDto.setScStep01(base);
			scDto.setScStep02(topping1);
			scDto.setScStep03(topping2);
			scDto.setScStep04(topping3);
			scDto.setScStep05(cheese);
			scDto.setScStep06(source);

			scDao.insert(scDto);

			CustomCartDTO ccDto = new CustomCartDTO();
			ccDto.setCno03(cno);
			ccDto.setProduct_no03(id);

			ccDao.insert(ccDto);
		}
		else {
			scDto = ccDao.select(cno);

			if (scDto != null) {
				id = scDto.getScNo();
				base = scDto.getScStep01();
				topping1 = scDto.getScStep02();
				topping2 = scDto.getScStep03();
				topping3 = scDto.getScStep04();
				cheese = scDto.getScStep05();
				source = scDto.getScStep06();

			} 
			else {
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
		}

		MaterialDAO mDao = new MaterialDAO();

		MaterialDTO mDto = new MaterialDTO();
		mDto.setmNo(base);
		MaterialDTO baseMDto = mDao.selectOne(mDto);
		mDto.setmNo(topping1);
		MaterialDTO topMDto1 = mDao.selectOne(mDto);
		mDto.setmNo(topping2);
		MaterialDTO topMDto2 = mDao.selectOne(mDto);
		mDto.setmNo(topping3);
		MaterialDTO topMDto3 = mDao.selectOne(mDto);

		mDto.setmNo(cheese);
		MaterialDTO cheeseMDto = mDao.selectOne(mDto);
		mDto.setmNo(source);
		MaterialDTO sourceMDto = mDao.selectOne(mDto);
		
		int opay = baseMDto.getmPrice() + topMDto1.getmPrice() + topMDto2.getmPrice() + topMDto3.getmPrice() + cheeseMDto.getmPrice() + sourceMDto.getmPrice();

		String sid = (String)session.getAttribute("id");
		MemberDAO memberDao = new MemberDAO();
		MemberDTO memDto = memberDao.selectOne(new MemberDTO(sid));
		%>
	
	<jsp:include page="fixtop.jsp"></jsp:include>
		 
		 <div id="cusOrder_wrap">
	
		<div id="key">
			<div class="key_con01">
				Custom �ֹ���
			</div>
			<div class="key_con02">
				�ֹ��Ͻ� ��ǰ �� ������ ��Ȯ�ϰ� Ȯ�����ּ���.
			</div>
		</div>
		
		<div id="Otable01_title01">
			��ǰ ����
		</div>
		 
		 <div id="order_table01">
		 		<table class="infoBox_table">
		 			<tr>
		 				<td class="Otable_td01" colspan="2">��ǰ��</td>
						<td class="Otable_td02">����</td>
						<td class="Otable_td03">��ǰ�ݾ�</td>
						<td class="Otable_td04">����</td>
		 			</tr>
		 			
		 			<tr>
		 				<td class="Otable_td05">
							<span class="OT_Td05Con01">Base&nbsp;&nbsp;&nbsp;</span><br>
							<span class="OT_Td05Con01">veggie &nbsp;&nbsp;</span><br>
							<span class="OT_Td05Con01">Meat &nbsp;&nbsp;</span><br>
							<span class="OT_Td05Con01">Topping &nbsp;</span><br>
							<span class="OT_Td05Con01">Cheese&nbsp;&nbsp; </span><br>
							<span class="OT_Td05Con01">Source&nbsp;&nbsp; </span>
						</td>
						<td class="Otable_td05Left">
							<span><%=baseMDto.getmName() %></span><br>
							<span><%=topMDto1.getmName() %></span><br>
							<span><%=topMDto2.getmName() %></span><br>
							<span><%=topMDto3.getmName() %></span><br>
							<span><%=cheeseMDto.getmName() %></span><br>
							<span><%=sourceMDto.getmName() %></span>
						</td>
						<td class="Otable_td06">1</td>
						<td class="Otable_td07"><%=opay%></td>
						<td class="Otable_td08">����</td>
		 			</tr>
		 			
		 			<%-- <tr>
		 				<td>Base</td>
		 				<td><%=baseMDto.getmName() %></td>
		 				<td><%=baseMDto.getmPrice() %></td>
		 				<td><%=baseMDto.getmStock() %></td>
		 			</tr>
		 			<tr>
		 				<td>Veggie</td>
		 				<td><%=topMDto1.getmName() %></td>
		 				<td><%=topMDto1.getmPrice() %></td>
		 				<td><%=topMDto1.getmStock() %></td>
		 			</tr>
		 			<tr>
		 				<td>Meat</td>
		 				<td><%=topMDto2.getmName() %></td>
		 				<td><%=topMDto2.getmPrice() %></td>
		 				<td><%=topMDto2.getmStock() %></td>
		 			</tr>
		 			<tr>
		 				<td>Topping</td>
		 				<td><%=topMDto3.getmName() %></td>
		 				<td><%=topMDto3.getmPrice() %></td>
		 				<td><%=topMDto3.getmStock() %></td>
		 			</tr>
		 			<tr>
		 				<td>Cheese</td>
		 				<td><%=cheeseMDto.getmName() %></td>
		 				<td><%=cheeseMDto.getmPrice() %></td>
		 				<td><%=cheeseMDto.getmStock() %></td>
		 			</tr>
		 			<tr>
		 				<td>Source</td>
		 				<td><%=sourceMDto.getmName() %></td>
		 				<td><%=sourceMDto.getmPrice() %></td>
		 				<td><%=sourceMDto.getmStock() %></td>
		 			</tr> --%>
		 		
		 		</table>
		 		
		 		<%-- <p>������ ������ ���� : <%=opay%></p> --%>
		 		
				<form name="form" method="POST" action="" accept-charset="utf-8">
					<input type="hidden" name="pno" value="<%=id%>">
					<input type="hidden" name="oproductNum" value="1">
					<input type="hidden" name="opay" value="<%=opay%>">
					<!-- <div id="cusOrder_con03"> -->
						<div id="order_infoBox">
							<div>
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
												<input type="text" name="ordrecv" class="int" value="<%=memDto.getName()%>">
											</td>
										</tr>
										<tr>
											<td class="infoBox01_td02">
												<span class="infoBox01_subtitle">����ó**</span>
											</td>
											<td class="infoBox02_td02">
												<input type="text" name="ordrecvtel01" value="<%=memDto.getPhone01()%>">
												<input type="text" name="ordrecvtel02" value="<%=memDto.getPhone02()%>">
											</td>
										</tr>
										<tr>
											<td class="infoBox01_td03">
												<span class="infoBox01_subtitle">�̸���*</span> <!-- DB���� ��� -->
											</td>
											<td class="infoBox02_td03">
												<input type="text" value="<%=memDto.getEmail().split("@")[0]%>"> @
												<input type="text" value="<%=memDto.getEmail().split("@")[1]%>">
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
												<input type="text" value="<%=memDto.getName()%>">
											</td><!-- ���� �ֹ��� �������� �̹� DB�� �Ѿ -->
										</tr>
										<tr>
											<td class="infoBox01_td02">
												<span class="infoBox01_subtitle">����ó**</span>
											</td>
											<td class="infoBox02_td02">
												<input type="text" value="<%=memDto.getPhone01()%>"><!-- ���� �ֹ��� �������� �̹� DB�� �Ѿ -->
												<input type="text" value="<%=memDto.getPhone02()%>">
											</td><!-- ���� �ֹ��� �������� �̹� DB�� �Ѿ -->
										</tr>
										<tr>
											<td class="infoBox01_td03">
												<span class="infoBox01_subtitle">�ּ�**</span>
											</td>
											<td class="infoBox02_td03">
												<input type="text" value="�����ȣ">
												<span>�����ȣ</span>
												<input type="text" name="ordrecvaddr" value="<%=memDto.getAddr01()%>">
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
													<input type="submit" value="�ֹ��ϱ�" onclick="javascript: form.action='customOrderOK.jsp'" class="OrderBuy01_style01">
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
									<span class="infoBox06_text02"> <%=opay %> </span>
									<span class="infoBox06_text03"> ��</span>
								</div>
								
								<div id="OinfoBox07">
									<!-- <a>
										<input type="submit" title="�ֹ�Ȯ��" alt="�ֹ�Ȯ��" value="�ֹ�Ȯ��">
									</a>
										<input type="reset" title="�ֹ����" alt="�ֹ����" value="�ֹ����"> -->
								</div>
							</div>
							
							<!-- <div class="cOcon03_text02">
								<a> <input type="submit" title="�ֹ�Ȯ��" alt="�ֹ�Ȯ��" value="�ֹ�Ȯ��">
								</a>
							</div> -->
					</div>
		
		
				</form>
		
			</div>
		</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>