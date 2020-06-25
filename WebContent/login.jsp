<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>DBP 학생관리</h3>
<hr>
<form name="yourname" action="output.jsp" method="post">
사용자 ID : <input type="text" size="15" value="" name="id"><br>
비밀 번호 : <input type="password" size="15" value="" name="pwd"><br>
           <input type="submit" value="로그인" name="signin" />
           <input type="button" value="가입" onclick="location.href='member.jsp?id='" />
</form>
</body>
</html>