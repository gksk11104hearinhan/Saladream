<%@page import="saladream.OrderInfoDTO"%>
<%@page import="saladream.OrderInfoDAO"%>
<%@page import="saladream.OrderProductDTO"%>
<%@page import="saladream.OrderProductDAO"%>
<%@page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

request.setCharacterEncoding("UTF-8");
    String name = (String)request.getParameter("ordrecv");
     String email01 = (String)request.getParameter("ord2email01");
     String email02 = (String)request.getParameter("ordemail02");
     String phone01 = (String)request.getParameter("ordrecvtel01");
     String phone02 = (String)request.getParameter("ordrecvtel02");
     String address = (String)request.getParameter("ordrecvaddr");
     String stotalPrice = (String)request.getParameter("opay");
     int ototalPrice = Integer.parseInt(stotalPrice);
 
%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>

	<%
    	//인코딩, 글씨 깨지는것 방지
    	//request.setCharacterEncoding("UTF-8");
    
    	if(session.getAttribute("id") == null){
    		response.sendRedirect("./login.jsp");
    		return;
    	}
    		
    %>
    <jsp:useBean id="dto1" class="saladream.OrderInfoDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto1"/>
	<jsp:useBean id="dto2" class="saladream.OrderProductDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto2"/>
	
	<%
		System.out.println(dto1);
		System.out.println(dto2);
		
		String ono = new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
		String rand = String.valueOf(((int)(Math.random() * 1000)) + 1);
		
		
		String id = (String)session.getAttribute("id");
		
		
		ono = ono.concat(rand);
		
		dto1.setOno(ono);
		dto1.setId(id);
		
		dto2.setOno(ono);
		
		OrderInfoDAO dao1 = new OrderInfoDAO();
		OrderProductDAO dao2 = new OrderProductDAO();
		
		dao1.insert(dto1);
		dao2.insert(dto2);
	
	%>
	
	<script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp40075075'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '(주)SalaDream',
            amount : <%=ototalPrice%>,
            buyer_email : '<%=email01%>@<%=email01%>',
            buyer_name : '<%=name%>',
            buyer_tel : '010<%=phone01%><%=phone02%>',
            buyer_addr : '<%=address%>',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href="./mypage.jsp"
               <%--  location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="./index.jsp"
                <%-- location.href="<%=request.getContextPath()%>/order/payFail"; --%>
                alert(msg);
            }
        });
        
    });
    </script> 

</body>
</html>