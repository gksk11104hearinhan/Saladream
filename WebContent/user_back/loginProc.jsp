<%@page import="saladream.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>loginProc_�α��� �Ķ���� ������</title>
</head>
<body>
	<%-- <%
		String url = "jdbc:mysql://localhost:3306/saladream";
		String user = "root";
		String password = "123456";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String sql = "select * from memer where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			if(pw.equals(rs.getString("pw")))
			{
				session.setAttribute("id", id);
				response.sendRedirect("index.jsp"); //  <jsp:forward page="index.jsp"/> 
			}
			else {
				
				%>
				<script>
					alert("��й�ȣ�� �߸��Ǿ����ϴ�.");
					lacation.href="login.jsp";
				</script>
				<%
			}
		} else {
			%>
			<script>
				alert("�������� �ʴ� ���̵� �Դϴ�.");
				lacation.href="login.jsp";
			</script>
			<%
		}
				
	%> --%>
	
	
	<jsp:useBean id="dto" class="saladream.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	<%
		MemberDAO dao = new MemberDAO();
		boolean result = dao.login(dto);
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String url = "login.jsp";
		String msg = "�α��ο� �����Ͽ����ϴ�.";
		
		if(result) {
			session.setAttribute("id", id);
			msg = "�α��ο� �����߽��ϴ�";
		}
		
	%>
	
	 <jsp:forward page="index.jsp"/>
	
</body>
</html>