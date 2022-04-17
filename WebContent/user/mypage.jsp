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
<title>Mypage_마이페이지</title>
</head>
	<link href="../css/mypage_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
	<!-- 모달창 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<script type="text/javascript">
		function checkJoinfield() {
			if (document.upFrm.id.value == "") {
				alert("아이디를 입력해 주세요.");
				document.upFrm.id.focus();
				return;
			}
			if (document.upFrm.name.value == "") {
				alert("이름을 입력해 주세요.");
				document.upFrm.name.focus();
				return;
			}
			if (document.upFrm.birthday01.value == "") {
				alert("생년월일(탄생년도)을 입력해 주세요.");
				document.upFrm.birthday01.focus();
				return;
			}
			if (document.upFrm.birthday02.value == "0") {
				alert("생년월일(탄생 월)을 선택해 주세요.");
				document.upFrm.birthday02.focus();
				return;
			}
			if (document.upFrm.birthday03.value == "0") {
				alert("생년월일(탄생 일)을 선택해 주세요.");
				document.upFrm.birthday03.focus();
				return;
			}
			
			if (document.upFrm.email.value == "") {
				alert("이메일을 입력해 주세요.");
				document.upFrm.email.focus();
				return;
			}
			if (document.upFrm.addr01.value == "") {
				alert("주소를 입력해 주세요.");
				document.upFrm.addr01.focus();
				return;
			}
			
			if (document.upFrm.phone01.value == "0") {
				alert("휴대폰 번호 앞 자리를 선택해 주세요.");
				document.upFrm.phone01.focus();
				return;
			}
			if (document.upFrm.phone02.value == "") {
				alert("휴대폰 번호를 중간 자리 입력해 주세요.");
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
	<!-- mypage_wrap의 크기 => width=1000,height=? -->
		<div id="mypage_title">
			MY PAGE
		</div>
		<div class="key_con02">
			<b><%= sid %></b>님 환영합니다
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
				<span class="mpOrdCon01_text">주문하신 상품내역과 장바구니 내역을 확인하실 수 있습니다.</span>
			</div>
			
			<div id="MPOrder_Con02">
				<div id="MPOrdCon02_title">
					<span class="MPTable_title">주문내역</span>
				</div>
				<div id="MPOrdCon02_table">
					<table class="MPTable_style01">
						<tr>
							<td class="MPOrdCon2_td01">주문일자</td>
							<td class="MPOrdCon2_td02">상품명</td>
							<td class="MPOrdCon2_td03">결제금액</td>
							<td class="MPOrdCon2_td04">처리현황</td>
						</tr>
						<%for(MyPageDTO dto : classicList){ %>
						<tr>
							<td class="MPOrdCon2_td05"><%=dto.getOdate() %></td>
							<td class="MPOrdCon2_td06"><%=dto.getPname() %></td>
							<td class="MPOrdCon2_td07"><%=dto.getOpay() %></td>
							<td class="MPOrdCon2_td08">완료</td>
						</tr>
						<% } %>
						<%for(MyPageDTO dto : customList){ %>
						<tr>
							<td class="MPOrdCon2_td05"><%=dto.getOdate() %></td>
							<td class="MPOrdCon2_td06"><%=dto.getPname() %></td>
							<td class="MPOrdCon2_td07"><%=dto.getOpay() %></td>
							<td class="MPOrdCon2_td08">완료</td>
						</tr>
						<% } %>
					</table>
				</div>
				<div id="MPOrdCon02_step">
					<div class="MPOrdStep_style01">
						<img alt="" src="../mp_img/mupage_order01.png"><br>
						<span class="MPOrdStep_text01">결제대기</span><br>
						<span class="MPOrdStep_text02">결제를 진행중입니다.</span>
					</div>
					<span class="MPOrdStep_style02">></span>
					<div class="MPOrdStep_style01">
						<img alt="" src="../mp_img/mupage_order02.png"><br>
						<span class="MPOrdStep_text01">결제완료</span><br>
						<span class="MPOrdStep_text02">결제가 완료되었습니다.</span><br>
						<span class="MPOrdStep_text03">관리자가 주문내역을 확인중입니다.</span><br>
						<span class="MPOrdStep_text03">주문 취소가 가능합니다.</span>
					</div>
					<span class="MPOrdStep_style02">></span>
					<div class="MPOrdStep_style01">
						<img alt="" src="../mp_img/mupage_order03.png"><br>
						<span class="MPOrdStep_text01">상품준비중</span><br>
						<span class="MPOrdStep_text02">택배사가 제품을 포장중입니다.</span><br>
						<span class="MPOrdStep_text03">관리자가 주문내역을 확인했습니다.</span>
					</div>
					<span class="MPOrdStep_style02">></span>
					<div class="MPOrdStep_style01">
						<img alt="" src="../mp_img/mupage_order04.png"><br>
						<span class="MPOrdStep_text01">배송중</span><br>
						<span class="MPOrdStep_text02">제품을 배송중입니다.</span>
					</div>
					<span class="MPOrdStep_style02">></span>
					<div class="MPOrdStep_style01">
						<img alt="" src="../mp_img/mupage_order05.png"><br>
						<span class="MPOrdStep_text01">배송완료</span><br>
						<span class="MPOrdStep_text02">제품을 배송 완료하였습니다.</span><br>
						<span class="MPOrdStep_text03">제품을 확인하세요.</span>
					</div>
				</div>
			</div>
			
			<div id="MPOrder_Con03">
				<div id="MPOrdCon03_title">
					<span class="MPTable_title">장바구니내역</span>
				</div>
				<div id="MPOrdCon03_table">
					<table class="MPTable_style01">
						<tr>
							<td class="MPOrdCon2_td01">등록일자</td>
							<td class="MPOrdCon2_td02">상품명</td>
							<td class="MPOrdCon2_td03">결제금액</td>
							<td class="MPOrdCon2_td04">선택수량</td>
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
						<a href="showCart.jsp">장바구니로 이동</a>
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
				<span class="mpOrdCon01_text">고객님의 개인정보를 수정하는 곳입니다.</span>
			</div>
			<div id="MPInfo_Con02">
				<div id="MPInfoCon02_title">
					<span class="MPTable_title">고객정보 수정</span>
				</div>
				<div id="MPInfoCon02_table">
					<table class="MPTable_style01">
						<tr>
							<td class="MPInfoCon2_td01">이름</td>
							<td class="MPInfoCon2_td02"><%=dto2.getName() %></td>
						</tr>
						<tr>
							<td class="MPInfoCon2_td01">아이디</td>
							<td class="MPInfoCon2_td02"><%=dto2.getId() %></td>
						</tr>
						<tr>
							<td class="MPInfoCon2_td01">생년월일</td>
							<td class="MPInfoCon2_td02"><%=dto2.getBirthday01() %></td>
						</tr>
						<tr>
							<td class="MPInfoCon2_td01">이메일</td>
							<td class="MPInfoCon2_td02"><%=dto2.getEmail() %></td>
						</tr>
						<tr>
							<td class="MPInfoCon2_td01">휴대폰</td>
							<td class="MPInfoCon2_td02"><%=dto2.getPhone01() %> - <%=dto2.getPhone02() %></td>
						</tr>
						<tr>
							<td class="MPInfoCon2_td01">주소</td>
							<td class="MPInfoCon2_td02"><%=dto2.getAddr01() %></td>
						</tr>
					</table>
				</div>
				<div id="MPInfoCon02_warnig">
					<span class="MPInfoCon02_warn">
						*패스워드 변경의 경우 Saladream의 고객상담실(080-0000-000)으로 문의 부탁드립니다.
					</span>
				</div>
				<div id="MPInfoCon02_button">
					<!-- 버튼을 누르면 모달장으로 수정할 수 있도록한다. -->
					<span class="MPInfoCon02_btn">
						<a href="#ex1" rel="modal:open">수정하기</a>
					</span>
				</div>
				<div id="ex1" class="modal">
					<div id="MPInfoCon02_title">
					<span class="MPTable_title">고객정보 수정</span>
					</div>
				<form action="updateInformation.jsp" method="post" name="upFrm" accept-charset="utf-8">
					<div id="MPInfoCon02_table">
						<input type="hidden" name="oriid" value="<%=sid%>">
						<table class="MPTable_style01">
							<tr>
								<td class="MPInfoCon2_td01">이름</td>
								<td class="MPInfoCon2_td02"><input type="text" value="<%=dto2.getName() %>"  name="name"></td>
							</tr>
							<tr>
								<td class="MPInfoCon2_td01">아이디</td>
								<td class="MPInfoCon2_td02"><input type="text" value="<%=dto2.getId() %>"  name="id"></td>
							</tr>
							<tr>
								<td class="MPInfoCon2_td01">생년월일</td>
								<td class="MPInfoCon2_td02">
								<input type="text" id="birthday01" name="birthday01" title="birthday01" maxlength="4" placeholder="년(ex.1900)">
								<select id="birthday02" name="birthday02">
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
								<select id="birthday03" name="birthday03">
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
								</td>
							</tr>
							<tr>
								<td class="MPInfoCon2_td01">이메일</td>
								<td class="MPInfoCon2_td02"><input type="text" value="<%=dto2.getEmail() %>"  name="email"></td>
							</tr>
							<tr>
								<td class="MPInfoCon2_td01">휴대폰</td>
								<td class="MPInfoCon2_td02">
								<select id="phone01" name="phone01" >
									<option value="0">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
									<option value="018">018</option>
								</select>
								<input type="text" id="phone02" name="phone02"  title="phone02" maxlength="8">
								</td>
							</tr>
							<tr>
								<td class="MPInfoCon2_td01">주소</td>
								<td class="MPInfoCon2_td02"><input type="text" value="<%=dto2.getAddr01() %>"  name="addr01"></td>
							</tr>
						</table>
					</div>
					</form>
					<a href="#" rel="modal:close"><input type="button" value="닫기"></a>
					<a href="#"><input type="button" onclick="checkJoinfield()" value="수정"></a>
					<!-- <a href="#" rel="modal:close"><input type="button" value="닫기"></a> -->
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
				<span class="mpOrdCon01_text">1:1 문의 내역을 확인하는 곳입니다.</span>
			</div>
			<div id="MPInquiry_Con02">
				<div id="MPInquiryCon02_title">
					<span class="MPTable_title">1:1문의 내역</span>
				</div>
				<div id="MPInquiryCon02_table">
					<table class="MPTable_style01">
						<tr>
							<td class="MPInquiryCon2_td01">문의내용</td>
							<td class="MPInquiryCon2_td02">작성일</td>
							<td class="MPInquiryCon2_td03">처리현황</td>
						</tr>
						<!-- <tr>
							<td class="MPInquiryCon2_td04">[임시]</td>
							<td class="MPInquiryCon2_td05">[임시]</td>
							<td class="MPInquiryCon2_td06">[임시]</td>
						</tr> -->
						<tr>
							<td class="MPInquiryCon2_td07" colspan="3">문의 내역이 없습니다.</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="MPInquiry_Con03">
				<div id="MPInquiryCon02_title">
					<span class="MPTable_title">자주하는 질문</span>
				</div>
				<div id="MPInquiryCon02_table">
					<table class="MPTable_style01">
						<tr>
							<td class="MPInquiryCon2_td01">문의내용</td>
							<td class="MPInquiryCon2_td02">답변자</td>
							<td class="MPInquiryCon2_td03">답변</td>
						</tr>
						<tr>
							<td class="MPInquiryCon2_td04">Q. 주문한 상품을 취소하고 싶습니다.</td>
							<td class="MPInquiryCon2_td05">관리자</td>
							<td class="MPInquiryCon2_td06"><a href="#ex2" rel="modal:open">답변보기</a></td>
						</tr>
						<tr>
							<td class="MPInquiryCon2_td04">Q. 상품을 받았는데 반품을 하고 싶습니다.</td>
							<td class="MPInquiryCon2_td05">관리자</td>
							<td class="MPInquiryCon2_td06"><a href="#ex3" rel="modal:open">답변보기</a></td>
						</tr>
						<tr>
							<td class="MPInquiryCon2_td04">Q. classic의 샐러드의 재입고는 언제 되나요?</td>
							<td class="MPInquiryCon2_td05">관리자</td>
							<td class="MPInquiryCon2_td06"><a href="#ex4" rel="modal:open">답변보기</a></td>
						</tr>
						<tr>
							<td class="MPInquiryCon2_td04">Q. custom은 스텝별로 한가지만 선택가능한가요?</td>
							<td class="MPInquiryCon2_td05">관리자</td>
							<td class="MPInquiryCon2_td06"><a href="#ex5" rel="modal:open">답변보기</a></td>
						</tr>
					</table>
					<div id="ex2" class="modal">
						<div id="MPInfoCon02_titleQ">
							<span class="MPTable_QuestionMark">Q.</span>
							<span class="MPTable_Question"> 주문한 상품을 취소하고 싶습니다.</span>
						</div>
						<div>
							<span class="MPTable_answerMark">A.</span>
							<span class="MPTable_answer"> 현재 고객님께서 결제하신 상품의 배송상태에 따라 다릅니다.<br>
							배송상태를 확인하시거나 고객센터(080-000-0000)로 문의 바랍니다.</span>
						</div>
						<a href="#" rel="modal:close"><input type="button" value="닫기"></a>
					</div>
					<div id="ex3" class="modal">
						<div id="MPInfoCon02_titleQ">
							<span class="MPTable_QuestionMark">Q.</span>
							<span class="MPTable_Question"> 상품을 받았는데 반품을 하고 싶습니다.</span>
						</div>
						<div>
							<span class="MPTable_answerMark">A.</span>
							<span class="MPTable_answer"> 고객님께 발송한 상품의 상태에 따라 다릅니다. <br>
							고객센터(080-000-0000)로 문의 바랍니다.</span>
						</div>
						<a href="#" rel="modal:close"><input type="button" value="닫기"></a>
					</div>
					<div id="ex4" class="modal">
						<div id="MPInfoCon02_titleQ">
							<span class="MPTable_QuestionMark">Q.</span>
							<span class="MPTable_Question"> classic의 샐러드의 재입고는 언제 되나요?</span>
						</div>
						<div>
							<span class="MPTable_answerMark">A.</span>
							<span class="MPTable_answer"> 저희 Saladream은 이틀에 한번씩 신선한 야채를 제공받고있습니다. <br>
							받은 야채들과 식품들은 가공하여 바로 다음날 내놓는 시스템으로 <br>
							2일에 한번씩 재 입고 됨을 알려드립니다.</span>
						</div>
						<a href="#" rel="modal:close"><input type="button" value="닫기"></a>
					</div>
					<div id="ex5" class="modal">
						<div id="MPInfoCon02_titleQ">
							<span class="MPTable_QuestionMark">Q.</span>
							<span class="MPTable_Question"> custom은 스텝별로 한가지만 선택가능한가요?</span>
						</div>
						<div>
							<span class="MPTable_answerMark">A.</span>
							<span class="MPTable_answer"> 커스터마이징 시스템의 경우 step01을 제외한 <br>
							step들의 다수 선택을 할 수 있도록 개발 중에 있습니다. <br>
							죄송합니다.</span>
						</div>
						<a href="#" rel="modal:close"><input type="button" value="닫기"></a>
					</div>
					
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		<!-- <div id="mypage_button" class="mypage_bt">
			<a href="#">
				<input type="button" title="내 주문내역" alt="내 주문내역" value="ORDER" class="btn_mypage01" id="log.mypage">
			</a>
			<a href="#">
				<input type="button" title="회원정보 수정" alt="회원정보 수정" value="MY INFO" class="btn_mypage02" id="log.mypage">
			</a>
			<a href="logout.jsp">
			<input type="button" title="로그아웃" alt="로그아웃" value="LOG OUT" class="btn_mypage03" id="log.mypage">
			</a>
		</div> -->
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>