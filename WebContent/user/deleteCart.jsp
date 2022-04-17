<%@page import="saladream.CartDAO"%>
<%@page import="saladream.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
		//인코딩, 글씨 깨지는것 방지
		request.setCharacterEncoding("UTF-8");
	
		if(session.getAttribute("id") == null){
			response.sendRedirect("./login.jsp");
			return;
		}
		if(request.getParameter("prdNo") == null){
			response.sendRedirect("./index.jsp");
			return;
		}
		
		String cno01 = session.getId();
		String product_no01 = request.getParameter("prdNo");
		
		CartDTO cDto = new CartDTO();
		cDto.setCno01(cno01);
		cDto.setProduct_no01(product_no01);
		
		CartDAO cDao = new CartDAO();
		cDao.delete(cDto);
		
		response.sendRedirect("./order.jsp");
		
    %>
 

