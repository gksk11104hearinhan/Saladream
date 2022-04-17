<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="saladream.MaterialDTO"%>
<%@page import="saladream.MaterialDAO"%>
<%@page import="saladream.SelCustomDAO"%>
<%@page import="saladream.SelCustomDTO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Custom_커스터마이징페이지</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	<link href="../css/custom_style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="../css/checkbox_style.css">
	
	<script src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#re_custom').click(function(){
			$('.step01_con01 input[type=radio]').prop('checked', false);
			$('.step01_con01 img').attr('style', 'outline: ""');
		});
		
		$('#log_custom').click(function(){
			document.customForm.submit();
		})
	});
	
	/* function popupOpen(){
		var popUrl = "customPop.jsp";	//팝업창에 출력될 페이지 URL
		var popOption = "width=623, height=1000,";    //팝업창 옵션(optoin) resizable=no, scrollbars=no, status=no;
			window.open(popUrl,"",popOption);
	} */
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
	
	<jsp:include page="fixtop.jsp"></jsp:include>
	
	<div id="banner" class="banner">
		<div id="down_wrap">
		<div class="down">
		    <div class="nav03_text03">
		      	내가 만드는 나만의~
		     </div>
		    <div class="nav03_text01">
		    	<span class="NText01_con01">커스텀</span>
		    	<span class="NText01_con02"> 샐러드</span>
		    </div>
		    <div class="nav03_text02">
		     	'내 마음댜로 만드는 커스텀 샐러드!'
		    </div>
		    <div class="nav03_text02">
		    	좋아하는 취향대로 샐러드를 만들어보세요
		    </div>
		</div>
		</div>
	</div>
	
	<div id="custom_nav">
		<span class="CUSnav_text1">STEP</span>
		<span class="CUSnav_text2">|</span>
		<span class="CUSnav_text1"><a href="#custom_step01">베이스</a></span>
		<span class="CUSnav_text2">|</span>
		<span class="CUSnav_text1"><a href="#custom_step02">야채</a></span>
		<span class="CUSnav_text2">|</span>
		<span class="CUSnav_text1"><a href="#custom_step03">고기/생선</a></span>
		<span class="CUSnav_text2">|</span>
		<span class="CUSnav_text1"><a href="#custom_step04">토핑</a></span>
		<span class="CUSnav_text2">|</span>
		<span class="CUSnav_text1"><a href="#custom_step05">치즈</a></span>
		<span class="CUSnav_text2">|</span>
		<span class="CUSnav_text1"><a href="#custom_step06">소스</a></span>
	</div>

	<!-- <div id="custom_keyimg">
		keyimage부분입니다.
	</div> -->
	

	<div id="custom_wrap">
	<!-- custom_wrap의 크기 => width=1000,height=? -->
	
	<div id="custom_route">
		HOME &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp; CUSTOM &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp; STEP
	</div>
	
		<form action="./customOrder.jsp" method="POST" name="customForm">
		<div id="custom_content_wrap">
		<!-- width:1000px, height:2120px -->
			
			<!-- <div id="custom_nav">
				<span class="CUSnav_text1">STEP</span>
				<span class="CUSnav_text2">|</span>
				<span class="CUSnav_text1"><a href="#custom_step01">베이스</a></span>
				<span class="CUSnav_text2">|</span>
				<span class="CUSnav_text1"><a href="#custom_step02">야채</a></span>
				<span class="CUSnav_text2">|</span>
				<span class="CUSnav_text1"><a href="#custom_step03">고기/생선</a></span>
				<span class="CUSnav_text2">|</span>
				<span class="CUSnav_text1"><a href="#custom_step04">토핑</a></span>
				<span class="CUSnav_text2">|</span>
				<span class="CUSnav_text1"><a href="#custom_step05">치즈</a></span>
				<span class="CUSnav_text2">|</span>
				<span class="CUSnav_text1"><a href="#custom_step06">소스</a></span>
			</div> -->
			
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
					<div class="container">
					<div class="row">
					<div class="col">
					
						<%for(MaterialDTO mDto : baseList) { %>
						
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>" class="cusRadioStyle"><br>
							<img alt="<%=mDto.getmName() %>" src="../cus_img/base/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							<div class="cusradio01"><%=mDto.getmName() %></div>
							<div id="cusradiotext01">
								<span class="radiotext01"><%=mDto.getmInfo() %></span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">9kcal / 30g</span>
							</div>
							
						</label>
						
						<%} %>
						
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="base" value="0" class="cusRadioStyle"><br>
							<img alt="선택안함" src="../cus_img/deselect.png" id="0">
							<div class="cusradio01">선택하지 않음</div>
							<div id="cusradiotext01">
								<span class="radiotext01">선택하지 않습니다.</span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">0cal / 0g</span>
							</div>
							
						</label>
						
					</div>
					</div>
					</div>
				</div>
				
			</div>
			<div id="custom_step02">
			<!--step02.첫번째 토핑  -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 2.<br>야채를 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
					<div class="container">
					<div class="row">
					<div class="col">
					
						<%for(MaterialDTO mDto : topList1) { %>
						
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>" class="cusRadioStyle"><br>
							<img alt="<%=mDto.getmName() %>" src="../cus_img/topping1/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							<div class="cusradio01"><%=mDto.getmName() %></div>
							<div id="cusradiotext01">
								<span class="radiotext01"><%=mDto.getmInfo() %></span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">9kcal / 30g</span>
							</div>
						
						</label>
						
						<%} %>
						
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="topping1" value="0" class="cusRadioStyle"><br>
							<img alt="선택안함" src="../cus_img/deselect.png" id="0">
							<div class="cusradio01">선택하지 않음</div>
							<div id="cusradiotext01">
								<span class="radiotext01">선택하지 않습니다.</span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">0cal / 0g</span>
							</div>
							
						</label>
						
					</div>
					</div>
					</div>
				</div>
				
			</div>
			<div id="custom_step03">
			<!--step03.두번째 토핑 -->
			<!-- width:1000px, height:271px -->
			
				<div id="cus_step01_text">
					<!-- 미니로고, Step01, 문구 -->
					<ol>
						<li><img alt="" src="../cus_img/custom_mini_logo.png"></li>
						<li class="step01_text01">STEP 3.<br>고기/생선을 선택하세요</li>
					</ol>
				</div>
				<div id="cus_step01_con">
					<!-- 버튼 , 재료 -->
					<div class="container">
					<div class="row">
					<div class="col">
					
						<%for(MaterialDTO mDto : topList2) { %>
						
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>" class="cusRadioStyle"><br>
							<img alt="<%=mDto.getmName() %>" src="../cus_img/topping2/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							<div class="cusradio01"><%=mDto.getmName() %></div>
							<div id="cusradiotext01">
								<span class="radiotext01"><%=mDto.getmInfo() %></span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">9kcal / 30g</span>
							</div>
						</label>
				
						<%} %>
						
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="topping2" value="0" class="cusRadioStyle"><br>
							<img alt="선택안함" src="../cus_img/deselect.png" id="0">
							<div class="cusradio01">선택하지 않음</div>
							<div id="cusradiotext01">
								<span class="radiotext01">선택하지 않습니다.</span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">0cal / 0g</span>
							</div>
							
						</label>
						
					</div>
					</div>
					</div>
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
					<div class="container">
					<div class="row">
					<div class="col">				
						<%for(MaterialDTO mDto : topList3) { %>
			
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>" class="cusRadioStyle"><br>
							<img alt="<%=mDto.getmName() %>" src="../cus_img/topping3/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							<div class="cusradio01"><%=mDto.getmName() %></div>
							<div id="cusradiotext01">
								<span class="radiotext01"><%=mDto.getmInfo() %></span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">9kcal / 30g</span>
							</div>
						</label>
					
						<%} %>
						
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="topping3" value="0" class="cusRadioStyle"><br>
							<img alt="선택안함" src="../cus_img/deselect.png" id="0">
							<div class="cusradio01">선택하지 않음</div>
							<div id="cusradiotext01">
								<span class="radiotext01">선택하지 않습니다.</span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">0cal / 0g</span>
							</div>
							
						</label>
					</div>
					</div>
					</div>	
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
					<div class="container">
					<div class="row">
					<div class="col">	
						
						<%for(MaterialDTO mDto : cheeseList ) { %>
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>" class="cusRadioStyle"><br>
							<img alt="<%=mDto.getmName() %>" src="../cus_img/cheese/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							<div class="cusradio01"><%=mDto.getmName() %></div>
							<div id="cusradiotext01">
								<span class="radiotext01"><%=mDto.getmInfo() %></span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">9kcal / 30g</span>
							</div>
						</label>
						<%} %>
						
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="cheese" value="0" class="cusRadioStyle"><br>
							<img alt="선택안함" src="../cus_img/deselect.png" id="0">
							<div class="cusradio01">선택하지 않음</div>
							<div id="cusradiotext01">
								<span class="radiotext01">선택하지 않습니다.</span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">0cal / 0g</span>
							</div>
							
						</label>
						
					</div>
					</div>
					</div>
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
					<div class="container">
					<div class="row">
					<div class="col">	
										
						<%for(MaterialDTO mDto : sourceList  ) { %>
				
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmNo()%>" class="cusRadioStyle"><br>
							<img alt="<%=mDto.getmName() %>" src="../cus_img/source/<%=mDto.getmImage() %>.png" id="<%=mDto.getmNo()%>">
							<div class="cusradio01"><%=mDto.getmName() %></div>
							<div id="cusradiotext01">
								<span class="radiotext01"><%=mDto.getmInfo() %></span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">9kcal / 30g</span>
							</div>
						</label>
						
						<%} %>
						
						<label id="step01_con01" class="btn btn-light">
							<input type="radio" name="source" value="0" class="cusRadioStyle"><br>
							<img alt="선택안함" src="../cus_img/deselect.png" id="0">
							<div class="cusradio01">선택하지 않음</div>
							<div id="cusradiotext01">
								<span class="radiotext01">선택하지 않습니다.</span>
							</div>
							<div class="cusradio01">
								<span class="radiotext02">0cal / 0g</span>
							</div>
							
						</label>
						
					</div>
					</div>
					</div>
				</div>
				
			</div>
			
			<div id="custom_under">
			<!-- 밑에 버튼들 -->
			<!-- width:1000px, height:271px -->
			
				<div id="custom_button" class="custom_bt">
					<!-- 다시 선택하기, 구매하기 -->
					<input type="button" title="다시 선택" alt="다시 선택" value="다시 선택" class="btn_custom01" id="re_custom">
					<input type="button" title="구매하기" alt="구매하기" value="구매하기" class="btn_custom02" id="log_custom">
						<!-- <input type="button" title="다시 선택" alt="다시 선택" value="다시 선택" class="btn_custom01" id="re_custom">
						<input type="button" title="구매하기" alt="구매하기" value="구매하기" class="btn_custom02" onclick="javascript:popupOpen();"> -->
				</div>
			
			</div>
			
			
		</div>
			<input type="hidden" name="caseNo" value="1">
		</form>
		
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>