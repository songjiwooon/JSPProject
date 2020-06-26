<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="jsp.db.DBCon" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script language="JavaScript">
function edit()
{location = "detail.jsp?id=<%=request.getParameter("id")%>";}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
		<body onLoad="setTimeout('edit()', 3000)">
		<h1>수정 결과</h1>
		<hr>
		<h3>학생 정보 수정 완료!</h3>
		3초 뒤 학생 상세 정보 페이지로 이동합니다.
</body>
</html>