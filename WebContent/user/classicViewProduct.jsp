<%@page import="java.util.ArrayList"%>
<%@page import="saladream.ProductDTO"%>
<%@page import="saladream.ProductDAO"%>
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
	<title>classicViewProduct_��ǰ �� ������</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	
	<link href="../css/viewPro_style.css" rel="stylesheet" type="text/css">
	<link href="../css/vpSwiper_style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function directOrd()        //  "��ñ����ϱ�" ��ư�� Ŭ���� ȣ��
		{
			/* var str=productFrm.qty.value; */
			var frm = document.productFrm;
			frm.action = "directOrder.jsp";
			frm.submit();
		}
	
	
		function addCart()              //  "��ٱ��ϴ��" ��ư�� Ŭ���� ȣ��
		{
			/* var str=productFrm.qty.value; */
			var frm = document.productFrm;
			/* frm.action = "cart.jsp"; */
			//frm.action = "cart_test.jsp"    // ��ٱ��� DBȮ���� ���� �ӽ� ���� ������
			frm.action = "inCart.jsp" 
			frm.submit();
		}
	</script>
</head>
<body>

<jsp:include page="fixtop.jsp"></jsp:include>

<form action="" method="post" name="productFrm">
	
	<div id="viewPro_wrap">
	<!-- viewPro_wrap�� ũ�� => width=1000,height=? -->
		
		<!-- <img alt="" src="../img/topDrop.png"> -->
		
		<!-- <div id="viewPro_keyimg">
			keyimage�κ��Դϴ�.
			viewPro_keyimage�κ��Դϴ�.
		</div> -->
		
		<div id="viewPro_content">
			<!-- ��ǰ �� ������ �Դϴ�. -->
			
			<jsp:useBean id="dto" class="saladream.ProductDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="dto"/>
			
			<%
				System.out.print(dto);
				ProductDAO dao = new ProductDAO();
				ProductDTO dto2 = dao.select(dto);
				
				String pno = request.getParameter("pno"); //����ȸ�ϰ����ϴ� ��ǰ��ȣ�� �޾ƿ´�.
			%>
			<input type="hidden" name="pno" value="<%=pno%>">
			<div id="viewPro_con">
				<div id="viewPro_con01">
					<!-- ��ǰ �̹��� -->
					<img alt="" src="../p_img/<%= dto2.getPdetailimage() %>.png">
				</div>
				<div id="viewPro_con02">
					<div id="vP_con001">
					<!-- Salad > ��ǰ��ȣ
						 ��ǰ�̸�
						 �ǸŰ� (���� �Һ�)
						 �ѷ� (�������� ����)
						 �� ��� (������ ���� ����)
						 ���� ��å Ȥ�� (�̺�Ʈ)������ Ȯ�� 
						 �� �Ǹ� �ܰ� : ���ε� ���� Ȥ�� �������� �� ���� ���� -->
						<div class="vP_text01">
							[�����帲] <%= dto2.getPname() %>
						</div>
						<div class="vP_text02">
							<%= dto2.getPprice() %>��
						</div>
						<div class="vP_text03">
							<%= dto2.getPdescript() %>
						</div>
						<div class="vP_text04">
							<span class="text04_001">��۹��</span>
							<span class="text04_002">�ù� ���</span>
						</div>
						<div class="vP_text05">
							<span class="text04_001">��ۺ�</span>
							<span class="text04_003">3000��</span>
						</div>
						<div class="vP_text06">
							<span class="text04_001">�߷�����</span>
							<div class="text06_con">
								<select name="option01" id="option01" class="selClassic">
									<option value="0">�߷� ����(����)</option>
									<option value="400">400g(1�κ�)</option>
									<option value="600">600g</option>
									<option value="800">800g</option>
									<option value="1000">1000g</option>
								</select>
							</div>
						</div>
						<div class="vP_text07">
							<span class="text04_001">�ҽ�����</span>
							<div class="text06_con">
								<select name="option02" id="option02" class="selClassic">
									<option value="0">�ҽ� ����(����)</option>
									<option value="�����ҽ�">�����ҽ�</option>
									<option value="ȭ��Ʈ�ҽ�">ȭ��Ʈ�ҽ�</option>
									<option value="������Ż�ҽ�">������Ż�ҽ�</option>
									<option value="����ĥ���ҽ�">����ĥ���ҽ�</option>
									<option value="ĥ������ҽ�">ĥ������ҽ�</option>
									<option value="�ͻ��ܼҽ�">�ͻ��ܼҽ�</option>
								</select>
							</div>
						</div>
						<div class="vP_text08">
							<span class="text04_001">���ż���</span>
							<div class="text06_con">
								<select name="option03" id="option03" class="selClassic">
									<option value="0">���� ����(����)</option>
									<option value="1">01</option>
									<option value="2">02</option>
									<option value="3">03</option>
									<option value="4">04</option>
									<option value="5">05</option>
									<option value="6">06</option>
									<option value="7">07</option>
									<option value="8">08</option>
									<option value="9">09</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div id="clear"></div>
			
			<div id="viewPro_con03">
				<!-- �� ��ǰ �ݾ�, ��ٱ��� ���, �ٷ� �����ϱ� -->
				<div class="vPcon03_text01">
					<span class="text04_004">�� ��ǰ�ݾ�: </span>
					<span class="priceClassic"><%= dto2.getPprice() %>��</span>
				</div>
				<div id="clear"></div>
				<div class="vPcon03_text02">
					<a href="classic.jsp">
						<input type="button" title="�������" alt="�������" value="�������"
							 class="btn_classicVp01" id="log.classicView">
					</a>
					<a>
						<input type="button" title="��ٱ��� ���" alt="��ٱ��� ���" value="��ٱ��� ���"
							 onclick="addCart()" class="btn_classicVp02" id="log.classicView">
					</a>
					<a>
						<input type="button" title="�����ϱ�" alt="�����ϱ�" value="�����ϱ�"
							 onclick="directOrd()" class="btn_classicVp03" id="log.classicView">
					</a>
				</div>
			</div>
			
			
			<%
				ProductDAO dao3 = new ProductDAO();
				ArrayList<ProductDTO> list = dao3.selectAll(); //ProductDAO�� selectAll() �Լ� �ҷ�����
				int count = list.size();
								
			%> 
			<div id="viewPro_con04">
				<!-- �ٸ� ��ǰ -->
				<div id="vP_con_title01">
					<img alt="" src="../img/mini_logo.png" style="width: 23px; height: 21px;">
					���û�ǰ
				</div>
				<!-- Swiper -->
				  <div class="swiper-container">
				    <div class="swiper-wrapper">
				    <%
						for(ProductDTO dto3 : list) {
					%> 
				      <div class="swiper-slide" id="swipe_slide_style">
				      	<ul>
				      	<li>
					      	<div>
					      	<a class="slide_thum_img" href="classicViewProduct.jsp?pno=<%= dto3.getPno() %>">
								<img alt="" src="../p_img/<%= dto3.getPimage() %>.png" class="swipe_img" >
							</a>
							</div>
						</li>
						<li>
							<div id="swiper_name">
								<%= dto3.getPname() %>
							</div>
						</li>
						<li>
							<div id="swiper_price">
								<%= dto3.getPprice() %>��
							</div>
						</li>
				      </ul>
				      </div>
				    <%
						}
				    %>
				    </div>
				    <div class="swiper-button-next">
				    	<img alt="" src="../vp_img/arrow_right.png">
				    </div>
				    <div class="swiper-button-prev">
						<img alt="" src="../vp_img/arrow_left.png">
				    </div>
				  </div>
				  <!-- Initialize Swiper -->
				  <script>
				    var swiper = new Swiper('.swiper-container', {
				      slidesPerView: 4,
				      direction: getDirection(),
				      navigation: {
				        nextEl: '.swiper-button-next',
				        prevEl: '.swiper-button-prev',
				      },
				      on: {
				        resize: function () {
				          swiper.changeDirection(getDirection());
				        }
				      }
				    });
				
				    function getDirection() {
				      var windowWidth = window.innerWidth;
				      var direction = window.innerWidth <= 700 ? 'vertical' : 'horizontal';
				
				      return direction;
				    }
				  </script>
			</div>
			
		</div>
		
		<div id="viewPro_content02">
			<!-- �󼼺������ ~ Ǫ�� ������
				 width:602px -->
			<div id="vP_content02_title01">
				<ul>
					<li class="con02_subtitle01">
						<a href="#vP_content02_title01">
							������
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title02">
							���ı�
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title03">
							Q&A
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title04">
							���/��ȯ/��ǰ
						</a>
					</li>
				</ul>
			</div>
			<div id="clear"></div>
			<div id="vP_content02_con01">
				<img alt="" src="../vp_img/tunaproductdetail.png"> <!-- product���� �� �ҷ����� �ɷ� ��ü ��� -->
			</div>
			
			<div id="vP_content02_title02">
				<ul>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title01">
							������
						</a>
					</li>
					<li class="con02_subtitle01">
						<a href="#vP_content02_title02">
							���ı�
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title03">
							Q&A
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title04">
							���/��ȯ/��ǰ
						</a>
					</li>
				</ul>
			</div>
			<div id="clear"></div>
			<div id="vP_content02_con02">
				<div class="vPCon02_matTile01">
					�� �ı�
				</div>
				<div class="vPCon02_matTile02">
					��ǰ�� �����Ͻ� �е��� �ۼ��� �ı��Դϴ�.
				</div>
				<div>
					<table class="table_line01">
						<tr style="text-align: center; height: 45px;">
							<td class="table_line02">��ȣ</td>
							<td class="table_line03">����</td>
							<td class="table_line04">�ۼ���</td>
							<td class="table_line05">�ۼ���</td>
						</tr>
						<tr> <!-- reply�� �ۼ��Ͽ� ������ ó�� ���! -->
							<td class="table_line02">001</td>
							<td class="table_line03">��ġ��������� �ʹ� ���־��~</td>
							<td class="table_line04">�͸�</td>
							<td class="table_line05">2020.06.09</td>
						</tr>
						<tr> <!-- reply�� �ۼ��Ͽ� ������ ó�� ���! -->
							<td class="table_line02">002</td>
							<td class="table_line03">�����̺�Ʈ �����ؿ�~</td>
							<td class="table_line04">�͸�</td>
							<td class="table_line05">2020.06.16</td>
						</tr>
					</table>
				</div>
				<div class="vPCon_matBtn00">
					<a href="#">�ı⾲��</a> <!-- jQuery�� �޾ƿ��� -->
				</div>
			</div>
			
			<div id="vP_content02_title03">
				<ul>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title01">
							������
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title02">
							���ı�
						</a>
					</li>
					<li class="con02_subtitle01">
						<a href="#vP_content02_title03">
							Q&A
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title04">
							���/��ȯ/��ǰ
						</a>
					</li>
				</ul>
			</div>
			<div id="clear"></div>
			<div id="vP_content02_con03">
				<div class="vPCon02_matTile01">
					Q&A
				</div>
				<div class="vPCon02_matTile02">
					�����Ͻ÷��� ��ǰ�� ���� �ñ��Ͻ� ���� �����ø� �亯�� �帮�ڽ��ϴ�.
				</div>
				<div>
					<table class="table_line01">
						<tr style="text-align: center; height: 45px;">
							<td class="table_line02">����</td>
							<td class="table_line03">����</td>
							<td class="table_line04">�ۼ���</td>
							<td class="table_line05">�ۼ���</td>
						</tr>
						<tr> <!-- reply�� �ۼ��Ͽ� ������ ó�� ���! -->
							<td class="table_line02">�̴亯</td>
							<td class="table_line03">�ҽ��� 2�� ������ �� ������?</td>
							<td class="table_line04">�͸�</td>
							<td class="table_line05">2020.06.08</td>
						</tr>
					</table>
				</div>
				<div class="vPCon_matBtn00">
					<a href="#">��ǰ����</a> <!-- jQuery�� �޾ƿ��� -->
				</div>
			</div>
			
			<div id="vP_content02_title04">
				<ul>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title01">
							������
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title02">
							���ı�
						</a>
					</li>
					<li class="con02_subtitle02">
						<a href="#vP_content02_title03">
							Q&A
						</a>
					</li>
					<li class="con02_subtitle01">
						<a href="#vP_content02_title04">
							���/��ȯ/��ǰ
						</a>
					</li>
				</ul>
			</div>
			<div id="clear"></div>
			<div id="vP_content02_con04">
				<img alt="" src="../vp_img/productdetailWarning.png"> <!-- product���� �� �ҷ����� �ɷ� ��ü ��� -->
			</div>
		</div>
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</form>
</body>
</html>