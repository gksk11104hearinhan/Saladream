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
    	//���ڵ�, �۾� �����°� ����
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
        var IMP = window.IMP; // ��������
        IMP.init('imp40075075'); // 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '(��)SalaDream',
            amount : <%=ototalPrice%>,
            buyer_email : '<%=email01%>@<%=email01%>',
            buyer_name : '<%=name%>',
            buyer_tel : '010<%=phone01%><%=phone02%>',
            buyer_addr : '<%=address%>',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] �����ܿ��� �������� ��ȸ�� ���� jQuery ajax�� imp_uid �����ϱ�
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error�� �߻����� �ʵ��� �������ּ���
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //��Ÿ �ʿ��� �����Ͱ� ������ �߰� ����
                    }
                }).done(function(data) {
                    //[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
                    if ( everythings_fine ) {
                        msg = '������ �Ϸ�Ǿ����ϴ�.';
                        msg += '\n����ID : ' + rsp.imp_uid;
                        msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
                        msg += '\���� �ݾ� : ' + rsp.paid_amount;
                        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
                        //[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
                    }
                });
                //������ �̵��� ������
                location.href="./mypage.jsp"
               <%--  location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
            } else {
                msg = '������ �����Ͽ����ϴ�.';
                msg += '�������� : ' + rsp.error_msg;
                //���н� �̵��� ������
                location.href="./index.jsp"
                <%-- location.href="<%=request.getContextPath()%>/order/payFail"; --%>
                alert(msg);
            }
        });
        
    });
    </script> 

</body>
</html>