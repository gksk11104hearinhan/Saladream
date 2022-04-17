<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Event_�̺�Ʈ������</title>
	<!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="../css/materialize.min.css" media="screen,projection"/>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
	 <link type="text/css" rel="stylesheet" href="../css/nav02_style.css"/>
	<link href="../css/event_style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="fixtop.jsp"></jsp:include>
	
	<div id="banner" class="banner">
			<div id="down_wrap">
			<div class="down">
			    <div class="nav03_text01">
			    	<span class="NText01_con01">�̺�Ʈ</span>
			    	<span class="NText01_con02"> ���丮</span>
			    </div>
			    <div class="nav03_text02">
			     	'�����帲�� ���ص帮�� �پ��� �̺�Ʈ!'
			    </div>
			    <div class="nav03_text02">
			    	������ ���� �پ��� �̺�Ʈ���� �˷��帳�ϴ�.
			    </div>
			</div>
			</div>
		</div>
		
		<div id="event_nav">
			<span class="CUSnav_text1"><a href="#eventIng_wrap">������ �̺�Ʈ</a></span>
			<span class="CUSnav_text2">|</span>
			<span class="CUSnav_text1"><a href="#eventFinish_wrap">����� �̺�Ʈ</a></span>
		</div>

	<div id="event_wrap">
	<!-- event_wrap�� ũ�� => width=1080,height=? -->
		
		<!-- <div id="event_keyimg">
			keyimage�κ��Դϴ�.
			event_keyimage�κ��Դϴ�.
		</div> -->
		<div id="eventIng_wrap">
			<div id="eING_title">
				������ �̺�Ʈ
			</div>
			<div id="eING_con">
				<div id="eING_con01">
					<img alt="" src="../e_img/event_ing01.jpg">
				</div>
				<div id="eING_con02">
					<img alt="" src="../e_img/event_ing02.jpg" class="eINGcon02_Image">
					<img alt="" src="../e_img/event_ing03.jpg">
				</div>
			</div>
		</div>
		<div id="eventFinish_wrap">
			<div id="eFIN_title">
				����� �̺�Ʈ
			</div>
			<div id="eFIN_con">
				<img alt="" src="../e_img/event_finish01.jpg" class="eFINcon_Image">
				<img alt="" src="../e_img/event_finish02.jpg" class="eFINcon_Image">
				<img alt="" src="../e_img/event_finish03.jpg">
			</div>
		</div>
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>