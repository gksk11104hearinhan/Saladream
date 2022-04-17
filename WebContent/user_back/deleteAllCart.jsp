<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
		//1. con연결
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. db연결
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		Connection con = DriverManager.getConnection(url, user, password);
		
		String cno01 = session.getId();
		String caseNo = request.getParameter("case");
		
		String sql = "delete from cart where cno01 = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, cno01);
		
		ps.executeUpdate();    		
		
		if(caseNo != null){
			out.print("<script>alert('상품 주문이 완료되었습니다.')</script>");
			out.print("<script>location.href= './index.jsp'</script>");
		}
		
		else {
			out.print("<script>alert('장바구니 내용을 삭제하였습니다.')</script>");
			out.print("<script>location.href= './index.jsp'</script>");
		}
		
		
    %>
 

