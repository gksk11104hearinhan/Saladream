<%@page import="saladream.OrderInfoDTO"%>
<%@page import="saladream.OrderInfoDAO"%>
<%@page import="saladream.OrderProductDTO"%>
<%@page import="saladream.OrderProductDAO"%>
<%@page import="saladream.CartDAO"%>
<%@page import="saladream.CartDTO"%>
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
		String cno01 = session.getId();
		
		ono = ono.concat(rand);
		
		dto1.setOno(ono);
		dto1.setId(id);
		
		OrderInfoDAO dao1 = new OrderInfoDAO();
		
		dao1.insert(dto1);
		
		CartDAO cartDao = new CartDAO();
		OrderProductDAO opDao = new OrderProductDAO();
		
		
		List<OrderProductDTO> opDto = cartDao.select(cno01);
		
		for(OrderProductDTO dto2 : opDto){
			dto2.setOno(ono);
			opDao.insert(dto2);		
		}
		
	%>
	<%
		response.sendRedirect("./deleteAllCart.jsp?case=1");
	%>

