<%@page import="saladream.SelCustomDAO"%>
<%@page import="saladream.SelCustomDTO"%>
<%@page import="java.sql.*"%>
<%@page import="saladream.MaterialDTO"%>
<%@page import="saladream.MaterialDAO"%>
<%@page import="saladream.CustomCartDAO"%>
<%@page import="saladream.CustomCartDTO"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>커스텀 주문팝업</title>
	<link href="../css/customPop_style.css" rel="stylesheet" type="text/css">
	
	<script language="javascript">
		function moveClose() {
		  opener.location.href="./customOrder.jsp";
		  self.close();
		}
	</script>
	
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
				out.print("<script>alert('야채를 선택하세요!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("topping2") == null) {
				out.print("<script>alert('고기/생선을 선택하세요!')</script>");
				out.print("<script>location.href='./custom.jsp'</script>");
				return;
			}
			if (request.getParameter("topping3") == null) {
				out.print("<script>alert('토핑을 선택하세요!')</script>");
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
				out.print("scDto가 null입니다.");
				/* out.print("<script>location.href='./custom.jsp'</script>"); */
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
		 <div id="custopmPop_wrap">
		 
		 <div id="cusPop_close">
		 	<img alt="" src="../cus_img/cusPop_x.png" onclick="self.close();">
		 </div>
		 <div id="clear"></div>
		 
		 <div id="cusPop_logo">
		 	<img alt="" src="../img/logo.png">
		 </div>
		 
		 <div id="cusPop_orderName">
		 	<span class="cPOName_text01"><%= session.getAttribute("id") %></span>
		 	<span class="cPOName_text02"> 님의 </span>
		 	<span class="cPOName_text03">Custom Salad</span>
		 	<span class="cPOName_text02"> 입니다</span>
		 </div>
		 
		 <div id="cusPop_explain">
		 	*주문서를 확인해 주세요*
		 </div>
		 
		 <div id="cusPop_date">
		 <%= sf.format(nowTime) %>
		 </div>
		 <div id="clear"></div>
		 
		 <div id="cusPop_content">
		 		<table class="cusPop_table">
		 			<tr>
		 				<td class="Cpop_td01">단계</td>
		 				<td class="Cpop_td02">선택사항</td>
		 				<td class="Cpop_td03">수량</td>
		 				<td class="Cpop_td04">가격</td>
		 			</tr>
		 			<tr>
		 				<td class="Cpop2_td01">Base</td>
		 				<td class="Cpop2_td02"><%=baseMDto.getmName() %></td>
		 				<td class="Cpop2_td03"><%=baseMDto.getmStock() %></td>
		 				<td class="Cpop2_td04"><%=baseMDto.getmPrice() %></td>
		 			</tr>
		 			<tr>
		 				<td class="Cpop2_td01">Veggie</td>
		 				<td class="Cpop2_td02"><%=topMDto1.getmName() %></td>
		 				<td class="Cpop2_td03"><%=topMDto1.getmStock() %></td>
		 				<td class="Cpop2_td04">+<%=topMDto1.getmPrice() %></td>
		 			</tr>
		 			<tr>
		 				<td class="Cpop2_td01">Meat</td>
		 				<td class="Cpop2_td02"><%=topMDto2.getmName() %></td>
		 				<td class="Cpop2_td03"><%=topMDto2.getmStock() %></td>
		 				<td class="Cpop2_td04">+<%=topMDto2.getmPrice() %></td>
		 			</tr>
		 			<tr>
		 				<td class="Cpop2_td01">Topping</td>
		 				<td class="Cpop2_td02"><%=topMDto3.getmName() %></td>
		 				<td class="Cpop2_td03"><%=topMDto3.getmStock() %></td>
		 				<td class="Cpop2_td04">+<%=topMDto3.getmPrice() %></td>
		 			</tr>
		 			<tr>
		 				<td class="Cpop2_td01">Cheese</td>
		 				<td class="Cpop2_td02"><%=cheeseMDto.getmName() %></td>
		 				<td class="Cpop2_td03"><%=cheeseMDto.getmStock() %></td>
		 				<td class="Cpop2_td04">+<%=cheeseMDto.getmPrice() %></td>
		 			</tr>
		 			<tr>
		 				<td class="Cpop2_td01">Source</td>
		 				<td class="Cpop2_td02"><%=sourceMDto.getmName() %></td>
		 				<td class="Cpop2_td03"><%=sourceMDto.getmStock() %></td>
		 				<td class="Cpop2_td04">+<%=sourceMDto.getmPrice() %></td>
		 			</tr>
		 		
		 		</table>
		 		
		 		<div id="cusPop_total">
		 			<span class="CpopTotal_text01">Total</span>
		 			<span class="CpopTotal_text02"> (단위: 원)</span>
		 			<span class="CpopTotal_text03"><%=opay%></span>
		 		</div>
		 		
		
			</div>
			
			<div id="cusPop_under">
				<span class="cP_but01" value="다시선택하기" onclick="self.close();">
					다시 선택
				</span>
				<!-- <span class="cP_but02" value="장바구니 담기" onclick="">장바구니 담기</span> -->
				<span class="cP_but03" value="결제하기" onclick="moveClose();">결제하기</span>
			<!-- 
				<input type="button" class="cP_but01" value="다시선택하기" onclick="self.close();"/>
				<input type="button" class="cP_but02" value="장바구니 담기" onclick="">
				<input type="button" class="cP_but03" value="결제하기" onclick="moveClose();" /> -->
			</div>
			
			</div>
			
			

</body>
</html>