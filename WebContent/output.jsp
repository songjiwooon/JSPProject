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
function login()
{location = "login.jsp";}

function list()
{location = "list.jsp?state=Default";}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% 
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String id_check = "";
String pwd_check = "";
String state = "idNPpwdNP";

int count = 0;

try {
	Connection con = DBCon.DBConnection();
	Statement st = con.createStatement();
		
	String sql = "SELECT * FROM dbproject2.member";
	ResultSet rs = st.executeQuery(sql);
	
	while(rs.next()) {	
		id_check = rs.getString("id");
		pwd_check = rs.getString("pwd");
		
		if (id.equals(id_check)) {
			if(pwd.equals(pwd_check)) {
				state = "idPpwdP";
			}
			else if(!pwd.equals(pwd_check)) {
				state = "idPpwdNP";
			}
			break;
		}
		count++;
	}
	
	//id 일치, pwd 일치
	if(state.equals("idPpwdP")) {
		%>
		<body onLoad="setTimeout('list()', 3000)">
		<h1>본인 여부 확인 결과</h1>
		<hr>
		<h3>로그인 성공!</h3>
		3초 뒤 학생 목록 페이지로 이동합니다.
		<%
	}
	
	//id 일치, pwd 불일치
	else if(state.equals("idPpwdNP")) {
		%>
		<body onLoad="setTimeout('login()', 3000)">
		<h1>본인 여부 확인 결과</h1>
		<hr>
		<h3>로그인 실패!</h3>
		비밀번호가 일치하지 않습니다.
		3초 뒤 로그인 페이지로 이동합니다.
		<%	
	}
	
	//id 없음
	else if(state.equals("idNPpwdNP")) {
		%>
		<body onLoad="setTimeout('login()', 3000)">
		<h1>본인 여부 확인 결과</h1>
		<hr>
		<h3>로그인 실패!</h3>
		존재하지 않는 ID입니다.
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