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
				<!-- fixtop �κ��Դϴ�. => fixtop���� �ٲ� ���� -->
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
<!-- 					<li class="nav02"><a href="login.jsp">�α���</a></li> -->
				
					 <%  
					  String id = (String)session.getAttribute("id");  
					   
					  if (id == null){%> 
					      <span class="nav02"><a href="login.jsp">�α���</a></span>
					      <span class="nav02">��</span>
						  <span class="nav02"><a href="join.jsp">ȸ������</a></span>
					  <% 
					  }else{%> 
					  	<span class="nav02"><a href="logout.jsp">�α׾ƿ�</a></span>
					  	<span class="nav02">��</span>
						<span class="nav02"><a href="mypage.jsp">Mypage</a></span>
					  <% 
					  }%> 
				
					<!-- <li class="nav02">��</li>
					<li class="nav02"><a href="join.jsp">ȸ������</a></li> -->
					<span class="nav02">��</span>
					<span class="nav02"><a href="./showCart.jsp">��ٱ���</a></span>
			</div>
		</div>
	</div>
</body>
</html>