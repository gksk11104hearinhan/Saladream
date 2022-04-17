<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Main_���� ������</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	
	<!-- <link href="../css/main_style.css" rel="stylesheet" type="text/css"> -->
	<link href="../css/fixtop.css" rel="stylesheet" type="text/css">
	<link href="../css/index_style.css" rel="stylesheet" type="text/css">
	<link href="../css/swiper_style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
		String id = (String)session.getAttribute("id");
	%>

	<jsp:include page="fixtop.jsp"></jsp:include>
	
	<div id="main_wrap">
	<!-- main_wrap�� ũ�� => width=1000,height=3750 -->
		
		<%-- <jsp:include page="fixtop.jsp"></jsp:include> --%>
		
		<div id="main_keyimg">
			<!-- keyimage�κ��Դϴ�. -->
			<!-- keyimage�κ��Դϴ�. ���� : 470 -->
			<div class="swiper-container">
    			<div class="swiper-wrapper">
    			    <div class="swiper-slide">
    			    	<a href="../user/classic.jsp">
						<img alt="" src="../main_img/main_key001.png">
						</a>
	  				</div>
     			    <div class="swiper-slide">
     			    	<a href="">
       				    <img alt="" src="../main_img/main_key002.png">
       				    </a>
			  	    </div>
			        <div class="swiper-slide">
			        	<a>
			            <img alt="" src="../main_img/main_key003.png">
			            </a>
			  	    </div>
			    </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
			    <!-- Add Arrows -->
			    <div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			  </div>
			  <script>
			    var swiper = new Swiper('.swiper-container', {
			      spaceBetween: 30,
			      centeredSlides: true,
			      autoplay: {
			        delay: 4500,
			        disableOnInteraction: false,
			      },
			      pagination: {
			        el: '.swiper-pagination',
			        clickable: true,
			      },
			      navigation: {
			        nextEl: '.swiper-button-next',
			        prevEl: '.swiper-button-prev',
			      },
			    });
			  </script>
		</div>
		<!-- <div id="main_key_sliceimg">
			�߸�  Ű �̹��� �κ� : �丶�� �� �κ�, ����:110
		</div> -->
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
				    	<h2>Quality</h2>
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
				    	<h2>Customer</h2>
				    </div>
					</figcaption>
					<!-- <a href="#"></a> -->
				</figure>
				</li>
			</ul>
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