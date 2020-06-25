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
function idNP()
{location = "member.jsp?id=";}

function idP()
{location = "login.jsp";}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% 
String id = request.getParameter("id");
String id_check = "";
String state = "idPs";


try {
	Connection con = DBCon.DBConnection();
	Statement st = con.createStatement();
		
	String sql = "SELECT * FROM dbproject2.member";
	ResultSet rs = st.executeQuery(sql);
	
	while(rs.next()) {	
		id_check = rs.getString("id");
		
		if (id.equals(id_check)) {
			state = "idNP";
			break;
		}
	}
	
	//id 중복
	if(state.equals("idNP")) {
		%>
		<body onLoad="setTimeout('idNP()', 3000)">
		<h1>ID 중복 확인 결과</h1>
		<hr>
		<h3>회원가입 실패!</h3>
		중복된 ID가 존재합니다.
		3초 뒤 회원가입 페이지로 이동합니다.
		<%
	}
	
	//회원가입 완료
	else if(state.equals("idP")) {
		%>
		<body onLoad="setTimeout('idP()', 3000)">
		<h1>ID 중복 확인 결과</h1>
		<hr>
		<h3>회원가입 완료!</h3>
		비밀번호가 일치하지 않습니다.
		3초 뒤 로그인 페이지로 이동합니다.
		<%	
	}
	
	rs.close();
	st.close();
	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>