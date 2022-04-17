<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>Insert title here</title>
	<script language="javascript">
	function moveClose() {
	  opener.location.href="swiper.jsp";
	  self.close();
	}
	</script>

</head>
<body onload="window.resizeTo(400,200)">
	팝업 창 열림
	<br>
	<input type="button" value="닫 기" onclick="self.close();"/>
	<input type="button" value="이동 후 닫기" onclick="moveClose();" />
	
	<br>
	 <%= nowTime %>
	<br>-------------------------------------------------------------------<br>
	 <%= sf.format(nowTime) %>

</body>
</html>