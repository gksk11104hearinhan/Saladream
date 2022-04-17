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
	<title>classicViewProduct_��ǰ �� ������</title>
	<link href="../css/viewPro_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function directOrd()        //  "��ñ����ϱ�" ��ư�� Ŭ���� ȣ��
		{
			/* var str=productFrm.qty.value; */
			var frm = document.productFrm;
			frm.action = "directOrder.jsp";
			frm.submit();
		}
	
	
		function addCart()              //  "��ٱ��ϴ��" ��ư�� Ŭ���� ȣ��
		{
			/* var str=productFrm.qty.value; */
			var frm = document.productFrm;
			/* frm.action = "cart.jsp"; */
			frm.action = "cart_test.jsp"    // ��ٱ��� DBȮ���� ���� �ӽ� ���� ������
			frm.submit();
		}
	</script>
</head>
<body>
<form action="" method="post" name="productFrm">
	<div id="viewPro_wrap">
	<!-- viewPro_wrap�� ũ�� => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<img alt="" src="../img/topDrop.png">
		
		<!-- <div id="viewPro_keyimg">
			keyimage�κ��Դϴ�.
			viewPro_keyimage�κ��Դϴ�.
		</div> -->
		
		<div id="viewPro_content">
			<!-- ��ǰ �� ������ �Դϴ�. -->
			
			<jsp:useBean id="dto" class="saladream.ProductDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="dto"/>
			
			<%
				ProductDAO dao = new ProductDAO();
				ProductDTO dto2 = dao.select(dto);
				
				String pno = request.getParameter("pno"); //����ȸ�ϰ����ϴ� ��ǰ��ȣ�� �޾ƿ´�.
			%>
			<div id="viewPro_con">
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
							<%= dto2.getPprice() %>��
						</div>
						<div class="vP_text03">
							<%= dto2.getPdescript() %>
						</div>
						<div class="vP_text04">
							<span class="text04_001">��۹��</span>
							<span class="text04_002">�ù� ���</span>
						</div>
						<div class="vP_text05">
							<span class="text04_001">��ۺ�</span>
							<span class="text04_003">3000��</span>
						</div>
						<div class="vP_text06">
							<span class="text04_001">�߷� �߰� ����</span>
							<div class="text06_con">
								<select name="option01" id="option01" class="selClassic">
									<option value="0">�߷� �߰� ����(����)</option>
									<option value="350">350g(1�κ�)</option>
									<option value="450">450g</option>
									<option value="550">550g</option>
									<option value="650">650g</option>
									<option value="750">750g</option>
									<option value="850">850g</option>
								</select>
							</div>
						</div>
						<div class="vP_text07">
							<span class="text04_001">�巹�� ����</span>
							<div class="text06_con">
								<select name="option02" id="option02" class="selClassic">
									<option value="0">�巹�� ����(����)</option>
									<option value="sesame">sesame�ҽ�</option>
									<option value="indian">indian�ҽ�</option>
									<option value="arabian">arabian�ҽ�</option>
									<option value="chilli">chilli�ҽ�</option>
									<option value="singa">singa�ҽ�</option>
									<option value="miso">miso�ҽ�</option>
								</select>
							</div>
						</div>
						<div class="vP_text08">
							<span class="text04_001">���ż���</span>
							<div class="text06_con">
								<select name="option03" id="option03" class="selClassic">
									<option value="0">���� ����(����)</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div id="clear"></div>
			
			<div id="viewPro_con03">
				<!-- �� ��ǰ �ݾ�, ��ٱ��� ���, �ٷ� �����ϱ� -->
				<div class="vPcon03_text01">
					<span class="text04_004">�� ��ǰ�ݾ�: </span>
					<span class="priceClassic"><%= dto2.getPprice() %>��</span>
				</div>
				<div id="clear"></div>
				<div class="vPcon03_text02">
					<a href="classic.jsp">
						<input type="button" title="�������" alt="�������" value="�������"
							 class="btn_classicVp01" id="log.classicView">
					</a>
					<a>
						<input type="button" title="��ٱ��� ���" alt="��ٱ��� ���" value="��ٱ��� ���"
							 onclick="addCart()" class="btn_classicVp02" id="log.classicView">
					</a>
					<a>
						<input type="button" title="�����ϱ�" alt="�����ϱ�" value="�����ϱ�"
							 onclick="directOrd()" class="btn_classicVp03" id="log.classicView">
					</a>
				</div>
				
				<div id="vPcon03_text03">
				<!-- ���û�ǰ(��ư ������ Ÿ ��ǰ ����) -->
					<div id="vPtext03_title">���û�ǰ</div>
					<div id="vPtext03_content">
					<!-- height:333px -->
						<ul class="">
							<li class="">
							<!-- width:168px, height:198px -->
								<div class="tumnail">
									<!-- �̹��� -->
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div id="viewPro_con04">
				<!-- �� ��ǰ ���� â(������) -->
				<!-- �� ����, �� �ı�, Q&A, ���/��ȯ/��ǰ -->
				<div id="vPtext04_title01">
					<ul>
						<li>�� ����</li>
						<li>���ı�</li>
						<li>Q&A</li>
						<li>���/��ȯ/��ǰ</li>
					</ul>
				</div>
				<div id="vPtext04_content01">
					������ ������
				</div>
				
				<div id="clear"></div>
				
				<div id="vPtext04_title02">
					<ul>
						<li>�� ����</li>
						<li>���ı�</li>
						<li>Q&A</li>
						<li>���/��ȯ/��ǰ</li>
					</ul>
				</div>
				<div id="vPtext04_content02">
					���ı� ������
				</div>
				
				<div id="vPtext04_title03">
					<ul>
						<li>�� ����</li>
						<li>���ı�</li>
						<li>Q&A</li>
						<li>���/��ȯ/��ǰ</li>
					</ul>
				</div>
				<div id="vPtext04_content03">
					Q&A ������
				</div>
				
				<div id="vPtext04_title04">
					<ul>
						<li>�� ����</li>
						<li>���ı�</li>
						<li>Q&A</li>
						<li>���/��ȯ/��ǰ</li>
					</ul>
				</div>
				<div id="vPtext04_content04">
					���/��ȯ/��ǰ ������
				</div>
			</div>
			
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
	
</form>
</body>
</html>