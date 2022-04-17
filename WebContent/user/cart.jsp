<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cart_��ٱ���������</title>
	<link href="../css/cart_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="cart_wrap">
	<!-- event_wrap�� ũ�� => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<img alt="" src="../img/topDrop.png">
		
		<!-- <div id="cart_keyimg">
			keyimage�κ��Դϴ�.
			cart_keyimage�κ��Դϴ�.
		</div> -->
		
		<div id="key">
			<div class="key_con01">��ٱ���</div>
			<div class="key_con02">�ֹ��Ͻ� ��ǰ �� ������ Ȯ�����ּ���.</div>
		</div>
		
		
		<div id="cart_container">
		<!-- step,content�� �����Ѵ�. -->
		<!-- �α���(session) ������ ���, step,content�� ��� �ش�. -->
		<!-- �α׾ƿ�(session) ������ ���, "�α��� �� ��� ���� �մϴ�!"�� ���Ե� ������ �̹����� ��� �ش�. => �ؿ� ȸ������, �α��� ��ư �����ϱ� -->
			<!-- <div id="step">
			step01 ��ٱ��� > step02 �ֹ����� > step03 ���� �Ϸ�
				<h2 class="step_up">01 ��ٱ��� > 02 �ֹ����� > 03 ���� �Ϸ�</h2>
			</div> -->
			
			<div id="content">
				<div id="cart_con01">
				<!-- '��ٱ���' Ÿ��Ʋ -->
					<h3 class="cart_title">��ٱ���</h3>
				</div>
				<div id="cart_con02">
				<!-- ��ٱ����� ���� => ǥ ����� �ֹ����� �����ֱ� -->
					<!-- ��ٱ����� ���� => ǥ ����� �ֹ����� �����ֱ� -->
					<table border="1">
						<tr>
							<td class="th01">
								<input type="checkbox" value="" name="">
								��ü ����
							</td>
							<td class="th02">��ǰ��</td>
							<td class="th03">����</td>
							<td class="th04">����</td>
							<td class="th05">��ǰ�ݾ�</td>
							<td class="th06">��ۺ�</td>
						</tr>
						<tr>
							<td class="td01">
								<input type="checkbox" value="" name="">
							</td>
							<td class="td02">�ӽ�</td>
							<td class="td03">�ӽ�</td>
							<td class="td04">�ӽ�</td>
							<td class="td05">�ӽ�</td>
							<td class="td06">�ӽ�</td>
						</tr>
					</table>
				</div>
				<div id="cart_con03" class="cart_a">
				<!-- ��ٱ��� ����, ���� ����ϱ�, ��ٱ��� �����ϱ� -->
					<a>
						<input type="button" title="�����ϱ�" alt="�����ϱ�" value="�����ϱ�"
							 onclick="" class="btn_cart03" id="log.cart">
					</a>
					<a href="classic.jsp">
						<input type="button" title="��� �����ϱ�" alt="��� �����ϱ�" value="��� �����ϱ�" 
							 class="btn_cart02" id="log.cart">
					</a>
					<a>
						<input type="button" title="��ٱ��� ����" alt="��ٱ��� ����" value="��ٱ��� ����"
							 onclick="" class="btn_cart01" id="log.cart">
					</a>
				</div>
			</div>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>