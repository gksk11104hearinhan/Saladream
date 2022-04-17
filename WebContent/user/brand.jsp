<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Brand_회사 소개페이지</title>
	<!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="../css/materialize.min.css" media="screen,projection"/>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <link type="text/css" rel="stylesheet" href="../css/nav02_style.css"/>
	<link href="../css/brand_style.css" rel="stylesheet" type="text/css">
</head>
<body>
		<jsp:include page="fixtop.jsp"></jsp:include>
		
		<div id="banner" class="banner">
			<div id="down_wrap">
			<div class="down">
			    <div class="nav03_text01">
			    	<span class="NText01_con01">브랜드</span>
			    	<span class="NText01_con02"> 스토리</span>
			    </div>
			    <div class="nav03_text02">
			     	'샐러드림은 이런 회사입니다!'
			    </div>
			    <div class="nav03_text02">
			    	샐러드림은 좋은 재료, 좋은 마음으로 정성을 담습니다.
			    </div>
			</div>
			</div>
		</div>
		
		<div id="brand_nav">
			<span class="CUSnav_text1"><a href="#brand_conWrap01">브랜드 소개</a></span>
			<span class="CUSnav_text2">|</span>
			<span class="CUSnav_text1"><a href="#brand_rule">브랜드 원칙</a></span>
			<span class="CUSnav_text2">|</span>
			<span class="CUSnav_text1"><a href="#brand_road">찾아오시는 길</a></span>
		</div>
		
		<div id="brand_wrap">
		<!-- brand_wrap의 크기 => width=1080,height=? -->
			<div id="brand_conWrap01">
				<!-- contentWrap -->
				<div id="brand_intro">
					<div class="bCWrap01_Image01">
						<ul>
							<li><img alt="" src="../b_img/brandCon01_Pic01.png" class="IntroPic01"></li>
							<li><img alt="" src="../b_img/brandCon01_Pic02.png" class="IntroPic02"></li>
							<li><img alt="" src="../b_img/brandCon01_Pic03.png" class="IntroPic01"></li>
						</ul>
					</div>
					<div class="bCWrap01_Text01">
						<div class="small_title01">
							브랜드 소개
						</div>
						<div>
							<img alt="" src="../b_img/brandCon01_Text01.png">
						</div>
						<div class="small_info01">
							대부분의 사람들은 웰빙을 원하지만, 각박하고 정신없이 바쁜 요즘 세상에서 웰빙은 누구에게나 주어지는 것은 아닙니다.‘샐러드림’은 내 아이, 내 가족, 그리고 사랑하는 사람들의 몸과 마음의 건강을 최우선으로 생각하는 요리사들이 수많은 고민과 연구 끝에 만들어 낸 웰빙 프리미엄 샐러드 브랜드입니다.
						</div>
						<div class="small_button01">
							<a href="../user/classic.jsp">
								<span class="IntroBut">메뉴 보러가기    →</span>
							</a>
						</div>
					</div>
				</div>
				
				<div id="clear"></div>
				
				<div id="brand_rule">
				<!-- contentWrap -->
					<div class="bCWrap01_Text02">
						<div class="small_title02">
							샐러드림의 원칙
						</div>
						<div class="small_Image02">
							<img alt="" src="../b_img/brandCon01_Rtext01.png">
						</div>
						<div class="small_info01">
							샐러드림은 고객에게 건강함을 선사하고 자연의 건강함을 지키기 위해 <br>좋은 원료와 친환경 가치를 우선으로 삼아 노력하고 있습니다
						</div>
					</div>
					<div class="bCWrap01_Image02">
						<img alt="" src="../b_img/brandCon01_Rpic01.png">
					</div>
				</div>
				
				<div id="clear"></div>
				
				<div id="brand_explain">
					<div id="bExplain01">
						<div class="bExp_TextNum">
							01.
						</div>
						<div class="bExp_TextTitle01">
							좋은 품질, 좋은 식재료
						</div>
						<div class="bExp_TextSub01">
							Good quality, ingredients
						</div>
						<div class="bExp_TextInfo01">
							국내 친환경 농장에서 생산되고 엄격한 규율에 따라 3단계의 세척 과정을 거친 채소들은 매장으로 매일 배송되며, 언제나 신선하고 품질이 좋은 채소를 제공하기 위해 노력합니다.
						</div>
					</div>
					
					<img alt="" src="../b_img/brand_explainLine.png" class="bExp_barLine">
					
					<div id="bExplain02">
						<div class="bExp_TextNum">
							02.
						</div>
						<div class="bExp_TextTitle02">
							안심하고 먹을 수 있는 위생가공
						</div>
						<div class="bExp_TextSub02">
							Hygienic processing
						</div>
						<div class="bExp_TextInfo02">
							모든 제조 과정은 깨끗한 환경을 원칙으로 합니다. 국내 세스코와 계약하여 첨단 위생기기와 식품안전관리 프로그램으로 안전하게 주방을 지켜 위생적이고 믿을 수 있는 요리합니다. 
						</div>
					</div>
					
					<img alt="" src="../b_img/brand_explainLine.png" class="bExp_barLine">
					
					<div id="bExplain03">
						<div class="bExp_TextNum">
							03.
						</div>
						<div class="bExp_TextTitle03">
							환경 보호를 위한 노력
						</div>
						<div class="bExp_TextSub03">
							Environmental Sustainability
						</div>
						<div class="bExp_TextInfo03">
							샐러드림에서 사용하는 테이크아웃 용기와 포장지는 재활용이 가능한 종이로 만들어졌으며, 매장 내 일회용품 사용을 점차적으로 줄이기위해 노력합니다.
						</div>
					</div>
				</div>
				
			</div>

			<div id="brand_conWrap02">
				<!-- contentWrap -->
				<div id="brand_manage">
					<div class="bMan_Text01">사회발전에 기여하는 샐러드림의 경영</div>
					<div class="bMan_Text02">고객에게 맛과 서비스를, 창업자에게는 놀은 수익을 줄 주 있는 프랜차이즈 기업실현</div>
					<div id="bManage01">
						<ul>
						<li>
						<div class="bManage01_Con01">
							<img alt="" src="../b_img/brand_Mcon01.png" class="bMCon01_Image01">
							<div class="bMCon01_Text01">고객만족 실현</div>
						</div>
						</li>
						<li>
						<div class="bManage01_Con01">
							<img alt="" src="../b_img/brand_Mcon02.png" class="bMCon01_Image02">
							<div class="bMCon01_Text02">점주편의 및 수익성 강화</div>
						</div>
						</li>
						<li>
						<div class="bManage01_Con01">
							<img alt="" src="../b_img/brand_Mcon03.png" class="bMCon01_Image03">
							<div class="bMCon01_Text03">사회발전 기여</div>
						</div>
						</li>
						</ul>
					</div>
				</div>
				<div id="brand_road">
					<div id="bRoad_title01">
						찾아오시는 길
					</div>
					<div id="bRoad_roadMap01">
						<img alt="" src="../b_img/brand_tempRoad.png">
					</div>
					<div id="bRoad_addr01">
						주소 : 서울특별시 가나구 다라마바사로 11 1층<br>
						전화 번호 : 02-000-0000<br>
						이메일 : saladream@naver.com
					</div>
					
					<div id="bRoad_under">
						<div id="bRoad_subway">
							<div id="bRSubway">
								<span class="bRoad_useText01">|</span>
								<span class="bRoad_useText02">지하철 이용시</span>
								<div class="bRoad_useText03">
									2호선 가나역에서 하차<br>
									2번출구 : 스타벅스 앞&nbsp;&nbsp; 좌회전&nbsp;&nbsp; 300m직진(3블럭, 도보 10분 소요)&nbsp;&nbsp; 가나시티 내 서울디자인진흥원<br>
									4번출구 : 가나월드 센텀 앞&nbsp;&nbsp; 우회전&nbsp;&nbsp; 300m직진(3블럭, 도보 10분 소요)&nbsp;&nbsp; 가나시티 내 서울디자인 진흥원
								</div>
							</div>
						</div>
						<div id="bRoad_bus">
							<div>
								<span class="bRoad_useText01">|</span>
								<span class="bRoad_useText02">버스 이용시</span>
								<div class="bRoad_useText03">
									- 센텀시티역 하차: 1001, 1002, 139, 141, 155, 36, 39, 40, 5, 5-1, 63<br>
									- 삼성홈플러스 하차 : 100-1, 31, 115-1, 307, 200, 100<br>
									- 센텀벤처타운 하차 : 181
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
</body>
</html>