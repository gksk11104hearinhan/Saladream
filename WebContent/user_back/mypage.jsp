<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Mypage_����������</title>
</head>
	<link href="../css/mypage_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="mypage_wrap">
	<!-- mypage_wrap�� ũ�� => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<div id="mypage_keyimg">
			<!-- keyimage�κ��Դϴ�. -->
			mypage_keyimage�κ��Դϴ�.
		</div>
		
		<div id="mypage_content">
			���������� -> �� �ֹ�����, ȸ������ ����
			<div id="mypage_con01">
				�� �ֹ�����
			</div>
			<div id="mypage_con02">
				ȸ������ ����
			</div>
		</div>
		
		<div id="mypage_button" class="mypage_bt">
			<!-- ��ٱ��� ����, ���� ����ϱ�, ��ٱ��� �����ϱ� -->
			<a href="#">
				<input type="button" title="�� �ֹ�����" alt="�� �ֹ�����" value="�� �ֹ�����" class="btn_mypage01" id="log.mypage">
			</a>
			<a href="#">
				<input type="button" title="ȸ������ ����" alt="ȸ������ ����" value="ȸ������ ����" class="btn_mypage02" id="log.mypage">
			</a>
			<a href="logout.jsp">
			<input type="button" title="�α׾ƿ�" alt="�α׾ƿ�" value="�α׾ƿ�" class="btn_mypage03" id="log.mypage">
			</a>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>