<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script language="JavaScript">
function NP()
{location = "pwcheck.jsp?id=<%out.print(request.getParameter("id"));%>";}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onLoad="setTimeout('NP()', 3000)">
		<h1>본인 여부 확인 결과</h1>
		<hr>
		<h3>비밀번호가 다릅니다.</h3>
		3초 뒤 이전 페이지로 이동합니다.
</body>
</html>