<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<div id="fixtop">
			<div id="header">
				<!-- fixtop �κ��Դϴ�. => fixtop���� �ٲ� ���� -->
				<a href="index.jsp">
				<img alt="" src="../img/logo.png" width="190px" height="76px">
				</a>
			</div>
			<div id="nav">
				<ul>
					<li class="nav01"><a href="brand.jsp">Brand</a></li>
					<li class="nav01"><a href="classic.jsp">Classic</a></li>
					<li class="nav01"><a href="custom.jsp">Custom</a></li>
					<li class="nav01"><a href="event.jsp">Event</a></li>
				</ul>
			</div>
			<div id="nav2">
				<ol>
				
<!-- 					<li class="nav02"><a href="login.jsp">�α���</a></li> -->
				
					 <%  
					  String id = (String)session.getAttribute("id");  
					   
					  if (id == null){%> 
					      <li class="nav02"><a href="login.jsp">�α���</a></li>
					      <li class="nav02">��</li>
						  <li class="nav02"><a href="join.jsp">ȸ������</a></li>
					  <% 
					  }else{%> 
					  	<li class="nav02"><a href="logout.jsp">�α׾ƿ�</a></li>
					  	<li class="nav02">��</li>
						<li class="nav02"><a href="mypage.jsp">Mypage</a></li>
					  <% 
					  }%> 
				
					<!-- <li class="nav02">��</li>
					<li class="nav02"><a href="join.jsp">ȸ������</a></li> -->
					<li class="nav02">��</li>
					<li class="nav02"><a href="cart.jsp">��ٱ���</a></li>
				</ol>
			</div>
		</div>
</body>
</html>