<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Join,Mypage_ȸ������������,����</title>
	<link href="../css/join_style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function checkJoinfield() {
			if (document.joinFrm.id.value == "") {
				alert("���̵� �Է��� �ּ���.");
				document.joinFrm.id.focus();
				return;
			}
			if (document.joinFrm.pw.value == "") {
				alert("��й�ȣ�� �Է��� �ּ���.");
				document.joinFrm.pw.focus();
				return;
			}
			if (document.joinFrm.name.value == "") {
				alert("�̸��� �Է��� �ּ���.");
				document.joinFrm.name.focus();
				return;
			}
			if (document.joinFrm.birthday01.value == "") {
				alert("�������(ź���⵵)�� �Է��� �ּ���.");
				document.joinFrm.birthday01.focus();
				return;
			}
			if (document.joinFrm.birthday02.value == "0") {
				alert("�������(ź�� ��)�� ������ �ּ���.");
				document.joinFrm.birthday02.focus();
				return;
			}
			if (document.joinFrm.birthday03.value == "0") {
				alert("�������(ź�� ��)�� ������ �ּ���.");
				document.joinFrm.birthday03.focus();
				return;
			}
			if (document.joinFrm.gender.value == "0") {
				alert("������ ������ �ּ���.");
				document.joinFrm.gender.focus();
				return;
			}
			if (document.joinFrm.email.value == "") {
				alert("�̸����� �Է��� �ּ���.");
				document.joinFrm.email.focus();
				return;
			}
			if (document.joinFrm.addr01.value == "") {
				alert("�ּҸ� �Է��� �ּ���.");
				document.joinFrm.addr01.focus();
				return;
			}
			if (document.joinFrm.addr02.value == "") {
				alert("���ּҸ� �Է��� �ּ���.");
				document.joinFrm.addr02.focus();
				return;
			}
			if (document.joinFrm.hobby.value == "0") {
				alert("��̸� ������ �ּ���.");
				document.joinFrm.hobby.focus();
				return;
			}
			if (document.joinFrm.job.value == "0") {
				alert("������ ������ �ּ���.");
				document.joinFrm.job.focus();
				return;
			}
			if (document.joinFrm.phone01.value == "0") {
				alert("�޴��� ��ȣ �� �ڸ��� ������ �ּ���.");
				document.joinFrm.phone01.focus();
				return;
			}
			if (document.joinFrm.phone02.value == "") {
				alert("�޴��� ��ȣ�� �߰� �ڸ� �Է��� �ּ���.");
				document.joinFrm.phone02.focus();
				return;
			}
			if (document.joinFrm.phone03.value == "") {
				alert("�޴��� ��ȣ�� �� �ڸ� �Է��� �ּ���.");
				document.joinFrm.phone03.focus();
				return;
			}
			document.joinFrm.submit();
		}
	</script>
</head>
<body>
<!-- �α���(session) ������ ���, ���������� (�� �ֹ�����(���� �Ѱ͵�!), ȸ������ �����ϴ� ������) -->
<!-- �α׾ƿ�(session) ������ ���, ȸ��ʰ��� �� -->
	<div id="join_wrap">
	<!-- join_wrap�� ũ�� => width=760(460),height=? -->
		<div id="join_header">
			<a href="index.jsp">
				<img alt="" src="../img/logo2.png" width="230px" height="91px">
			</a>
		</div>
		<form action="joinproc.jsp" method="post" name="joinFrm" accept-charset="utf-8">
			<div id="container">
			<!-- container�κ� -->
				<div id="content">
				<!-- content�κ� => join_up,join_cen01,join_cen02,join_under -->
					<div id="join_up">
					<!-- ���̵�, ���, ���Ȯ�� -->
						<div class="join_id">
							<h3 class="join_title">
								<label for="id">���̵�</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="text" id="id" name="id" class="int" title="id" maxlength="20" placeholder="���̵� �Է�">
							</span>
							</div>
						</div>
						<div class="join_pw">
							<h3 class="join_title">
								<label for="pw">��й�ȣ</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="password" id="pw" name="pw" class="int" title="pw" maxlength="40" placeholder="��й�ȣ �Է�">
							</span>
							</div>
						</div>
						<div class="join_pw_check">
							<h3 class="join_title">
								<label for="pw_check">��й�ȣ ��Ȯ��</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="password" id="pw_check" name="pw_check" class="int" title="pw_check" maxlength="40" placeholder="��й�ȣ ��Ȯ��">
							</span>
							</div>
						</div>
					</div>
					<div id="join_con01">
					<!-- �̸�, �������, ����, �̸��� -->
						<div class="join_name">
							<h3 class="join_title">
								<label for="name">�̸�</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="text" id="name" name="name" class="int" title="name" maxlength="20" placeholder="�̸� �Է�">
							</span>
							</div>
						</div>
						<div class="join_birthday">
							<h3 class="join_title">
								<label for="birthday">�������</label>
							</h3>
							<div class="input_row2">
							<span class="join_int">
								<input type="text" id="birthday01" name="birthday01" class="int_bir" title="birthday01" maxlength="4" placeholder="��(ex.1900)">
								<select id="birthday02" name="birthday02" class="sel_bir01">
									<option value="0">��</option>
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
								<option value="0">��</option>
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
								<label for="gender">����</label>
							</h3>
							<div class="input_row2">
							<span class="join_int">
								<select id="gender" name="gender" class="sel">
									<option value="0" selected="selected">����</option>
									<option value="man">����</option>
									<option value="woman">����</option>
								</select>
							</span>
							</div>
						</div>
						<div class="join_email">
							<h3 class="join_title">
								<label for="email">�̸���</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="text" id="email" name="email" class="int" title="email" maxlength="40" placeholder="�̸��� �Է�">
							</span>
							</div>
						</div>
					</div>
					
					<div id="join_con02">
					<!-- (�����ȣ)�ּ�, ���, ���� -->
						<div class="join_addr">
							<h3 class="join_title">
								<label for="addr">�ּ�</label>
							</h3>
							<div class="input_row">
							<span class="join_int">
								<input type="text" id="addr01" name="addr01" class="int" title="addr01" maxlength="20" placeholder="�ּ� �Է�">
							</span>
							</div>
							<div class="input_row">
							<span class="join_int">
								<input type="text" id="addr02" name="addr02" class="int" title="addr02" maxlength="20" placeholder="���ּ� �Է�">
							</span>
							</div>
						</div>
						<div class="join_hobby">
							<h3 class="join_title">
								<label for="hobby">���</label>
							</h3>
							<div class="input_row2">
							<span class="join_int">
								<select id="hobby" name="hobby" class="sel">
									<option value="0" selected="selected">���</option>
									<option value="internet">���ͳ�</option>
									<option value="travel">����</option>
									<option value="game">����</option>
									<option value="movie">��ȭ</option>
									<option value="reading">����</option>
									<option value="etc">(��Ÿ)</option>
								</select>
							</span>
							</div>
						</div>
						<div class="join_job">
							<h3 class="join_title">
								<label for="job">����</label>
							</h3>
							<div class="input_row2">
							<span class="join_int">
								<select id="job" name="job" class="sel">
									<option value="0" selected="selected">����</option>
									<option value="������">������</option>
									<option value="ȸ���">ȸ���</option>
									<option value="�л�01">�л�(���л�, ���п�)</option>
									<option value="�л�02">�л�</option>
									<option value="����">����</option>
									<option value="etc">(��Ÿ)</option>
								</select>
							</span>
							</div>
						</div>
					</div>
					<div id="join_under">
					<!-- �̸���, �޴���ȭ -->
						<div class="join_phone">
							<h3 class="join_title">
								<label for="phone">�޴���</label>
							</h3>
							<div class="input_row2">
							<span class="join_int">
								<select id="phone01" name="phone01" class="sel_phone">
									<option value="0">����</option>
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
					<input type="button" title="�����ϱ�" alt="�����ϱ�" value="�����ϱ�" class="btn_login" id="log.login" onclick="checkJoinfield()">
					<!-- �����ϱ� -->
					<div id="join_con03">
						<div class="under_info">
							<a href="index.jsp">��������</a>
							<span class="bar">��</span>
							<a href="login.jsp">�α���</a>
						</div>
					</div>
				
					<div id="join_con04">
						<div class="under_event">
							�̺�Ʈ ��� (����)
						</div>
					</div>
					
				</div>
				
				<div id="join_footer">
						�̿��� �� ������ �� ����������ȣ <br>
						<b>SalaDream Copyright Saladream.</b> All Rights Reserved.
				</div>
			</div>
		</form>
	</div>

	
</body>
</html>