<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Main_���� ������</title>
	
	<!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="../css/materialize.min.css" media="screen,projection"/>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<!-- <link href="../css/main_style.css" rel="stylesheet" type="text/css"> -->
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
	<link href="../css/index_style.css" rel="stylesheet" type="text/css">
	<link type="text/css" rel="stylesheet" href="../css/nav02_style.css"/>
	<!-- <link href="../css/swiper_style.css" rel="stylesheet" type="text/css"> -->
</head>
<body>

	<%
		String id = (String)session.getAttribute("id");
	%>

	<jsp:include page="fixtop.jsp"></jsp:include>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
       <script type="text/javascript" src="../js/materialize.min.js"></script>
       <script type="text/javascript">
	       $(document).ready(function(){
	    	   $('.slider').slider();
	    	 });
       </script>
       
         <div class="slider" style="height: 540px;">
		    <ul class="slides" style="height: 500px;">
		      <li>
		        <img src="../img/bg1_02.png"> <!-- random image -->
		        <!-- <div class="caption center-align"> -->
		        <div class="caption center-align">
		          <h3>
		          	<span class="firstSlide_Text001">�ٽ� ���ƿ�~</span><br>
		          	<span class="firstSlide_Text002">����</span> <span class="firstSlide_Text003">&</span> <span class="firstSlide_Text004">�ƺ�ī��</span>
		          </h3>
		          <h5 class="light grey-text text-lighten-3">
				  	<span class="firstSlide_Text005">���� �Ϸ縸 20% ����!</span>
				  </h5>
				  <a href="classic.jsp" class="firstSlide_Link001">�ڼ��� ����     ��</a>
		        </div>
		      </li>
		      <li>
		        <img src="../img/bg2_02.png"> <!-- random image -->
		        <div class="caption center-align">
		          <div id="key2_circle">
		          		<img alt="" src="../img/bg2_con.png" class="key2_Cir01">
		          		<img alt="" src="../img/bg2_con.png" class="key2_Cir02">
		          		<img alt="" src="../img/bg2_con.png" class="key2_Cir03">
		          		<img alt="" src="../img/bg2_con.png" class="key2_Cir04">
		          	</div>
		          <h3>
		          	<span class="secondSlide_Text001">���� �ٷ� ��� ������</span><br>
		          	<span class="secondSlide_Text002">�̴��� ���� </span><span class="secondSlide_Text003">��������~</span>
		          </h3>
		          <h5 class="light grey-text text-lighten-3">
			          <!-- <div id="key2_bound">
			          	<div class="key2Bound01">
			          	<img alt="" src="../img/bg2_cp1.png"class="key2_image"><br>
			          	<span class="secondSlide_Text004">1���� �̻� ������</span>
			          	</div>
			          	<div class="key2Bound01">
			          	<img alt="" src="../img/bg2_cp2.png"class="key2_image"><br>
			          	<span class="secondSlide_Text004">2���� �̻� ������</span>
			          	</div>
			          	<div class="key2Bound01">
			          	<img alt="" src="../img/bg2_cp3.png"class="key2_image"><br>
			          	<span class="secondSlide_Text004">3���� �̻� ������</span>
			          	</div>
			          </div> -->
			          <img alt="" src="../img/bg2_cp4.png" class="key2_image2">
		          </h5>
		        </div>
		      </li>
		      <li>
		        <img src="../img/bg3.png"> <!-- random image -->
		        <div class="caption left-align">
		          <a href="event.jsp" class="thirdSlide_Link002"> + �ڼ��� ����  +</a>
		          <h3>
		          	<span class="thirdSlide_Text001">õ������</span>
		          	<span class="thirdSlide_Text005"> ������ </span>
		          	<span class="thirdSlide_Text001">����</span><br>
		          	<span class="thirdSlide_Text002">������ Ŭ��¡ �ֽ�</span>
		          </h3>
		          <h5 class="light grey-text text-lighten-3">
		          	<span class="thirdSlide_Text003">3���� �̻� ���Ž�</span><br>
		          	<span class="thirdSlide_Text004">Ŭ��¡ �ֽ� 5�� �� 2�� ���� (��������)</span>
		          </h5>
		        </div>
		      </li>
		    </ul>
		  </div>
	
	
	<div id="main_wrap">
	<!-- main_wrap�� ũ�� => width=1000,height=3750 -->
		
		<div id="main_con_classic">
		<!-- height: 557px -->
		<div id="m_classic_size">
			<div id="m_classic_title01">
				�����帲�� <span class="title01_text01">Ŭ����</span><span class="title01_text02">�� ��ǰ</span>
			</div>
			<div id="m_classic_title02">
				�����帲�� Ŭ������ �����带 ��ܺ�����.
			</div>
			<div id="m_classic_sub01">
				<ul>
					<li>
					<div id="classic_subCon">
						<a>
						<img alt="" src="../main_img/main_classic001.png">
						</a>
						<div class="subCon01">������ ������</div>
						<div class="subCon02">��ġ+����Ʈ��+�ø���+�丶��+��ä�ͽ��� �� �ѳ�!</div>
					</div>
					</li>
					<li>
					<div id="classic_subCon">
						<a>
						<img alt="" src="../main_img/main_classic002.png">
						</a>
						<div class="subCon01">�Ϸ�߰� ������</div>
						<div class="subCon03">�߰��ͽ�+����Ʈ��+�ø���+�丶��+��ä�ͽ��� �� �ѳ�!</div>
					</div>
					</li>
					<li>
					<div id="classic_subCon">
						<a>
						<img alt="" src="../main_img/main_classic003.png">
						</a>
						<div class="subCon01">�ν�Ʈ ġŲ ������</div>
						<div class="subCon04">�߽�����ũ+����Ʈ��+�ø���+�丶��+��ä�ͽ��� �� �ѳ�!</div>
					</div>
					</li>
				</ul>
			</div>
			<div id="clear"></div>
			<div id="m_classic_sub02">
				<div class="classic_subCon02">
					<a href="classic.jsp">
						�޴� ������
					</a>
				</div>
			</div>
		</div>	
		</div>
		
		<!-- <div id="main_classic_custom_mid">
			���� 50�� �丶��� �ٻ�� ©���κ��� Ŀ�����ִ� �κ�
		</div> -->
		
		<div id="main_con_custom">
			<div id="con_custom_01">
				<!-- 1000px 590px -> 542x; <br> -->
				<img alt="" src="../main_img/main_mid_con001.png">
				<!-- �����̴� ȿ�� �־�� �� -->
			</div>
			<div id="con_custom_02">
				<!-- 1000px 240px <br>
				content -> custom(Ŀ����) �Ұ�  -->
				<div id="custom02_Mcon">
					<img alt="" src="../main_img/main_custom001.png">
				</div>
				<div id="custom02_Mtext">
					<span class="cus02_text01">
						<a href="custom.jsp">���� ���鷯 ���� ��</a>
					</span>
				</div>
			</div>
		</div>
		<div id="main_con_brand"> 
			<!-- 35.28cm 20.53cm (1000 582(580)) <br>
			content -> brand �Ұ�, -->
			<div id="m_brand_title_con">
				<div id="m_brand_title01">
					�귣��
				</div>
				<div id="m_brand_title02">
					�����帲�� �̷� ����� �ϰ� �־��.
				</div>
			</div>
			<div id="m_brand_title_con002">
			<ul>
				<li class="snip1431">
				<figure class="snip1432">
					<img src="../m_img/main_brand_con01.png" alt="Quality" />
					<figcaption>
				    <div>
				    	<h3>�ְ��� ���� ǰ���� ���� ����մϴ�</h3>
				    	<h3>�ְ��� ���� ǰ���� ���� ����մϴ�</h3>
				    </div>
				    <div>
				    	<h2 class="snip1431_title">Quality</h2>
				    </div>
					</figcaption>
					<!-- <a href="#"></a> -->
				</figure>
				</li>
				<li>
				<figure class="snip1433">
					<img src="../m_img/main_brand_con02.png" alt="Customer" />
					<figcaption>
				    <div>
				    	<h3>���� �ູ�� ���� �����ϴ� ����Դϴ�</h3>
				    	<h3>���� �ູ�� ���� �����ϴ� ����Դϴ�</h3>
				    </div>
				    <div>
				    	<h2 class="snip1431_title">Customer</h2>
				    </div>
					</figcaption>
					<!-- <a href="#"></a> -->
				</figure>
				</li>
			</ul>
			</div>
		</div>
		<div id="main_con_event">
			<!-- 35.28cm 28.19cm (1000 799(800)) <br>
			content -> event �Ұ� -->
			<div id="m_event_title_con">
				<div id="m_event_title01">
					�̺�Ʈ
				</div>
				<div id="m_event_title02">
					�����帲�� �پ��� �̺�Ʈ�� ����������.
				</div>
			</div>
			<div id="m_event_content">
				<a href="event.jsp">
				<img alt="" src="../main_img/main_event_con001.png" class="event_img1">
				</a>
				<a href="event.jsp">
				<img alt="" src="../main_img/main_event_con002.png" class="event_img1">
				</a>
				<a href="event.jsp">
				<img alt="" src="../main_img/main_event_con003.png" class="event_img1">
				</a>
			</div>
		</div>
		
		<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>