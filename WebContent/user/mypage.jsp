<%@page import="java.text.SimpleDateFormat"%>
<%@page import="saladream.CartDTO"%>
<%@page import="saladream.MyPageDTO"%>
<%@page import="saladream.MyPageDAO"%>
<%@page import="saladream.MemberDTO"%>
<%@page import="saladream.MemberDAO"%>
<%@page import="java.util.*"%>
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
	<!-- ���â -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<script type="text/javascript">
		function checkJoinfield() {
			if (document.upFrm.id.value == "") {
				alert("���̵� �Է��� �ּ���.");
				document.upFrm.id.focus();
				return;
			}
			if (document.upFrm.name.value == "") {
				alert("�̸��� �Է��� �ּ���.");
				document.upFrm.name.focus();
				return;
			}
			if (document.upFrm.birthday01.value == "") {
				alert("�������(ź���⵵)�� �Է��� �ּ���.");
				document.upFrm.birthday01.focus();
				return;
			}
			if (document.upFrm.birthday02.value == "0") {
				alert("�������(ź�� ��)�� ������ �ּ���.");
				document.upFrm.birthday02.focus();
				return;
			}
			if (document.upFrm.birthday03.value == "0") {
				alert("�������(ź�� ��)�� ������ �ּ���.");
				document.upFrm.birthday03.focus();
				return;
			}
			
			if (document.upFrm.email.value == "") {
				alert("�̸����� �Է��� �ּ���.");
				document.upFrm.email.focus();
				return;
			}
			if (document.upFrm.addr01.value == "") {
				alert("�ּҸ� �Է��� �ּ���.");
				document.upFrm.addr01.focus();
				return;
			}
			
			if (document.upFrm.phone01.value == "0") {
				alert("�޴��� ��ȣ �� �ڸ��� ������ �ּ���.");
				document.upFrm.phone01.focus();
				return;
			}
			if (document.upFrm.phone02.value == "") {
				alert("�޴��� ��ȣ�� �߰� �ڸ� �Է��� �ּ���.");
				document.upFrm.phone02.focus();
				return;
			}
			
			document.upFrm.submit();
		}
	</script>
</head>
<body>

	<jsp:include page="fixtop.jsp"></jsp:include>
	
	<%
	if(session.getAttribute("id") == null){
		response.sendRedirect("./login.jsp");
		return;
	}
	
		String sid = (String)session.getAttribute("id");
		String cid = session.getId();
		
		MyPageDAO mpDao = new MyPageDAO();
		List<MyPageDTO> classicList = mpDao.selectClassicAll(sid);
		List<MyPageDTO> customList = mpDao.selectCustomAll(sid);
		List<CartDTO> cartList = mpDao.selectCartAll(cid);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto2 = dao.selectOne(new MemberDTO(sid));
		
	%>
	
	<div id="mypage_wrap">
	<!-- mypage_wrap�� ũ�� => width=1000,height=? -->
		<div id="mypage_title">
			MY PAGE
		</div>
		<div class="key_con02">
			<b><%= sid %></b>�� ȯ���մϴ�
		</div>
		
	<!-- ============================================================= -->
		
		<div id="mypage_nav">
			<span class="MPNav_list01">
				<a href="#mypage_order">ORDER</a>
			</span>
			<span class="MPNav_list02">|</span>
			<span class="MPNav_list03">
				<a href="#mypage_myinfo">MY INFO</a>
			</span>
			<span class="MPNav_list02">|</span>
			<span class="MPNav_list03">
				<a href="#mypage_inquiry">INQUIRY</a>
			</span>
		</div>
		
		<div id="mypage_order">
			<div id="MPOrder_Con01">
				<span class="mpOrdCon01_title">Order</span><br>
				<span class="mpOrdCon01_text">�ֹ��Ͻ� ��ǰ������ ��ٱ��� ������ Ȯ���Ͻ� �� �ֽ��ϴ�.</span>
			</div>
			
			<div id="MPOrder_Con02">
				<div id="MPOrdCon02_title">
					<span class="MPTable_title">�ֹ�����</span>
				</div>
				<div id="MPOrdCon02_table">
					<table class="MPTable_style01">
						<tr>
							<td class="MPOrdCon2_td01">�ֹ�����</td>
							<td class="MPOrdCon2_td02">��ǰ��</td>
							<td class="MPOrdCon2_td03">�����ݾ�</td>
							<td class="MPOrdCon2_td04">ó����Ȳ</td>
						</tr>
						<%for(MyPageDTO dto : classicList){ %>
						<tr>
							<td class="MPOrdCon2_td05"><%=dto.getOdate() %></td>
							<td class="MPOrdCon2_td06"><%=dto.getPname() %></td>
							<td class="MPOrdCon2_td07"><%=dto.getOpay() %></td>
							<td class="MPOrdCon2_td08">�Ϸ�</td>
						</tr>
						<% } %>
						<%for(MyPageDTO dto : customList){ %>
						<tr>
							<td class="MPOrdCon2_td05"><%=dto.getOdate() %></td>
							<td class="MPOrdCon2_td06"><%=dto.getPname() %></td>
							<td class="MPOrdCon2_td07"><%=dto.getOpay() %></td>
							<td class="MPOrdCon2_td08">�Ϸ�</td>
						</tr>
						<% } %>
					</table>
				</div>
				<div id="MPOrdCon02_step">
					<div class="MPOrdStep_style01">
						<img alt="" src="../mp_img/mupage_order01.png"><br>
						<span class="MPOrdStep_text01">�������</span><br>
						<span class="MPOrdStep_text02">������ �������Դϴ�.</span>
					</div>
					<span class="MPOrdStep_style02">></span>
					<div class="MPOrdStep_style01">
						<img alt="" src="../mp_img/mupage_order02.png"><br>
						<span class="MPOrdStep_text01">�����Ϸ�</span><br>
						<span class="MPOrdStep_text02">������ �Ϸ�Ǿ����ϴ�.</span><br>
						<span class="MPOrdStep_text03">�����ڰ� �ֹ������� Ȯ�����Դϴ�.</span><br>
						<span class="MPOrdStep_text03">�ֹ� ��Ұ� �����մϴ�.</span>
					</div>
					<span class="MPOrdStep_style02">></span>
					<div class="MPOrdStep_style01">
						<img alt="" src="../mp_img/mupage_order03.png"><br>
						<span class="MPOrdStep_text01">��ǰ�غ���</span><br>
						<span class="MPOrdStep_text02">�ù�簡 ��ǰ�� �������Դϴ�.</span><br>
						<span class="MPOrdStep_text03">�����ڰ� �ֹ������� Ȯ���߽��ϴ�.</span>
					</div>
					<span class="MPOrdStep_style02">></span>
					<div class="MPOrdStep_style01">
						<img alt="" src="../mp_img/mupage_order04.png"><br>
						<span class="MPOrdStep_text01">�����</span><br>
						<span class="MPOrdStep_text02">��ǰ�� ������Դϴ�.</span>
					</div>
					<span class="MPOrdStep_style02">></span>
					<div class="MPOrdStep_style01">
						<img alt="" src="../mp_img/mupage_order05.png"><br>
						<span class="MPOrdStep_text01">��ۿϷ�</span><br>
						<span class="MPOrdStep_text02">��ǰ�� ��� �Ϸ��Ͽ����ϴ�.</span><br>
						<span class="MPOrdStep_text03">��ǰ�� Ȯ���ϼ���.</span>
					</div>
				</div>
			</div>
			
			<div id="MPOrder_Con03">
				<div id="MPOrdCon03_title">
					<span class="MPTable_title">��ٱ��ϳ���</span>
				</div>
				<div id="MPOrdCon03_table">
					<table class="MPTable_style01">
						<tr>
							<td class="MPOrdCon2_td01">�������</td>
							<td class="MPOrdCon2_td02">��ǰ��</td>
							<td class="MPOrdCon2_td03">�����ݾ�</td>
							<td class="MPOrdCon2_td04">���ü���</td>
						</tr>
						<%for(CartDTO dto : cartList){ %>
						<tr>
							<td class="MPOrdCon2_td05"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%></td>
							<td class="MPOrdCon2_td06"><%=dto.getPname()%></td>
							<td class="MPOrdCon2_td07"><%=dto.getOpay() %></td>
							<td class="MPOrdCon2_td08"><%=dto.getCproductNum01() %></td>
						</tr>
						<% } %>
					</table>
				</div>
				<div id="MPOrdCon03_button">
					<span class="MPOrdCon03_btn">
						<a href="showCart.jsp">��ٱ��Ϸ� �̵�</a>
					</span>
				</div>
			</div>
		</div>
		
	<!-- ============================================================= -->

		<div id="mypage_nav">
			<span class="MPNav_list03">
				<a href="#mypage_order">ORDER</a>
			</span>
			<span class="MPNav_list02">|</span>
			<span class="MPNav_list01">
				<a href="#mypage_myinfo">MY INFO</a>
			</span>
			<span class="MPNav_list02">|</span>
			<span class="MPNav_list03">
				<a href="#mypage_inquiry">INQUIRY</a>
			</span>
		</div>
		
		<div id="mypage_myinfo">
			<div id="MPInfo_Con01">
				<span class="mpOrdCon01_title">My Info</span><br>
				<span class="mpOrdCon01_text">������ ���������� �����ϴ� ���Դϴ�.</span>
			</div>
			<div id="MPInfo_Con02">
				<div id="MPInfoCon02_title">
					<span class="MPTable_title">������ ����</span>
				</div>
				<div id="MPInfoCon02_table">
					<table class="MPTable_style01">
						<tr>
							<td class="MPInfoCon2_td01">�̸�</td>
							<td class="MPInfoCon2_td02"><%=dto2.getName() %></td>
						</tr>
						<tr>
							<td class="MPInfoCon2_td01">���̵�</td>
							<td class="MPInfoCon2_td02"><%=dto2.getId() %></td>
						</tr>
						<tr>
							<td class="MPInfoCon2_td01">�������</td>
							<td class="MPInfoCon2_td02"><%=dto2.getBirthday01() %></td>
						</tr>
						<tr>
							<td class="MPInfoCon2_td01">�̸���</td>
							<td class="MPInfoCon2_td02"><%=dto2.getEmail() %></td>
						</tr>
						<tr>
							<td class="MPInfoCon2_td01">�޴���</td>
							<td class="MPInfoCon2_td02"><%=dto2.getPhone01() %> - <%=dto2.getPhone02() %></td>
						</tr>
						<tr>
							<td class="MPInfoCon2_td01">�ּ�</td>
							<td class="MPInfoCon2_td02"><%=dto2.getAddr01() %></td>
						</tr>
					</table>
				</div>
				<div id="MPInfoCon02_warnig">
					<span class="MPInfoCon02_warn">
						*�н����� ������ ��� Saladream�� ������(080-0000-000)���� ���� ��Ź�帳�ϴ�.
					</span>
				</div>
				<div id="MPInfoCon02_button">
					<!-- ��ư�� ������ ��������� ������ �� �ֵ����Ѵ�. -->
					<span class="MPInfoCon02_btn">
						<a href="#ex1" rel="modal:open">�����ϱ�</a>
					</span>
				</div>
				<div id="ex1" class="modal">
					<div id="MPInfoCon02_title">
					<span class="MPTable_title">������ ����</span>
					</div>
				<form action="updateInformation.jsp" method="post" name="upFrm" accept-charset="utf-8">
					<div id="MPInfoCon02_table">
						<input type="hidden" name="oriid" value="<%=sid%>">
						<table class="MPTable_style01">
							<tr>
								<td class="MPInfoCon2_td01">�̸�</td>
								<td class="MPInfoCon2_td02"><input type="text" value="<%=dto2.getName() %>"  name="name"></td>
							</tr>
							<tr>
								<td class="MPInfoCon2_td01">���̵�</td>
								<td class="MPInfoCon2_td02"><input type="text" value="<%=dto2.getId() %>"  name="id"></td>
							</tr>
							<tr>
								<td class="MPInfoCon2_td01">�������</td>
								<td class="MPInfoCon2_td02">
								<input type="text" id="birthday01" name="birthday01" title="birthday01" maxlength="4" placeholder="��(ex.1900)">
								<select id="birthday02" name="birthday02">
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
								<select id="birthday03" name="birthday03">
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
								</td>
							</tr>
							<tr>
								<td class="MPInfoCon2_td01">�̸���</td>
								<td class="MPInfoCon2_td02"><input type="text" value="<%=dto2.getEmail() %>"  name="email"></td>
							</tr>
							<tr>
								<td class="MPInfoCon2_td01">�޴���</td>
								<td class="MPInfoCon2_td02">
								<select id="phone01" name="phone01" >
									<option value="0">����</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
									<option value="018">018</option>
								</select>
								<input type="text" id="phone02" name="phone02"  title="phone02" maxlength="8">
								</td>
							</tr>
							<tr>
								<td class="MPInfoCon2_td01">�ּ�</td>
								<td class="MPInfoCon2_td02"><input type="text" value="<%=dto2.getAddr01() %>"  name="addr01"></td>
							</tr>
						</table>
					</div>
					</form>
					<a href="#" rel="modal:close"><input type="button" value="�ݱ�"></a>
					<a href="#"><input type="button" onclick="checkJoinfield()" value="����"></a>
					<!-- <a href="#" rel="modal:close"><input type="button" value="�ݱ�"></a> -->
				</div>
			</div>
		</div>
		
	<!-- ============================================================= -->
		
		<div id="mypage_nav">
			<span class="MPNav_list03">
				<a href="#mypage_order">ORDER</a>
			</span>
			<span class="MPNav_list02">|</span>
			<span class="MPNav_list03">
				<a href="#mypage_myinfo">MY INFO</a>
			</span>
			<span class="MPNav_list02">|</span>
			<span class="MPNav_list01">
				<a href="#mypage_inquiry">INQUIRY</a>
			</span>
		</div>
		
		<div id="mypage_inquiry">
			<div id="MPInquiry_Con01">
				<span class="mpOrdCon01_title">Inquiry</span><br>
				<span class="mpOrdCon01_text">1:1 ���� ������ Ȯ���ϴ� ���Դϴ�.</span>
			</div>
			<div id="MPInquiry_Con02">
				<div id="MPInquiryCon02_title">
					<span class="MPTable_title">1:1���� ����</span>
				</div>
				<div id="MPInquiryCon02_table">
					<table class="MPTable_style01">
						<tr>
							<td class="MPInquiryCon2_td01">���ǳ���</td>
							<td class="MPInquiryCon2_td02">�ۼ���</td>
							<td class="MPInquiryCon2_td03">ó����Ȳ</td>
						</tr>
						<!-- <tr>
							<td class="MPInquiryCon2_td04">[�ӽ�]</td>
							<td class="MPInquiryCon2_td05">[�ӽ�]</td>
							<td class="MPInquiryCon2_td06">[�ӽ�]</td>
						</tr> -->
						<tr>
							<td class="MPInquiryCon2_td07" colspan="3">���� ������ �����ϴ�.</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="MPInquiry_Con03">
				<div id="MPInquiryCon02_title">
					<span class="MPTable_title">�����ϴ� ����</span>
				</div>
				<div id="MPInquiryCon02_table">
					<table class="MPTable_style01">
						<tr>
							<td class="MPInquiryCon2_td01">���ǳ���</td>
							<td class="MPInquiryCon2_td02">�亯��</td>
							<td class="MPInquiryCon2_td03">�亯</td>
						</tr>
						<tr>
							<td class="MPInquiryCon2_td04">Q. �ֹ��� ��ǰ�� ����ϰ� �ͽ��ϴ�.</td>
							<td class="MPInquiryCon2_td05">������</td>
							<td class="MPInquiryCon2_td06"><a href="#ex2" rel="modal:open">�亯����</a></td>
						</tr>
						<tr>
							<td class="MPInquiryCon2_td04">Q. ��ǰ�� �޾Ҵµ� ��ǰ�� �ϰ� �ͽ��ϴ�.</td>
							<td class="MPInquiryCon2_td05">������</td>
							<td class="MPInquiryCon2_td06"><a href="#ex3" rel="modal:open">�亯����</a></td>
						</tr>
						<tr>
							<td class="MPInquiryCon2_td04">Q. classic�� �������� ���԰�� ���� �ǳ���?</td>
							<td class="MPInquiryCon2_td05">������</td>
							<td class="MPInquiryCon2_td06"><a href="#ex4" rel="modal:open">�亯����</a></td>
						</tr>
						<tr>
							<td class="MPInquiryCon2_td04">Q. custom�� ���ܺ��� �Ѱ����� ���ð����Ѱ���?</td>
							<td class="MPInquiryCon2_td05">������</td>
							<td class="MPInquiryCon2_td06"><a href="#ex5" rel="modal:open">�亯����</a></td>
						</tr>
					</table>
					<div id="ex2" class="modal">
						<div id="MPInfoCon02_titleQ">
							<span class="MPTable_QuestionMark">Q.</span>
							<span class="MPTable_Question"> �ֹ��� ��ǰ�� ����ϰ� �ͽ��ϴ�.</span>
						</div>
						<div>
							<span class="MPTable_answerMark">A.</span>
							<span class="MPTable_answer"> ���� ���Բ��� �����Ͻ� ��ǰ�� ��ۻ��¿� ���� �ٸ��ϴ�.<br>
							��ۻ��¸� Ȯ���Ͻðų� ������(080-000-0000)�� ���� �ٶ��ϴ�.</span>
						</div>
						<a href="#" rel="modal:close"><input type="button" value="�ݱ�"></a>
					</div>
					<div id="ex3" class="modal">
						<div id="MPInfoCon02_titleQ">
							<span class="MPTable_QuestionMark">Q.</span>
							<span class="MPTable_Question"> ��ǰ�� �޾Ҵµ� ��ǰ�� �ϰ� �ͽ��ϴ�.</span>
						</div>
						<div>
							<span class="MPTable_answerMark">A.</span>
							<span class="MPTable_answer"> ���Բ� �߼��� ��ǰ�� ���¿� ���� �ٸ��ϴ�. <br>
							������(080-000-0000)�� ���� �ٶ��ϴ�.</span>
						</div>
						<a href="#" rel="modal:close"><input type="button" value="�ݱ�"></a>
					</div>
					<div id="ex4" class="modal">
						<div id="MPInfoCon02_titleQ">
							<span class="MPTable_QuestionMark">Q.</span>
							<span class="MPTable_Question"> classic�� �������� ���԰�� ���� �ǳ���?</span>
						</div>
						<div>
							<span class="MPTable_answerMark">A.</span>
							<span class="MPTable_answer"> ���� Saladream�� ��Ʋ�� �ѹ��� �ż��� ��ä�� �����ް��ֽ��ϴ�. <br>
							���� ��ä��� ��ǰ���� �����Ͽ� �ٷ� ������ ������ �ý������� <br>
							2�Ͽ� �ѹ��� �� �԰� ���� �˷��帳�ϴ�.</span>
						</div>
						<a href="#" rel="modal:close"><input type="button" value="�ݱ�"></a>
					</div>
					<div id="ex5" class="modal">
						<div id="MPInfoCon02_titleQ">
							<span class="MPTable_QuestionMark">Q.</span>
							<span class="MPTable_Question"> custom�� ���ܺ��� �Ѱ����� ���ð����Ѱ���?</span>
						</div>
						<div>
							<span class="MPTable_answerMark">A.</span>
							<span class="MPTable_answer"> Ŀ���͸���¡ �ý����� ��� step01�� ������ <br>
							step���� �ټ� ������ �� �� �ֵ��� ���� �߿� �ֽ��ϴ�. <br>
							�˼��մϴ�.</span>
						</div>
						<a href="#" rel="modal:close"><input type="button" value="�ݱ�"></a>
					</div>
					
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		<!-- <div id="mypage_button" class="mypage_bt">
			<a href="#">
				<input type="button" title="�� �ֹ�����" alt="�� �ֹ�����" value="ORDER" class="btn_mypage01" id="log.mypage">
			</a>
			<a href="#">
				<input type="button" title="ȸ������ ����" alt="ȸ������ ����" value="MY INFO" class="btn_mypage02" id="log.mypage">
			</a>
			<a href="logout.jsp">
			<input type="button" title="�α׾ƿ�" alt="�α׾ƿ�" value="LOG OUT" class="btn_mypage03" id="log.mypage">
			</a>
		</div> -->
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>