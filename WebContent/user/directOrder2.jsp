<%@page import="saladream.MemberDTO"%>
<%@page import="saladream.MemberDAO"%>
<%@page import="saladream.ProductDTO"%>
<%@page import="saladream.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    	//���ڵ�, �۾� �����°� ����
    	request.setCharacterEncoding("EUC-KR");
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>directOrder_����ֹ�</title>
	<link href="../css/directOrd_style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function directOrd()        
		{
			var frm = document.directOrdFrm;
			frm.action = "directOrderOK.jsp";
			frm.submit();
		}
	
	</script>
</head>
<body>

<jsp:include page="fixtop.jsp"></jsp:include>

<form action="" method="post" name="directOrdFrm" accept-charset="utf-8">
	<div id="directOrd_wrap">
	<!-- viewPro_wrap�� ũ�� => width=1000,height=? -->
		
		<!-- <img alt="" src="../img/topDrop.png"> -->
		
		<div id="key">
			<div class="key_con01">
				Classic �ֹ���
			</div>
			<div class="key_con02">
				�ֹ��Ͻ� ��ǰ �� ������ ��Ȯ�ϰ� Ȯ�����ּ���.
			</div>
		</div>
		
		<div id="directOrd_content">
			<!--����ֹ� ������ �Դϴ�. -->
			
			<jsp:useBean id="dto" class="saladream.ProductDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="dto"/>
			
			<%
				System.out.print(dto);
				ProductDAO dao = new ProductDAO();
				ProductDTO dto2 = dao.select(dto);

				if(request.getParameter("option03") == null){
					response.sendRedirect("./classic.jsp");
					return;
				}
				
				if(request.getParameter("pno") == null){
					response.sendRedirect("./classic.jsp");
					return;
				}
				if(request.getParameter("option03").equals("0")){
					response.sendRedirect("./classicViewProduct.jsp?pno="+request.getParameter("pno"));
					return;
				}
				
				String pno = request.getParameter("pno"); //����ȸ�ϰ����ϴ� ��ǰ��ȣ�� �޾ƿ´�.
				int cnt = Integer.parseInt(request.getParameter("option03"));
			%>
			<div id="directOrd_con">
				<input type="hidden" value="<%=pno%>" name="pno">
				<div id="directOrd_con01">
				
				<div id="Otable01_title01">
					��ǰ ����
				</div>
				
				<table class="infoBox_table">
		 			<tr>
		 				<td class="Otable_td04">��ǰ �̹���</td>
		 				<td class="Otable_td01">��ǰ��</td>
						<td class="Otable_td02">����</td>
						<td class="Otable_td03">��ǰ�ݾ�</td>
		 			</tr>
		 			
		 			<tr>
		 				<td class="Otable_td08"><img alt="" src="../p_img/<%= dto2.getPdetailimage() %>.png" width="100px" height="100px"></td>
		 				<td class="Otable_td05">[�����帲] <%= dto2.getPname() %></td>
						<td class="Otable_td06">
							<%-- <input type="text" value="<%=cnt  %>" name="oproductNum" readonly="readonly"> --%>
							 <%=cnt  %> ��
						</td>
						<td class="Otable_td07"><%=dto2.getPprice() %></td>
		 			</tr>
		 		
		 		</table>
				
			</div>
			
			<div id="clear"></div>
			
			<div id="directOrd_con03">
				
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
												<input type="text" name="ordrecv" class="int">
												
											</td>
										</tr>
										<tr>
											<td class="infoBox01_td02">
												<span class="infoBox01_subtitle">����ó**</span>
											</td>
											<td class="infoBox02_td02">
												<input type="text" name="ordrecvtel01">
												<input type="text" name="ordrecvtel02">
											</td>
										</tr>
										<tr>
											<td class="infoBox01_td03">
												<span class="infoBox01_subtitle">�̸���*</span> <!-- DB���� ��� -->
											</td>
											<td class="infoBox02_td03">
												<input type="text"> @
												<input type="text">
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
												<input type="text">
											</td><!-- ���� �ֹ��� �������� �̹� DB�� �Ѿ -->
										</tr>
										<tr>
											<td class="infoBox01_td02">
												<span class="infoBox01_subtitle">����ó**</span>
											</td>
											<td class="infoBox02_td02">
												<input type="text"><!-- ���� �ֹ��� �������� �̹� DB�� �Ѿ -->
												<input type="text">
											</td><!-- ���� �ֹ��� �������� �̹� DB�� �Ѿ -->
										</tr>
										<tr>
											<td class="infoBox01_td03">
												<span class="infoBox01_subtitle">�ּ�**</span>
											</td>
											<td class="infoBox02_td03">
												<input type="text" value="�����ȣ">
												<span>�����ȣ</span>
												<input type="text" name="ordrecvaddr">
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
								
								<div id="OinfoBox04">
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
								</div>
								
								<div id="OinfoBox05">
									<div id="OinfoBox05_title">
										�ֹ��� ����
									</div>
									<hr class="OinfoBox05_hr" color="#82cf2c" size="0">
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
							</div>
							
							<!-- <div class="cOcon03_text02">
								<a> <input type="submit" title="�ֹ�Ȯ��" alt="�ֹ�Ȯ��" value="�ֹ�Ȯ��">
								</a>
							</div> -->
					</div>
				
				
				
				
				<div id="OinfoBox06">
					<span class="infoBox06_text01">���� ���� �ݾ� </span>
					<span class="infoBox06_text02">
						<input type="hidden" value="<%= dto2.getPprice() * cnt %>" name="opay" readonly="readonly"> <%= dto2.getPprice() * cnt %>
					</span>
					<span class="infoBox06_text03"> ��</span>
				</div>
								
				<div id="OinfoBox07">
					<a>
						<input type="submit" title="�ֹ�Ȯ��" alt="�ֹ�Ȯ��" value="�ֹ�Ȯ��"
							 onclick="directOrd()" class="btn_classicVp03" id="log.classicView">
					</a>
						<input type="reset" title="�ֹ����" alt="�ֹ����" value="�ֹ����">
				</div>
				
			</div>
			
		</div>
		
	</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</form>

</body>
</html>