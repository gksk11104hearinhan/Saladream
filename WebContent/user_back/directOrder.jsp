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
	<link href="../css/viewPro_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
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
<form action="" method="post" name="directOrdFrm" accept-charset="utf-8">
	<div id="viewPro_wrap">
	<!-- viewPro_wrap�� ũ�� => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<img alt="" src="../img/topDrop.png">
		
		<div id="viewPro_content">
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
			<div id="viewPro_con">
				<input type="hidden" value="<%=pno%>" name="pno">
				<div id="viewPro_con01">
					<!-- ��ǰ �̹��� -->
					<img alt="" src="../p_img/<%= dto2.getPdetailimage() %>.png">
				</div>
				<div id="viewPro_con02">
					<div id="vP_con001">
					<!-- Salad > ��ǰ��ȣ
						 ��ǰ�̸�
						 �ǸŰ� (���� �Һ�)
						 �ѷ� (�������� ����)
						 �� ��� (������ ���� ����)
						 ���� ��å Ȥ�� (�̺�Ʈ)������ Ȯ�� 
						 �� �Ǹ� �ܰ� : ���ε� ���� Ȥ�� �������� �� ���� ���� -->
						<div class="vP_text01">
							[�����帲] <%= dto2.getPname() %>
						</div>
						<div class="vP_text02">
							<%=dto2.getPprice() %>��
						</div>
						<div class="vP_text08">
							<span class="text04_001">���ż���</span>
							<div class="text06_con">
								<input type="text" value="<%=cnt  %>" name="oproductNum" readonly="readonly">
								 ��
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div id="clear"></div>
			
			<div id="viewPro_con03">
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
				
				<!-- �� ��ǰ �ݾ�, ��ٱ��� ���, �ٷ� �����ϱ� -->
				<div class="vPcon03_text01">
					<span class="text04_004">�� ��ǰ�ݾ�: </span>
					<span class="priceClassic">
					<input type="hidden" value="<%= dto2.getPprice() * cnt %>" name="opay" readonly="readonly"> 
					<%= dto2.getPprice() * cnt %>��
					</span>
				</div>
				<div id="clear"></div>
				<div class="vPcon03_text02">
					<a>
						<input type="button" title="�ֹ�Ȯ��" alt="�ֹ�Ȯ��" value="�ֹ�Ȯ��"
							 onclick="directOrd()" class="btn_classicVp03" id="log.classicView">
					</a>
				</div>
			</div>
			
			<div id="viewPro_con04">
				<!-- �� ��ǰ ���� â(������) -->
			</div>
			
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
	
</form>
</body>
</html>