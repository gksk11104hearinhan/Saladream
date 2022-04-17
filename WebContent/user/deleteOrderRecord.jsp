<%@page import="saladream.OrderInfoDAO"%>
<%@page import="saladream.OrderInfoDTO"%>
<%@page import="saladream.MyPageDTO"%>
<%@page import="saladream.MyPageDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	//ÀÎÄÚµù
	request.setCharacterEncoding("UTF-8");

	if(session.getAttribute("id") ==null) {
		response.sendRedirect("./login.jsp");
		return;
	}
	if(request.getParameter("ordNo") == null){
		response.sendRedirect("./index.jsp");
		return;
	}
	
	String id = session.getId();
	String ono = request.getParameter("ordNo");
	
	OrderInfoDTO oDto = new OrderInfoDTO();
	oDto.setId(id);
	oDto.setOno(ono);
	
	OrderInfoDAO oDao = new OrderInfoDAO();
	oDao.delete(oDto);
	
	response.sendRedirect("./mypage.jsp");
%>