<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="saladream.MaterialDTO"%>
<%@page import="saladream.MaterialDAO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Custom_커스터마이징페이지</title>
	<link href="../css/modal_style.css" rel="stylesheet" type="text/css">
	
	<link href="../css/custom_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
	<script src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#re_custom').click(function(){
			$('.step01_con01 input[type=radio]').prop('checked', false);
			$('.step01_con01 img').attr('style', 'outline: ""');
		});
		
		$('#log_custom').click(function(){
			document.customForm.submit();
		});
	});
	
	</script>
	
</head>
<body>
	<%
		MaterialDAO mDao = new MaterialDAO();
	
		MaterialDTO baseMDto = new MaterialDTO();
		baseMDto.setmType("base");
		MaterialDTO topMDto1 = new MaterialDTO();
		topMDto1.setmType("topping1");
		MaterialDTO topMDto2 = new MaterialDTO();
		topMDto2.setmType("topping2");
		MaterialDTO topMDto3 = new MaterialDTO();
		topMDto3.setmType("topping3");
		
		MaterialDTO cheeseMDto = new MaterialDTO();
		cheeseMDto.setmType("cheese");
		MaterialDTO sourceMDto = new MaterialDTO();
		sourceMDto.setmType("source");
		
		List<MaterialDTO> baseList = mDao.select(baseMDto);
		List<MaterialDTO> topList1 = mDao.select(topMDto1);		
		List<MaterialDTO> topList2 = mDao.select(topMDto2);		
		List<MaterialDTO> topList3 = mDao.select(topMDto3);		
		List<MaterialDTO> cheeseList = mDao.select(cheeseMDto);		
		List<MaterialDTO> sourceList = mDao.select(sourceMDto);		
	%> 

	<div id="custom_wrap">
	<!-- custom_wrap의 크기 => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		<form action="./customOrder.jsp" method="POST" name="customForm">
		<div id="custom_keyimg">
			<!-- keyimage부분입니다. -->
			<!-- custom_keyimage부분입니다.
				 연두색 박스의 믈래식 샐러드 버튼까지 포함 -> 높이 435(3)px;-->
			<div id="custom_key_button">
				<!-- 연두색 박스 크기 : width: 432px, height: 53px -->
				<img alt="" src="../cus_img/custom_key_button.png">
			</div>
		</div>
		<div id="custom_content_wrap">
		<!-- width:1000px, height:2120px -->
			<div id="custom_word01">
			<!-- "내 마음대로 ~ 만들어 보세요"부분 -> 높이 100px -->
			<!-- 컨텐츠의 크기는 width:570px height:100px -->
				<img alt="Custom_intro" src="../cus_img/custom_word.png">
			</div>
			
			<div id="custom_menubar" class="menubar_text">
			<!-- 커스텀 메뉴바 -->
			<!-- width:1000px, height:55px -->
				<ul>
					<li><img alt="" src="../cus_img/custom_menu_rec.png"></li>
					<li class="custom_mtext01"><a href="#">베이스</a></li>
					<li class="custom_mtext01"><a href="#">채소</a></li>
					<li class="custom_mtext01"><a href="#">고기/생선</a></li>
					<li class="custom_mtext01"><a href="#">토핑</a></li>
					<li class="custom_mtext01"><a href="#">치즈</a></li>
					<li class="custom_mtext01"><a href="#">드레싱</a></li>
					<li><img alt="" src="../cus_img/custom_menu_rec.png"></li>
				</ul>
			</div>
			
			<div id="custom_step01">
			<!--step01.베이스  -->
			<!-- width:1000px(840px), height:271px -->
			<!-- 아이템 하나 크기 -> 115px x 115px -->
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 1.<br>베이스를 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
					
						<%for(MaterialDTO mDto : baseList) { %>
				
							<label>
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>">
							<img alt="<%=mDto.getmName() %>" src="../cus_img/base/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							
							</label>
					
						<%} %>
				
				</div>
			
				
			</div>
			<div id="custom_step02">
			<!--step02.첫번째 토핑  -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 2.<br>첫번째 토핑을 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
					
						<%for(MaterialDTO mDto : topList1) { %>
					
							<label>
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>">
							<img alt="<%=mDto.getmName() %>" src="../cus_img/topping1/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							</label>
					
						<%} %>
				
				</div>
				
			</div>
			<div id="custom_step03">
			<!--step03.두번째 토핑 -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 3.<br>두번째 토핑을 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
			
						<%for(MaterialDTO mDto : topList2) { %>
						
							<label>
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>">
							<img alt="<%=mDto.getmName() %>" src="../cus_img/topping2/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							</label>
					
						<%} %>
				
				</div>
				
			</div>
			<div id="custom_step04">
			<!--step04.그 외 토핑  -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 4.<br>그 외 토핑을 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
				
						<%for(MaterialDTO mDto : topList3) { %>
						
							<label>
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>">
							<img alt="<%=mDto.getmName() %>" src="../cus_img/topping3/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							</label>
					
						<%} %>
			
				</div>
				
			</div>
			<div id="custom_step05">
			<!--step05.치즈  -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 5.<br>치즈를 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
			
						<%for(MaterialDTO mDto : cheeseList ) { %>
				
							<label>
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>">
							<img alt="<%=mDto.getmName() %>" src="../cus_img/cheese/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							</label>
				
						<%} %>
			
				</div>
				
			</div>
			<div id="custom_step06">
			<!--step06.드레싱 -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 6.<br>소스를 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
				
						<%for(MaterialDTO mDto : sourceList  ) { %>
						
							<label>
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>">
							<img alt="<%=mDto.getmName() %>" src="../cus_img/source/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							</label>
				
						<%} %>
				
				</div>
				
			</div>
			
			<div id="custom_under">
			<!-- 밑에 버튼들 -->
			<!-- width:1000px, height:271px -->
			
				<div id="custom_button" class="custom_bt">
					<!-- 다시 선택하기, 구매하기 -->
						<input type="button" title="다시 선택" alt="다시 선택" value="다시 선택" class="btn_custom01" id="re_custom">
						<!-- Trigger/Open The Modal -->
						<input type="button" title="구매하기" alt="구매하기" value="구매하기" class="btn_custom02" id="log_custom">
						
						
				</div>
			
			</div>
			
			
		</div>
			<input type="hidden" name="caseNo" value="1">
		</form>
		
		
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>