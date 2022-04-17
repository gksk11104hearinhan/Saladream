<%@page import="saladream.MemberDTO"%>
<%@page import="saladream.MemberDAO"%>
<%@page import="saladream.ProductDTO"%>
<%@page import="saladream.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    	//인코딩, 글씨 깨지는것 방지
    	request.setCharacterEncoding("EUC-KR");
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>directOrder_즉시주문</title>
	<link href="../css/directOrd_style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function directOrd()        
		{
			var frm = document.directOrdFrm;
			frm.action = "directOrderOK.jsp";
			frm.submit();
		}
	
	</script>
</head>
<body>

<jsp:include page="fixtop.jsp"></jsp:include>

<form action="" method="post" name="directOrdFrm" accept-charset="utf-8">
	<div id="directOrd_wrap">
	<!-- viewPro_wrap의 크기 => width=1000,height=? -->
		
		<!-- <img alt="" src="../img/topDrop.png"> -->
		
		<div id="key">
			<div class="key_con01">
				Classic 주문서
			</div>
			<div class="key_con02">
				주문하실 상품 및 수량을 정확하게 확인해주세요.
			</div>
		</div>
		
		<div id="directOrd_content">
			<!--즉시주문 페이지 입니다. -->
			
			<jsp:useBean id="dto" class="saladream.ProductDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="dto"/>
			
			<%
				System.out.print(dto);
				ProductDAO dao = new ProductDAO();
				ProductDTO dto2 = dao.select(dto);

				if(request.getParameter("option03") == null){
					response.sendRedirect("./classic.jsp");
					return;
				}
				
				if(request.getParameter("pno") == null){
					response.sendRedirect("./classic.jsp");
					return;
				}
				if(request.getParameter("option03").equals("0")){
					response.sendRedirect("./classicViewProduct.jsp?pno="+request.getParameter("pno"));
					return;
				}
				
				String pno = request.getParameter("pno"); //상세조회하고자하는 상ㅇ품번호를 받아온다.
				int cnt = Integer.parseInt(request.getParameter("option03"));
			%>
			<div id="directOrd_con">
				<input type="hidden" value="<%=pno%>" name="pno">
				<div id="directOrd_con01">
				
				<div id="Otable01_title01">
					상품 정보
				</div>
				
				<table class="infoBox_table">
		 			<tr>
		 				<td class="Otable_td04">상품 이미지</td>
		 				<td class="Otable_td01">상품명</td>
						<td class="Otable_td02">수량</td>
						<td class="Otable_td03">상품금액</td>
		 			</tr>
		 			
		 			<tr>
		 				<td class="Otable_td08"><img alt="" src="../p_img/<%= dto2.getPdetailimage() %>.png" width="100px" height="100px"></td>
		 				<td class="Otable_td05">[샐러드림] <%= dto2.getPname() %></td>
						<td class="Otable_td06">
							<%-- <input type="text" value="<%=cnt  %>" name="oproductNum" readonly="readonly"> --%>
							 <%=cnt  %> 개
						</td>
						<td class="Otable_td07"><%=dto2.getPprice() %></td>
		 			</tr>
		 		
		 		</table>
				
			</div>
			
			<div id="clear"></div>
			
			<div id="directOrd_con03">
				
				<div id="order_infoBox">
							<div>
								<div id="OinfoBox01">
									<div id="OinfoBox01_title">
										주문자 정보
									</div>
									<table class="infoBox_table">
										<tr>
											<td class="infoBox01_td01">
												<span class="infoBox01_subtitle">이름**</span>
											</td>
											<td class="infoBox02_td01">
												<input type="text" name="ordrecv" class="int">
												
											</td>
										</tr>
										<tr>
											<td class="infoBox01_td02">
												<span class="infoBox01_subtitle">연락처**</span>
											</td>
											<td class="infoBox02_td02">
												<input type="text" name="ordrecvtel01">
												<input type="text" name="ordrecvtel02">
											</td>
										</tr>
										<tr>
											<td class="infoBox01_td03">
												<span class="infoBox01_subtitle">이메일*</span> <!-- DB구축 요망 -->
											</td>
											<td class="infoBox02_td03">
												<input type="text"> @
												<input type="text">
											</td>
										</tr>
									</table>
								</div>
								<div id="OinfoBox02">
									<div id="OinfoBox02_title">
										배송 정보
									</div>
									<table class="infoBox_table">
										<tr>
											<td class="infoBox01_td01">
												<span class="infoBox01_subtitle">이름**</span>
											</td>
											<td class="infoBox02_td01">
												<input type="text">
											</td><!-- 위의 주문자 정보에서 이미 DB로 넘어감 -->
										</tr>
										<tr>
											<td class="infoBox01_td02">
												<span class="infoBox01_subtitle">연락처**</span>
											</td>
											<td class="infoBox02_td02">
												<input type="text"><!-- 위의 주문자 정보에서 이미 DB로 넘어감 -->
												<input type="text">
											</td><!-- 위의 주문자 정보에서 이미 DB로 넘어감 -->
										</tr>
										<tr>
											<td class="infoBox01_td03">
												<span class="infoBox01_subtitle">주소**</span>
											</td>
											<td class="infoBox02_td03">
												<input type="text" value="우편번호">
												<span>우편번호</span>
												<input type="text" name="ordrecvaddr">
											</td>
										</tr>
										<tr>
											<td class="infoBox01_td04">
												<span class="infoBox01_subtitle">배송시 요청사항</span>
											</td>
											<td class="infoBox02_td04">
												<textarea rows="5" cols="70"></textarea>
												<br>
												<small>배송종료 후 모든 정보는 삭제됩니다.</small>
											</td>
										</tr>
										<tr>
											<td class="infoBox01_td01">
												<span class="infoBox01_subtitle">공동현관 출입 방법</span>
											</td>
											<td><input type="text"></td>
										</tr>
										<tr>
											<td class="infoBox01_td03">
												<span class="infoBox01_subtitle">공동현관 비밀 번호</span>
											</td>
											<td><input type="text"></td>
										</tr>
									</table>
								</div>
								<div id="OinfoBox03">
									<div id="OinfoBox03_title">
										쿠폰/적립금 정보
									</div>
									<table class="infoBox_table">
										<tr>
											<td class="infoBox01_td01">
												<span class="infoBox01_subtitle">쿠폰 적용</span>
											</td>
											<td>
												<select>
													<option>적용할 쿠폰을 선택해주세요.</option>
													<option>쿠폰01</option>
													<option>쿠폰02</option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="infoBox01_td03">
												<span class="infoBox01_subtitle">적립금 사용</span>
											</td>
											<td>
												<input type="text" placeholder="0"> 원 
												<input type="checkbox"> 모두사용 <br>
												<small>보유 적립금이 없습니다.</small> <!-- 나중에 연결 -->
											</td>
										</tr>
									</table>
								</div>
								
								<div id="OinfoBox04">
									<div id="OinfoBox04_title">
										결제 정보
									</div>
									<table class="infoBox_table">
										<tr>
											<td class="infoBox01_td01">
												<span class="infoBox01_subtitle">입금은행**</span>
											</td>
											<td><input type="text" name="obank"></td>
									
										</tr>
										<tr>
											<td class="infoBox01_td02">
												<span class="infoBox01_subtitle">카드번호**</span>
											</td>
											<td><input type="text" name="ocardNum"></td>
									
										</tr>
										<tr>
											<td class="infoBox01_td03">
												<span class="infoBox01_subtitle">카드비밀번호**</span>
											</td>
											<td><input type="text" name="ocardPassword"></td>
										</tr>
									</table>
								</div>
								
								<div id="OinfoBox05">
									<div id="OinfoBox05_title">
										주문자 동의
									</div>
									<hr class="OinfoBox05_hr" color="#82cf2c" size="0">
									<input type="checkbox">
									<span class="OinfoBox05_text00">결제 진행 필수 동의</span>
									<div class="OinfoBox05_con01">
										<span class="OinfoBox05_text01">
											개인정보수집/이용 동의
										</span>
										<span class="OinfoBox05_text02">
											(필수)
										</span>
										<a>
											<span class="OinfoBox05_text03">약관확인></span>
										</a>
									</div>
									<div class="OinfoBox05_con02">
										<span class="OinfoBox05_text01">
											결제 대행 서비스 약관 동의
										</span>
										<span class="OinfoBox05_text02">
											(필수)
										</span>
										<a>
											<span class="OinfoBox05_text03">약관확인></span>
										</a>
									</div>
								</div>
							</div>
							
							<!-- <div class="cOcon03_text02">
								<a> <input type="submit" title="주문확인" alt="주문확인" value="주문확인">
								</a>
							</div> -->
					</div>
				
				
				
				
				<div id="OinfoBox06">
					<span class="infoBox06_text01">최종 결제 금액 </span>
					<span class="infoBox06_text02">
						<input type="hidden" value="<%= dto2.getPprice() * cnt %>" name="opay" readonly="readonly"> <%= dto2.getPprice() * cnt %>
					</span>
					<span class="infoBox06_text03"> 원</span>
				</div>
								
				<div id="OinfoBox07">
					<a>
						<input type="submit" title="주문확인" alt="주문확인" value="주문확인"
							 onclick="directOrd()" class="btn_classicVp03" id="log.classicView">
					</a>
						<input type="reset" title="주문취소" alt="주문취소" value="주문취소">
				</div>
				
			</div>
			
		</div>
		
	</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</form>

</body>
</html>