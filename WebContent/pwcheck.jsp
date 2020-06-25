<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="jsp.db.DBCon" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>본인 여부 확인</h3>
<hr>
<form name="fo" method="get">
사용자 ID : <input type=text value="<% out.print(request.getParameter("id")); %>" name="id" readonly><br>
비밀 번호 : <input type="password" value="" name="pwd"><br>
           <input type="submit" value="수정">           
</form>
</body>

<%
	
	String id_check, pwd_check = "";
	
	try {
		Connection con = DBCon.DBConnection();
		Statement st = con.createStatement();
			
		String sql = "SELECT * FROM dbproject2.member";
		ResultSet rs = st.executeQuery(sql);
		if(!pwd.equals("")){
			while(rs.next()) {	
				id_check = rs.getString("id");
				pwd_check = rs.getString("pwd");
				
				if (id.equals(id_check)) {
					if(pwd.equals(pwd_check)) {
						%>
						<jsp:forward page="Pass.jsp?id=<% out.print(id); %>"></jsp:forward>
						<%
					}
					else if(!pwd.equals(pwd_check)) {
						%>
						<jsp:forward page="NonPass.jsp?id=<% out.print(id); %>"></jsp:forward>
						<%
					}
					break;
				}
			}
		}
		
		rs.close();
		st.close();
		con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
%>
</html>