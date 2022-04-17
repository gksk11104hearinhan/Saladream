<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Main_���� ������</title>
	
	<!-- <link href="../css/main_style.css" rel="stylesheet" type="text/css"> -->
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
	<link href="../css/index_style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
		String id = (String)session.getAttribute("id");
	%>

	<div id="main_wrap">
	<!-- main_wrap�� ũ�� => width=1000,height=3750 -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<div id="main_keyimg">
			<!-- keyimage�κ��Դϴ�. -->
			<!-- keyimage�κ��Դϴ�. ���� : 470 -->
		</div>
		<div id="main_key_sliceimg">
			<!-- �߸�  Ű �̹��� �κ� : �丶�� �� �κ�, ����:110 -->
		</div>
		<div id="main_con_classic">
			<!-- 35.28cm 24.59cm //border => 1.3px (1000 697(700)) <br>
			���� 700-110 : 590��! -> 640
			content -> classic �Ұ� -->
			
		</div>
		<div id="main_classic_custom_mid">
			<!-- ���� 50�� �丶��� �ٻ�� ©���κ��� Ŀ�����ִ� �κ� -->
		</div>
		<div id="main_con_custom">
			<div id="con_custom_01">
				<!-- 1000px 590px -> 540px; <br>
				content -> "�����޴�"��� ���� �κ� custom �Ұ� -->
			</div>
			<div id="con_custom_02">
				<!-- 1000px 240px <br>
				content -> custom(Ŀ����) �Ұ� -->
			</div>
		</div>
		<div id="main_con_brand">
			<!-- 35.28cm 20.53cm (1000 582(580)) <br>
			content -> brand �Ұ�, -->
			<ul>
				<li class="snip1431">
				<figure class="snip1432">
					<img src="../m_img/main_brand_con01.png" alt="Quality" />
					<figcaption>
				    <div>
				    	<h3>�ְ��� ���� ǰ���� ���� ����մϴ�</h3>
				    	<h3>�ְ��� ���� ǰ���� ���� ����մϴ�</h3>
				    </div>
				    <div>
				    	<h2>Quality</h2>
				    </div>
					</figcaption>
					<!-- <a href="#"></a> -->
				</figure>
				</li>
				<li>
				<figure class="snip1433">
					<img src="../m_img/main_brand_con02.png" alt="Customer" />
					<figcaption>
				    <div>
				    	<h3>���� �ູ�� ���� �����ϴ� ����Դϴ�</h3>
				    	<h3>���� �ູ�� ���� �����ϴ� ����Դϴ�</h3>
				    </div>
				    <div>
				    	<h2>Customer</h2>
				    </div>
					</figcaption>
					<!-- <a href="#"></a> -->
				</figure>
				</li>
			</ul>
		</div>
		<div id="main_con_event">
			<!-- 35.28cm 28.19cm (1000 799(800)) <br>
			content -> event �Ұ� -->
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>