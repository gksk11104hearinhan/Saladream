<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="saladream.MaterialDTO"%>
<%@page import="saladream.MaterialDAO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Custom_커스터마이징페이지</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/checkbox_style.css">
		<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
		<link href="../css/custom_style2.css" rel="stylesheet" type="text/css">
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
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<form action="./customOrder.jsp" method="POST" name="customForm">
		
		<div id="custom_key">
			custom keyimge
		</div>
		
		<div id="custom_content_wrap">
		
			<div id="custom_nav">
				<span>STEP</span>
				<span>베이스</span>
				<span>야채</span>
				<span>고기/생선</span>
				<span>토핑</span>
				<span>치즈</span>
				<span>소스</span>
			</div>
			
			<div id="cus_step01">
				<div>STEP1. 베이스를 선택하세요.</div>
			
				<div class="container">
					<div class="row">
						<div class="col">
							<!-- <div class="btn-group btn-group-toggle" data-toggle="buttons"> -->
							
							<%for(MaterialDTO mDto : baseList) { %>
							
								<label class="btn btn-light">
									<input type="radio" name="<%=mDto.getmType() %>" id="<%=mDto.getmNo() %>" value="<%=mDto.getmName() %>"> 
										<img alt="" src="../cus_img/base/<%=mDto.getmImage() %>.png">
										<div class="cusradio01"><%=mDto.getmName() %></div>
										<div id="cusradiotext01">
											<span class="radiotext01"><%=mDto.getmInfo() %></span>
										</div>
										<div class="cusradio01">
											<span class="radiotext02">9kcal / 30g</span>
										</div>
								</label>
								
							<%} %>
							<!-- </div> -->
						</div>
					</div>
				</div>
			</div>
			
			<div id="cus_step02">
				<div>STEP2. 베이스를 선택하세요.</div>
			
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
							
							<%for(MaterialDTO mDto : topList1) { %>
							
								<label class="btn btn-light">
									<input type="radio" name="jb-radio-<%=mDto.getmType() %>" id="jb-radio-<%=mDto.getmNo() %>" value="<%=mDto.getmName() %>"> 
										<img alt="" src="../cus_img/topping1/<%=mDto.getmImage() %>.png">
										<div class="cusradio01"><%=mDto.getmName() %></div>
										<div id="cusradiotext01">
											<span class="radiotext01"><%=mDto.getmInfo() %></span>
										</div>
										<div class="cusradio01">
											<span class="radiotext02">9kcal / 30g</span>
										</div>
								</label>
								
							<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="cus_step03">
				<div>STEP3. 고기/생선을 선택하세요.</div>
			
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
							
							<%for(MaterialDTO mDto : topList2) { %>
							
								<label class="btn btn-light">
									<input type="radio" name="jb-radio-<%=mDto.getmType() %>" id="jb-radio-<%=mDto.getmNo() %>" value="<%=mDto.getmName() %>"> 
										<img alt="" src="../cus_img/topping2/<%=mDto.getmImage() %>.png">
										<div class="cusradio01"><%=mDto.getmName() %></div>
										<div id="cusradiotext01">
											<span class="radiotext01"><%=mDto.getmInfo() %></span>
										</div>
										<div class="cusradio01">
											<span class="radiotext02">9kcal / 30g</span>
										</div>
								</label>
								
							<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="cus_step04">
				<div>STEP4. 그 외 토핑을 선택하세요.</div>
			
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
							
							<%for(MaterialDTO mDto : topList3) { %>
							
								<label class="btn btn-light">
									<input type="radio" name="jb-radio-<%=mDto.getmType() %>" id="jb-radio-<%=mDto.getmNo() %>" value="<%=mDto.getmName() %>"> 
										<img alt="" src="../cus_img/topping3/<%=mDto.getmImage() %>.png">
										<div class="cusradio01"><%=mDto.getmName() %></div>
										<div id="cusradiotext01">
											<span class="radiotext01"><%=mDto.getmInfo() %></span>
										</div>
										<div class="cusradio01">
											<span class="radiotext02">9kcal / 30g</span>
										</div>
								</label>
								
							<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="cus_step05">
				<div>STEP5. 치즈를 선택하세요.</div>
			
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
							
							<%for(MaterialDTO mDto : cheeseList) { %>
							
								<label class="btn btn-light">
									<input type="radio" name="jb-radio-<%=mDto.getmType() %>" id="jb-radio-<%=mDto.getmNo() %>" value="<%=mDto.getmName() %>"> 
										<img alt="" src="../cus_img/cheese/<%=mDto.getmImage() %>.png">
										<div class="cusradio01"><%=mDto.getmName() %></div>
										<div id="cusradiotext01">
											<span class="radiotext01"><%=mDto.getmInfo() %></span>
										</div>
										<div class="cusradio01">
											<span class="radiotext02">9kcal / 30g</span>
										</div>
								</label>
								
							<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="cus_step06">
				<div>STEP6. 소스를 선택하세요.</div>
			
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
							
							<%for(MaterialDTO mDto : sourceList) { %>
							
								<label class="btn btn-light">
									<input type="radio" name="<%=mDto.getmType() %>" value="<%=mDto.getmName() %>"> 
										<img alt="" src="../cus_img/source/<%=mDto.getmImage() %>.png">
										<div class="cusradio01"><%=mDto.getmName() %></div>
										<div id="cusradiotext01">
											<span class="radiotext01"><%=mDto.getmInfo() %></span>
										</div>
										<div class="cusradio01">
											<span class="radiotext02">9kcal / 30g</span>
										</div>
								</label>
								
							<%} %>
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
				</div>
			</div>
		
		</div>
			<input type="hidden" name="caseNo" value="1">
		
		
		</form>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
		</div>
		
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	</body>
</html>