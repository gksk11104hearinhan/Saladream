<%@page import="saladream.MemberDTO"%>
<%@page import="saladream.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>주문하기</title>
	<link href="../css/order_style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:useBean id="dto" class="saladream.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	<%
	if(session.getAttribute("id") == null){
		response.sendRedirect("./login.jsp");
		return;
	}
	
	String sid = (String)session.getAttribute("id");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto2 = dao.selectOne(new MemberDTO(sid));
		String id = request.getParameter("id");
		
	%>
	
	<jsp:include page="fixtop.jsp"></jsp:include>
		
	<div id="order_wrap">
	<!-- viewPro_wrap의 크기 => width=1000,height=? -->
	
		<div id="key">
			<div class="key_con01">
				주문서 작성
			</div>
			<div class="key_con02">
				주문하실 상품 및 수량을 정확하게 확인해주세요.
			</div>
		</div>
		
		<div id="Otable01_title01">
			상품 정보
		</div>
	
	<%
		try {
			//1. con연결
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("showcCart_test.jsp의 1번 커넥터 연결 성공");
			
			//2. db연결
			String url = "jdbc:mysql://localhost:3306/saladream";
			String user = "root";
			String password = "123456";
			Connection con = DriverManager.getConnection(url, user, password);
			
			String cno01 = session.getId();
			
			String sql = "select * from cart where cno01 = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cno01);
			
			ResultSet rs = ps.executeQuery();
			
			if (!rs.next()) {
				%>
				<div id="order_table01">
					<table class="infoBox_table">
						<tr>
							<td>상품명</td>
							<td>수량</td>
							<td>상품금액</td>
							<td>삭제</td>
						</tr>
					<tr>
						<td colspan="4">장바구니가 비어있습니다.</td>
					</tr>
					</table>
				</div>
				
				<%
			} else {
				%>
			<div id="order_table01">
				<table class="infoBox_table">
					<tr>
						<td class="Otable_td01">상품명</td>
						<td class="Otable_td02">수량</td>
						<td class="Otable_td03">상품금액</td>
						<td class="Otable_td04">상품삭제</td>
					</tr>
				
				
				<%
					
					String sql5 = "select product_no01, cproductNum01 from cart where cno01 =?";
					PreparedStatement ps5 = con.prepareStatement(sql5);
					ps5.setString(1, cno01);
					
					ResultSet rs5 = ps5.executeQuery();
					int total = 0;
					
					while (rs5.next()) {
						String pno01 = rs5.getString("product_no01");
						int cproductNum01 = rs5.getInt("cproductNum01");
						
						String sql6 = "select pname, pprice from product where pno = ?";
						PreparedStatement ps6 = con.prepareStatement(sql6);
						ps6.setString(1, pno01);
						
						ResultSet rs6 = ps6.executeQuery();
						if (rs6.next()) {
							String pname = rs6.getString("pname");
							int pprice = rs6.getInt("pprice");
						
							int allPrice = pprice * cproductNum01;
							total += allPrice;
						%>
						
							<tr>
								<td class="Otable_td05"><%= pname %></td>
								<td class="Otable_td06"><%=cproductNum01 %></td>
								<td class="Otable_td07"><%=allPrice %>원</td>
								<td class="Otable_td08"><a href="./deleteCart.jsp?prdNo=<%= pno01%>">삭제</a></td>
							</tr>
						
						<%
						}
					}
					%>
						<tr>
							<td colspan="4" class="Otable_td09">
								<span class="Otable_text01">전체 주문 총액</span> 
								<span class="Otable_text02">&nbsp;&nbsp; <%=total %> 원</span>
							</td>
						</tr>
					</table>
				</div>
						
				<div id="order_infoBox">	
				<form name="form" method="POST" action="" accept-charset="utf-8">
					
					<div id="order_content">
					<input type="hidden" name="opay" value="<%=total%>">
					<input type="hidden" name="id" value="<%= id%>">
						
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
										<input type="text" name="ordrecv" value="<%=dto2.getName()%>">
										<%-- <input type="text" name="ordrecv" value="<%= dto2.getName()%>" class="int"> --%>
									</td>
								</tr>
								<tr>
									<td class="infoBox01_td02">
										<span class="infoBox01_subtitle">연락처**</span>
									</td>
									<td class="infoBox02_td02">
										<input type="text" name="ordrecvtel01" value="<%=dto2.getPhone01()%>">
										<input type="text" name="ordrecvtel02" value="<%=dto2.getPhone02()%>">
									</td>
								</tr>
								<tr>
									<td class="infoBox01_td03">
										<span class="infoBox01_subtitle">이메일*</span> <!-- DB구축 요망 -->
									</td>
									<td class="infoBox02_td03">
										<input type="text" value="<%=dto2.getEmail().split("@")[0]%>"> @
										<input type="text" value="<%=dto2.getEmail().split("@")[1]%>">
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
										<input type="text" value="<%=dto2.getName()%>">
									</td><!-- 위의 주문자 정보에서 이미 DB로 넘어감 -->
								</tr>
								<tr>
									<td class="infoBox01_td02">
										<span class="infoBox01_subtitle">연락처**</span>
									</td>
									<td class="infoBox02_td02">
										<input type="text" value="<%=dto2.getPhone01()%>"><!-- 위의 주문자 정보에서 이미 DB로 넘어감 -->
										<input type="text" value="<%=dto2.getPhone02()%>">
									</td><!-- 위의 주문자 정보에서 이미 DB로 넘어감 -->
								</tr>
								<tr>
									<td class="infoBox01_td03">
										<span class="infoBox01_subtitle">주소**</span>
									</td>
									<td class="infoBox02_td03">
										<input type="text" value="우편번호">
										<span>우편번호</span>
										<input type="text" name="ordrecvaddr" value="<%=dto2.getAddr01()%>">
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
						
						<!-- <div id="OinfoBox04">
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
						</div> -->
						
						<div id="OinfoBox05">
							<div id="OinfoBox05_title">
								주문자 동의
							</div>
							<hr class="OinfoBox05_hr" color="#82cf2c" size="2">
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
						
						<div id="OinfoBox05">
							<div id="OinfoBox05_title">
								결제 방법
							</div>
							<div class="OinfoBox05_con04">
								<table class="infoBox_table">
									<tr>
										<td class="infoBox01_td009">일반 결제하기 &nbsp;&nbsp;→</td>
										<td class="infoBox01_td010">
											<input type="submit" value="주문하기" onclick="javascript: form.action='orderOK.jsp'" class="OrderBuy01_style01">
										</td>
									</tr>
									<tr>
										<td class="infoBox01_td008">카카오페이 결제하기 &nbsp;&nbsp;→</td>
										<td class="infoBox01_td010">
											<input type="submit" value="주문하기" onclick="javascript: form.action='test01.jsp'" class="OrderBuy01_style02">
										</td>
									</tr>
									<tr>
										<td colspan="2" class="infoBox01_td007">
											<input type="reset" title="주문취소" alt="주문취소" value="주문취소" class="OrderBuy01_style03">
										</td>
									</tr>
								</table>
							</div>
						</div>
						
						<div id="clear"></div>
						
						<div id="OinfoBox06">
							<span class="infoBox06_text01">최종 결제 금액 </span>
							<span class="infoBox06_text02"> <%=total %> </span>
							<span class="infoBox06_text03"> 원</span>
						</div>
						
						<div id="OinfoBox07">
							<!-- <a>
								<input type="submit" title="주문확인" alt="주문확인" value="주문확인">
							</a>
								<input type="reset" title="주문취소" alt="주문취소" value="주문취소"> -->
						</div>
					</div>
				</form>
			</div>
					<% 
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	%>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>