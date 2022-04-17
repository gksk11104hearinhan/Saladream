<%@page import="saladream.CustomCartDTO"%>
<%@page import="saladream.CustomCartDAO"%>
<%@page import="saladream.OrderInfoDTO"%>
<%@page import="saladream.OrderInfoDAO"%>
<%@page import="saladream.OrderProductDTO"%>
<%@page import="saladream.OrderProductDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    	//인코딩, 글씨 깨지는것 방지
    	request.setCharacterEncoding("UTF-8");
    
    	if(session.getAttribute("id") == null){
    		response.sendRedirect("./login.jsp");
    		return;
    	}
    		
    %>
    <jsp:useBean id="dto1" class="saladream.OrderInfoDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto1"/>
	
	<%
		System.out.println(dto1);
		
		String ono = new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
		String rand = String.valueOf(((int)(Math.random() * 1000)) + 1);
		
		
		String id = (String)session.getAttribute("id");
		ono = ono.concat(rand);
		
		dto1.setOno(ono);
		dto1.setId(id);
		
		CustomCartDAO ccDao = new CustomCartDAO();
		CustomCartDTO ccDto = null;
		ccDto = ccDao.selectCustomCart(session.getId());
		
		if(ccDto == null){
			out.print("<script>alert('주문할 상품이 없습니다!')</script>");
			out.print("<script>location.href='./custom.jsp'</script>");
			return;
		}
		
		OrderProductDTO dto2 = new OrderProductDTO();
		dto2.setOno(ono);
		dto2.setPno(String.valueOf(ccDto.getProduct_no03()));
		dto2.setOproductNum(ccDto.getCproductNum03());
		
		OrderInfoDAO dao1 = new OrderInfoDAO();
		OrderProductDAO dao2 = new OrderProductDAO();
		
		dao1.insert(dto1);
		dao2.insert(dto2);
		
	
	%>
		<script>
			alert('주문이 완료되었습니다!');
			location.href = './deleteCustomCart.jsp';
		</script>		
