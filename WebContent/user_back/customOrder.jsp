<%@page import="saladream.SelCustomDAO"%>
<%@page import="saladream.SelCustomDTO"%>
<%@page import="java.sql.*"%>
<%@page import="saladream.MaterialDTO"%>
<%@page import="saladream.MaterialDAO"%>
<%@page import="saladream.CustomCartDAO"%>
<%@page import="saladream.CustomCartDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>커스텀 주문하기</title>
	<link href="../css/viewPro_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>
	<hr>
	<%
		if (session.getAttribute("id") == null) {
			response.sendRedirect("./login.jsp");
			return;
		}

		String cno = session.getId();

		String base, topping1, topping2, topping3, cheese, source;
		int id = 0;
		
		CustomCartDAO ccDao = new CustomCartDAO();
		SelCustomDTO scDto = null;
		
		if(request.getParameter("caseNo") != null){
			
			if (request.getParameter("base") == null) {
				out.print("<script>alert('베이스를 선택하세요!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("topping1") == null) {
				out.print("<script>alert('토핑1을 선택하세요!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("topping2") == null) {
				out.print("<script>alert('토핑2을 선택하세요!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("topping3") == null) {
				out.print("<script>alert('토핑3을 선택하세요!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("cheese") == null) {
				out.print("<script>alert('치즈를 선택하세요!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("source") == null) {
				out.print("<script>alert('소스를 선택하세요!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}

			base = request.getParameter("base");
			topping1 = request.getParameter("topping1");
			topping2 = request.getParameter("topping2");
			topping3 = request.getParameter("topping3");
			cheese = request.getParameter("cheese");
			source = request.getParameter("source");

			SelCustomDAO scDao = new SelCustomDAO();

			id = scDao.selectId();

			if (id == 0) {
				return;
			}
			scDto = new SelCustomDTO();
			scDto.setScNo(id);
			scDto.setScStep01(base);
			scDto.setScStep02(topping1);
			scDto.setScStep03(topping2);
			scDto.setScStep04(topping3);
			scDto.setScStep05(cheese);
			scDto.setScStep06(source);

			scDao.insert(scDto);

			CustomCartDTO ccDto = new CustomCartDTO();
			ccDto.setCno03(cno);
			ccDto.setProduct_no03(id);

			ccDao.insert(ccDto);
		}
		else {
			scDto = ccDao.select(cno);

			if (scDto != null) {
				id = scDto.getScNo();
				base = scDto.getScStep01();
				topping1 = scDto.getScStep02();
				topping2 = scDto.getScStep03();
				topping3 = scDto.getScStep04();
				cheese = scDto.getScStep05();
				source = scDto.getScStep06();

			} 
			else {
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
		}

		MaterialDAO mDao = new MaterialDAO();

		MaterialDTO mDto = new MaterialDTO();
		mDto.setmNo(base);
		MaterialDTO baseMDto = mDao.selectOne(mDto);
		mDto.setmNo(topping1);
		MaterialDTO topMDto1 = mDao.selectOne(mDto);
		mDto.setmNo(topping2);
		MaterialDTO topMDto2 = mDao.selectOne(mDto);
		mDto.setmNo(topping3);
		MaterialDTO topMDto3 = mDao.selectOne(mDto);

		mDto.setmNo(cheese);
		MaterialDTO cheeseMDto = mDao.selectOne(mDto);
		mDto.setmNo(source);
		MaterialDTO sourceMDto = mDao.selectOne(mDto);
		
		int opay = baseMDto.getmPrice() + topMDto1.getmPrice() + topMDto2.getmPrice() + topMDto3.getmPrice() + cheeseMDto.getmPrice() + sourceMDto.getmPrice();
	%>
		 <div id="viewPro_wrap">
		 <jsp:include page="fixtop.jsp"></jsp:include>
		 <div>
		 		<table>
		 			<tr>
		 				<th>종류</th>
		 				<th>품명</th>
		 				<th>가격</th>
		 				<th>재고</th>
		 				<th>이미지</th>
		 			</tr>
		 			<tr>
		 				<td>베이스</td>
		 				<td><%=baseMDto.getmName() %></td>
		 				<td><%=baseMDto.getmPrice() %></td>
		 				<td><%=baseMDto.getmStock() %></td>
		 				<td><img src="../cus_img/base/<%=baseMDto.getmImage() %>.png"></td>
		 			</tr>
		 			<tr>
		 				<td>토핑1</td>
		 				<td><%=topMDto1.getmName() %></td>
		 				<td><%=topMDto1.getmPrice() %></td>
		 				<td><%=topMDto1.getmStock() %></td>
		 				<td><img src="../cus_img/topping1/<%=topMDto1.getmImage() %>.png"></td>
		 			</tr>
		 			<tr>
		 				<td>토핑2</td>
		 				<td><%=topMDto2.getmName() %></td>
		 				<td><%=topMDto2.getmPrice() %></td>
		 				<td><%=topMDto2.getmStock() %></td>
		 				<td><img src="../cus_img/topping2/<%=topMDto2.getmImage() %>.png"></td>
		 			</tr>
		 			<tr>
		 				<td>토핑3</td>
		 				<td><%=topMDto3.getmName() %></td>
		 				<td><%=topMDto3.getmPrice() %></td>
		 				<td><%=topMDto3.getmStock() %></td>
		 				<td><img src="../cus_img/topping3/<%=topMDto3.getmImage() %>.png"></td>
		 			</tr>
		 			<tr>
		 				<td>치즈</td>
		 				<td><%=cheeseMDto.getmName() %></td>
		 				<td><%=cheeseMDto.getmPrice() %></td>
		 				<td><%=cheeseMDto.getmStock() %></td>
		 				<td><img src="../cus_img/cheese/<%=cheeseMDto.getmImage() %>.png"></td>
		 			</tr>
		 			<tr>
		 				<td>소스</td>
		 				<td><%=sourceMDto.getmName() %></td>
		 				<td><%=sourceMDto.getmPrice() %></td>
		 				<td><%=sourceMDto.getmStock() %></td>
		 				<td><img src="../cus_img/source/<%=sourceMDto.getmImage() %>.png"></td>
		 			</tr>
		 		
		 		</table>
				<form name="form" method="POST" action="customOrderOK.jsp" accept-charset="utf-8">
					<input type="hidden" name="pno" value="<%=id%>">
					<input type="hidden" name="oproductNum" value="1">
					<input type="hidden" name="opay" value="<%=opay%>">
					<div id="viewPro_con03">
						<div>
							<div>
								<span>주문자 이름</span> 
								<input type="text" name="ordrecv">
							</div>
							<div>
								<span>주문자 주소</span> 
								<input type="text" name="ordrecvaddr">
							</div>
							<div>
								<span>주문자 연락처</span> 
								<input type="text" name="ordrecvtel01">
								<input type="text" name="ordrecvtel02">
							</div>
							<div>
								<span>입금은행</span> 
								<input type="text" name="obank">
							</div>
							<div>
								<span>카드번호</span>
								 <input type="text" name="ocardNum">
							</div>
							<div>
								<span>카드비밀번호</span> 
								<input type="text" name="ocardPassword">
							</div>
						</div>
		
						<div id="clear"></div>
						<div class="vPcon03_text02">
							<a> <input type="submit" title="주문확인" alt="주문확인" value="주문확인">
							</a>
						</div>
					</div>
		
		
				</form>
		
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
			</div>

</body>
</html>