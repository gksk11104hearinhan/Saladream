<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Join,Mypage_회원가입페이지,마이</title>
	<link href="../css/join_style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function checkJoinfield() {
			if (document.joinFrm.id.value == "") {
				alert("아이디를 입력해 주세요.");
				document.joinFrm.id.focus();
				return;
			}
			if (document.joinFrm.pw.value == "") {
				alert("비밀번호를 입력해 주세요.");
				document.joinFrm.pw.focus();
				return;
			}
			if (document.joinFrm.name.value == "") {
				alert("이름을 입력해 주세요.");
				document.joinFrm.name.focus();
				return;
			}
			if (document.joinFrm.birthday01.value == "") {
				alert("생년월일(탄생년도)을 입력해 주세요.");
				document.joinFrm.birthday01.focus();
				return;
			}
			if (document.joinFrm.birthday02.value == "0") {
				alert("생년월일(탄생 월)을 선택해 주세요.");
				document.joinFrm.birthday02.focus();
				return;
			}
			if (document.joinFrm.birthday03.value == "0") {
				alert("생년월일(탄생 일)을 선택해 주세요.");
				document.joinFrm.birthday03.focus();
				return;
			}
			if (document.joinFrm.gender.value == "0") {
				alert("성별을 선택해 주세요.");
				document.joinFrm.gender.focus();
				return;
			}
			if (document.joinFrm.email.value == "") {
				alert("이메일을 입력해 주세요.");
				document.joinFrm.email.focus();
				return;
			}
			if (document.joinFrm.addr01.value == "") {
				alert("주소를 입력해 주세요.");
				document.joinFrm.addr01.focus();
				return;
			}
			if (document.joinFrm.addr02.value == "") {
				alert("상세주소를 입력해 주세요.");
				document.joinFrm.addr02.focus();
				return;
			}
			if (document.joinFrm.hobby.value == "0") {
				alert("취미를 선택해 주세요.");
				document.joinFrm.hobby.focus();
				return;
			}
			if (document.joinFrm.job.value == "0") {
				alert("직업을 선택해 주세요.");
				document.joinFrm.job.focus();
				return;
			}
			if (document.joinFrm.phone01.value == "0") {
				alert("휴대폰 번호 앞 자리를 선택해 주세요.");
				document.joinFrm.phone01.focus();
				return;
			}
			if (document.joinFrm.phone02.value == "") {
				alert("휴대폰 번호를 중간 자리 입력해 주세요.");
				document.joinFrm.phone02.focus();
				return;
			}
			if (document.joinFrm.phone03.value == "") {
				alert("휴대폰 번호를 뒷 자리 입력해 주세요.");
				document.joinFrm.phone03.focus();
				return;
			}
			document.joinFrm.submit();
		}
	</script>
</head>
<body>
<!-- 로그인(session) 상태인 경우, 마이페이지 (내 주문내역(결제 한것들!), 회원정보 수정하는 페이지) -->
<!-- 로그아웃(session) 상태인 경우, 회우너가입 폼 -->
	<div id="join_wrap">
	<!-- join_wrap의 크기 => width=760(460),height=? -->
		<div id="join_header">
			<a href="index.jsp">
				<img alt="" src="../img/logo2.png" width="230px" height="91px">
			</a>
		</div>
		<form action="joinproc.jsp" method="post" name="joinFrm" accept-charset="utf-8">
			<div id="container">
			<!-- container부분 -->
				<div id="content">
				<!-- content부분 => join_up,join_cen01,join_cen02,join_under -->
					<div id="join_up">
					<!-- 아이디, 비번, 비번확인 -->
						<div class="join_id">
							<h3 class="join_title">
								<label for="id">아이디</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="text" id="id" name="id" class="int" title="id" maxlength="20" placeholder="아이디 입력">
							</span>
							</div>
						</div>
						<div class="join_pw">
							<h3 class="join_title">
								<label for="pw">비밀번호</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="password" id="pw" name="pw" class="int" title="pw" maxlength="40" placeholder="비밀번호 입력">
							</span>
							</div>
						</div>
						<div class="join_pw_check">
							<h3 class="join_title">
								<label for="pw_check">비밀번호 재확인</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="password" id="pw_check" name="pw_check" class="int" title="pw_check" maxlength="40" placeholder="비밀번호 재확인">
							</span>
							</div>
						</div>
					</div>
					<div id="join_con01">
					<!-- 이름, 생년월일, 성별, 이메일 -->
						<div class="join_name">
							<h3 class="join_title">
								<label for="name">이름</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="text" id="name" name="name" class="int" title="name" maxlength="20" placeholder="이름 입력">
							</span>
							</div>
						</div>
						<div class="join_birthday">
							<h3 class="join_title">
								<label for="birthday">생년월일</label>
							</h3>
							<div class="input_row2">
							<span class="join_int">
								<input type="text" id="birthday01" name="birthday01" class="int_bir" title="birthday01" maxlength="4" placeholder="년(ex.1900)">
								<select id="birthday02" name="birthday02" class="sel_bir01">
									<option value="0">월</option>
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
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
								<select id="birthday03" name="birthday03" class="sel_bir02">
								<option value="0">일</option>
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
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
							</span>
							</div>
						</div>
						<div class="join_gender">
							<h3 class="join_title">
								<label for="gender">성별</label>
							</h3>
							<div class="input_row2">
							<span class="join_int">
								<select id="gender" name="gender" class="sel">
									<option value="0" selected="selected">성별</option>
									<option value="man">남자</option>
									<option value="woman">여자</option>
								</select>
							</span>
							</div>
						</div>
						<div class="join_email">
							<h3 class="join_title">
								<label for="email">이메일</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="text" id="email" name="email" class="int" title="email" maxlength="40" placeholder="이메일 입력">
							</span>
							</div>
						</div>
					</div>
					
					<div id="join_con02">
					<!-- (우편번호)주소, 취미, 직업 -->
						<div class="join_addr">
							<h3 class="join_title">
								<label for="addr">주소</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="text" id="addr01" name="addr01" class="int" title="addr01" maxlength="20" placeholder="주소 입력">
							</span>
							</div>
							<div class="input_row">
							<span class="join_int">
								<input type="text" id="addr02" name="addr02" class="int" title="addr02" maxlength="20" placeholder="상세주소 입력">
							</span>
							</div>
						</div>
						<div class="join_hobby">
							<h3 class="join_title">
								<label for="hobby">취미</label>
							</h3>
							<div class="input_row2">
							<span class="join_int">
								<select id="hobby" name="hobby" class="sel">
									<option value="0" selected="selected">취미</option>
									<option value="internet">인터넷</option>
									<option value="travel">여행</option>
									<option value="game">게임</option>
									<option value="movie">영화</option>
									<option value="reading">도서</option>
									<option value="etc">(기타)</option>
								</select>
							</span>
							</div>
						</div>
						<div class="join_job">
							<h3 class="join_title">
								<label for="job">직업</label>
							</h3>
							<div class="input_row2">
							<span class="join_int">
								<select id="job" name="job" class="sel">
									<option value="0" selected="selected">직업</option>
									<option value="공무원">공무원</option>
									<option value="회사원">회사원</option>
									<option value="학생01">학생(대학생, 대학원)</option>
									<option value="학생02">학생</option>
									<option value="군인">군인</option>
									<option value="etc">(기타)</option>
								</select>
							</span>
							</div>
						</div>
					</div>
					<div id="join_under">
					<!-- 이메일, 휴대전화 -->
						<div class="join_phone">
							<h3 class="join_title">
								<label for="phone">휴대폰</label>
							</h3>
							<div class="input_row2">
							<span class="join_int">
								<select id="phone01" name="phone01" class="sel_phone">
									<option value="0">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
									<option value="018">018</option>
								</select>
								<input type="text" id="phone02" name="phone02" class="int_phone01" title="phone02" maxlength="4">
								<input type="text" id="phone03" name="phone03" class="int_phone02" title="phone03" maxlength="4">
							</span>
							</div>
						</div>
					</div>
					<input type="button" title="가입하기" alt="가입하기" value="가입하기" class="btn_login" id="log.login" onclick="checkJoinfield()">
					<!-- 가입하기 -->
					<div id="join_con03">
						<div class="under_info">
							<a href="index.jsp">메인으로</a>
							<span class="bar">ㅣ</span>
							<a href="login.jsp">로그인</a>
						</div>
					</div>
				
					<div id="join_con04">
						<div class="under_event">
							이벤트 배너 (광고)
						</div>
					</div>
					
				</div>
				
				<div id="join_footer">
						이용약관 ㅣ 고객센터 ㅣ 개인정보보호 <br>
						<b>SalaDream Copyright Saladream.</b> All Rights Reserved.
				</div>
			</div>
		</form>
	</div>

	
</body>
</html>