<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		
		<div id="classic_con01">
			<!-- ��ǰ�����ֱ� -->
			<ul class="classic_list">

				<li> <!-- �ν�Ʈ ���� -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a�±�
								 span class=icon ���� ������ �̹���
								 button���� ȣ�� �� ��� ��, ��ٱ���, ���� ��ũ ���� -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=01">
								 	<img alt="" src="../p_img/�ν�Ʈ����.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 <div class="icons">
								     <a href="#"><img src="c_img/classic_hover_icon01.png" width="42px" height="42px"></a>
								     <a href="#"><img src="c_img/classic_hover_icon02.png" width="42px" height="42px"></a>
								     <a href="#"><img src="c_img/classic_hover_icon03.png" width="42px" height="42px"></a>
								  </div>
								
						</div>
						<div class="classic_info">
							<!-- span class=classic_name ��ǰ�̸�
								 span class=classic_cost ����
								 span class=classic_desc ���� ���� -->
								 <div id="cname">
									 <span class="classic_name">
									 	�ν�Ʈ ���� ������
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500��
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	�ż��� ��ä�� ���ΰ� �Բ�
									 	�׸����� ��ȭ�� ���� ��
									 	������� ���� ������
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- ��Ʈ69 �κ� -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- ��ġ -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a�±�
								 span class=icon ���� ������ �̹���
								 button���� ȣ�� �� ��� ��, ��ٱ���, ���� ��ũ ���� -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=02">
								 	<img alt="" src="../p_img/��ġ������.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
							<!-- span class=classic_name ��ǰ�̸�
								 span class=classic_cost ����
								 span class=classic_desc ���� ���� -->
								 <div id="cname">
									 <span class="classic_name">
									 	��ġ ������
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500��
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	�ż��� ��ä�� ���ΰ� �Բ�
									 	��ġ�� �÷��� ǳ�̰� �پ 
									 	������
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- ��Ʈ69 �κ� -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- �Ϸ�߰� -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a�±�
								 span class=icon ���� ������ �̹���
								 button���� ȣ�� �� ��� ��, ��ٱ���, ���� ��ũ ���� -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=03">
								 	<img alt="" src="../p_img/�Ϸ�߰�.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
							<!-- span class=classic_name ��ǰ�̸�
								 span class=classic_cost ����
								 span class=classic_desc ���� ���� -->
								 <div id="cname">
									 <span class="classic_name">
									 	�Ϸ�߰� ������
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500��
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	�Ϸ翡 ì�ܾ� �ϴ� �߰����� 
									 	�� �ǰ��� �鿪�� ���� 
									 	������
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- ��Ʈ69 �κ� -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				
				<li> <!-- �ν�Ʈ ġŲ -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=04">
								 	<img alt="" src="../p_img/�ν�ƮġŲ.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
								 <div id="cname">
									 <span class="classic_name">
									 	�ν�Ʈ ġŲ ������
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500��
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	�ż��� ��ä�� �߰�������
									 	�׸����� ���� �÷� �� 
									 	��ܹ� ������
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- ��Ʈ69 �κ� -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- ������ -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=05">
								 	<img alt="" src="../p_img/������.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
								 <div id="cname">
									 <span class="classic_name">
									 	������ ������
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500��
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	�ż��� ��ä�� ���ΰ� �Բ�
									 	�׸����� ���� �÷��� ǳ�̰� 
									 	�پ ������
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- ��Ʈ69 �κ� -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- ���� �ƺ�ī�� -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=06">
								 	<img alt="" src="../p_img/����ƺ�ī��.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
								 <div id="cname">
									 <span class="classic_name">
									 	���� �ƺ�ī�� ������
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500��
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	�ż��� ��ä�� ���ΰ� �Բ�
									 	������� �ƺ�ī���� ���� 
									 	����Ǫ�� ������
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- ��Ʈ69 �κ� -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				
				<li> <!-- ������ -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a�±�
								 span class=icon ���� ������ �̹���
								 button���� ȣ�� �� ��� ��, ��ٱ���, ���� ��ũ ���� -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=07">
								 	<img alt="" src="../p_img/������.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
							<!-- span class=classic_name ��ǰ�̸�
								 span class=classic_cost ����
								 span class=classic_desc ���� ���� -->
								 <div id="cname">
									 <span class="classic_name">
									 	������ ������
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500��
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	�ż��� ��ä�� ���ΰ� �Բ�
									 	�߽�ĭ ��Ÿ���� ������ ���찡 
									 	�ö� ������ ������
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- ��Ʈ69 �κ� -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- ����Ÿġ�� -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a�±�
								 span class=icon ���� ������ �̹���
								 button���� ȣ�� �� ��� ��, ��ٱ���, ���� ��ũ ���� -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=08">
								 	<img alt="" src="../p_img/����Ÿġ��.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
							<!-- span class=classic_name ��ǰ�̸�
								 span class=classic_cost ����
								 span class=classic_desc ���� ���� -->
								 <div id="cname">
									 <span class="classic_name">
									 	����Ÿ ġ�� ������
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500��
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	�ż��� ��ä�� ����Ÿġ��� 
									 	���� �����Ǿ� �ǰ��ϰ� 
									 	����� �ѳ�������
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- ��Ʈ69 �κ� -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				<li> <!-- �������� -->
					<div class="classic_item">
					<!-- width: 250px height:495px -->
						<div class="classic_thumnail">
							<!-- width: 248px height:294px -->
							<!-- a�±�
								 span class=icon ���� ������ �̹���
								 button���� ȣ�� �� ��� ��, ��ٱ���, ���� ��ũ ���� -->
								 <a class="thum_img" href="classicViewProduct.jsp?pno=09">
								 	<img alt="" src="../p_img/��������.png">
								 </a>
								 <span class="classic_ico">
								 	<img alt="" src="../c_img/classic_salerate.png">
								 </span>
								 
						</div>
						<div class="classic_info">
							<!-- span class=classic_name ��ǰ�̸�
								 span class=classic_cost ����
								 span class=classic_desc ���� ���� -->
								 <div id="cname">
									 <span class="classic_name">
									 	���� ���� ������
									 </span>
								 </div>
								 <div id="ccost">
									 <span class="classic_cost">
									 	6500��
									 </span>
									 </div>
								 <div id="cdesc">
									 <span class="classic_desc">
									 	�ż��� ��ä, ���ΰ� �Խ� 
									 	���������� �÷��� ǳ�̰�  
									 	�پ ������
									 </span>
								 </div>
						</div>
						<div id="classic_tag">
							<!-- ��Ʈ69 �κ� -->
							<img alt="" src="../c_img/classic_tag_icon.png">
						</div>
					</div>
				</li>
				

			</ul>
		</div>
		<div id="clear">
			
		</div>

		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>