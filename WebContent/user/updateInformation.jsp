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
	<title>update Member 파라미터 페이지</title>
</head>
<body>
	<!--1. 서버에서 받아서 dto에 넣는다:액션태그 처리  -->
	<jsp:useBean id="dto" class="saladream.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	<!--2. dto를 dao객체의 insert()메소드의 입력값으로!  -->
	<%
	
		String oriid = request.getParameter("oriid");
		MemberDAO dao = new MemberDAO();
		dao.update(dto, oriid);
		
		String msg = "회원정보가 수정되었습니다.";
		String location = "mypage.jsp";
		
		/* String msg = "회원가입에 실패했습니다.";
		String location = "join.jsp";
		if(result) {
			msg = "회원가입에 성공하셨습니다!";
			location = "login.jsp";
		} */
	%>
	
	<script>
		alert("<%=msg %>");
		location.href="<%=location %>";
	</script>

</body>
</html>