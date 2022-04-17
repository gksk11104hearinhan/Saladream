<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Login_로그인페이지</title>
	<link href="../css/login_style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function checkfield() {
			if (document.loginFrm.id.value == "") {
				alert("아이디를 입력해 주세요.");
				document.loginFrm.id.focus();
				return;
			}
			if (document.loginFrm.pw.value == "") {
				alert("비밀번호를 입력해 주세요.");
				document.loginFrm.pw.focus();
				return;
			}
			document.loginFrm.submit();
		}
	</script>
</head>
<body>
	<div id="login_wrap">
	<!-- login_wrap의 크기 => width=760(460),height=? -->
		
		<%-- <jsp:include page="fixtop.jsp"></jsp:include> --%>
		
		<div id="login_header">
			<a href="index.jsp">
				<img alt="" src="../img/logo2.png" width="230px" height="91px">
			</a>
		</div>
		<div id="login_content">
		<div id="login001">
			<form action="loginProc.jsp" method="post" name="loginFrm">
				<fieldset class="login_form">
					<div class="id_area">
						<div class="input_row">
						<span class="input_box">
							<input type="text" id="id" name="id" placeholder="아이디" maxlength="40" class="int">
						</span>
						</div>
					</div>
					<div class="pw_area">
						<div class="input_row">
						<span class="input_box">
							<input type="password" id="pw" name="pw" placeholder="비밀번호" maxlength="20" class="int">
						</span>
						</div>
					</div>
					<input type="button" title="로그인" alt="로그인" value="로그인" class="btn_login" id="log.login" onclick="checkfield()">
					<div class="check_info">
						<div id="login_check">
							<span class="login_chk">
								<input type="checkbox" id="login_chk" name="nvlog" value="off">
								<label for="login_chk" id="label_login_chk" class="sp">아이디 저장</label>
							</span>
						</div>
					</div>
				</fieldset>
			</form>
			
			<div id="login_con01">
				<div class="under_info">
					<a href="index.jsp">메인으로</a>
					<span class="bar">ㅣ</span>
					<a href="join.jsp">회원가입</a>
				</div>
			</div>
			
			<div id="login_con02">
				<div class="under_event">
					이벤트 배너 (광고)
				</div>
			</div>
		</div>
		</div>
		<div id="login_footer">
			이용약관 ㅣ 고객센터 ㅣ 개인정보보호 <br>
			SalaDream Copyright Saladream. All Rights Reserved.
		</div>
		
	</div>
</body>
</html>