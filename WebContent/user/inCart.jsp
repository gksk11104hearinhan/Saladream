<%@page import="saladream.CartDTO"%>
<%@page import="saladream.CartDAO"%>
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
    <jsp:useBean id="dto" class="saladream.CartDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	<%
		System.out.println(dto);
		
		String c_id = session.getId();
		
		String pno = request.getParameter("pno");
		int productNum = Integer.parseInt(request.getParameter("option03"));
		
		dto.setCno01(c_id);
		dto.setProduct_no01(pno);
		dto.setCproductNum01(productNum);
		
		CartDAO dao = new CartDAO();
		dao.update(dto);
		
		response.sendRedirect("./showCart.jsp");
		//return;
	%>

