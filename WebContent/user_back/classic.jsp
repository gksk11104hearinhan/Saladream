<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="saladream.ProductDTO"%>
<%@page import="saladream.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    	//���ڵ�, �۾� �����°� ����
    	request.setCharacterEncoding("EUC-KR");
    %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Classic_��ǰ ������</title>
	<link href="../css/classic_style.css" rel="stylesheet" type="text/css">
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id="classic_wrap">
	<!-- classic_wrap�� ũ�� => width=1000,height=? -->
		
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<div id="classic_keyimg">
			<!-- keyimage�κ��Դϴ�. -->
			<!-- classic_keyimage�κ��Դϴ�.
				 ���λ� �ڽ��� �ɷ��� ������ ��ư���� ���� -> ���� 480px;-->
			<div id="classic_key_button">
				<!-- ���λ� �ڽ� ũ�� : width: 432px, height: 53px -->
				<img alt="" src="../c_img/classic_key_button.png">
			</div>
		</div>
		
		<div id="classic_word01">
			<!-- "����� ��ä��~Ŭ������ ������"�κ� -> ���� 100px -->
			<!-- �������� ũ��� width:570px height:100px -->
		</div>
		
	<%
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductDTO> list = dao.selectAll(); //ProductDAO�� selectAll() �Լ� �ҷ�����
		int count = list.size();
						
	%> 
		
		<div id="classic_con01">
			<!-- ��ǰ�����ֱ� -->
			<ul class="classic_list">

		<%
			for(ProductDTO dto : list) {
		%> 
				<li>
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a�±�
								 span class=icon ���� ������ �̹���
								 button���� ȣ�� �� ��� ��, ��ٱ���, ���� ��ũ ���� -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=<%= dto.getPno() %>">
								 	<img alt="" src="../p_img/<%= dto.getPimage() %>.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 <!-- <div class="icons">
								     <a href="#"><img src="c_img/classic_hover_icon01.png" width="42px" height="42px"></a>
								     <a href="#"><img src="c_img/classic_hover_icon02.png" width="42px" height="42px"></a>
								     <a href="#"><img src="c_img/classic_hover_icon03.png" width="42px" height="42px"></a>
								  </div> -->
								
						</div>
						
						<div class="classic_info">
							<!-- span class=classic_name ��ǰ�̸�
								 span class=classic_cost ����
								 span class=classic_desc ���� ���� -->
								 <div id="cname">
									 <span class="classic_name">
									 	<%= dto.getPname() %>
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	<%= dto.getPprice() %>��
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	<%= dto.getPdescript() %>
									 </span>
								 </div>
						</div>
						
						<div id="classic_tag">
							<!-- ��Ʈ69 �κ� -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
		<%
			}
		%>
				

			</ul>
		</div>
		<div id="clear">
			
		</div>

		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>