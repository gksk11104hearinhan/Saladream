<%@page import="saladream.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>update Member �Ķ���� ������</title>
</head>
<body>
	<!--1. �������� �޾Ƽ� dto�� �ִ´�:�׼��±� ó��  -->
	<jsp:useBean id="dto" class="saladream.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	<!--2. dto�� dao��ü�� insert()�޼ҵ��� �Է°�����!  -->
	<%
	
		String oriid = request.getParameter("oriid");
		MemberDAO dao = new MemberDAO();
		dao.update(dto, oriid);
		
		String msg = "ȸ�������� �����Ǿ����ϴ�.";
		String location = "mypage.jsp";
		
		/* String msg = "ȸ�����Կ� �����߽��ϴ�.";
		String location = "join.jsp";
		if(result) {
			msg = "ȸ�����Կ� �����ϼ̽��ϴ�!";
			location = "login.jsp";
		} */
	%>
	
	<script>
		alert("<%=msg %>");
		location.href="<%=location %>";
	</script>

</body>
</html>