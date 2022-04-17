<%@page import="java.sql.*"%>
<%@page import="saladream.CustomCartDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
		if(session.getAttribute("id") == null){
			response.sendRedirect("./login.jsp");
			return;
		}
    	
		CustomCartDAO ccDao = new CustomCartDAO();	
    
		String cno = session.getId();
		ccDao.delete(cno);
		out.print("<script>location.href= './index.jsp'</script>");
		
    %>
 

