<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="fixtop">
		<div id="fixtop_content">
			<div id="header">
				<!-- fixtop 부분입니다. => fixtop으로 바꿀 예정 -->
				<a href="index.jsp">
				<img alt="" src="../img/logo.png" width="190px" height="70px">
				</a>
			</div>
			
			<div id="nav">
					<span class="nav01"><a href="brand.jsp">BRAND</a></span>
					<span class="nav01"><a href="classic.jsp">CLASSIC</a></span>
					<span class="nav01"><a href="custom.jsp">CUSTOMIZE</a></span>
					<span class="nav01"><a href="event.jsp">EVENT</a></span>
			</div>
			
			<div id="nav2">
<!-- 					<li class="nav02"><a href="login.jsp">로그인</a></li> -->
				
					 <%  
					  String id = (String)session.getAttribute("id");  
					   
					  if (id == null){%> 
					      <span class="nav02"><a href="login.jsp">로그인</a></span>
					      <span class="nav02">ㅣ</span>
						  <span class="nav02"><a href="join.jsp">회원가입</a></span>
					  <% 
					  }else{%> 
					  	<span class="nav02"><a href="logout.jsp">로그아웃</a></span>
					  	<span class="nav02">ㅣ</span>
						<span class="nav02"><a href="mypage.jsp">Mypage</a></span>
					  <% 
					  }%> 
				
					<!-- <li class="nav02">ㅣ</li>
					<li class="nav02"><a href="join.jsp">회원가입</a></li> -->
					<span class="nav02">ㅣ</span>
					<span class="nav02"><a href="./showCart.jsp">장바구니</a></span>
			</div>
		</div>
	</div>
</body>
</html>