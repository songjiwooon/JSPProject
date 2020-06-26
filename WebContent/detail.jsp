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
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>    
        #visual .content-container{	
            height:inherit;
            display:flex; 
            align-items: center;
        }
    </style>
</head>
<body>
<div id="body">
		<div class="content-container clearfix">
		<main class="main">
			<h2 class="main title">학생 상세 정보</h2>
			
			<div class="notice margin-top">				
				<%
					int i = 1;
					request.setAttribute("state", "Default");
					
					try {
						Connection con = DBCon.DBConnection();
						Statement st = con.createStatement();
							
						String sql = "SELECT * FROM dbproject2.member";
						ResultSet rs = st.executeQuery(sql);

						while(rs.next()) {
							if(request.getParameter("id").equals(rs.getString("id"))) {
								%>
				<table bgcolor="#000000" cellpadding="5" cellspacing="1" border="0" align="left" style="text-align:left">
				<tr><td width="20%" bgcolor="#cacaca">아이디</td><td width="*" bgcolor="#ffffff"><%= rs.getString("id") %></td>
				<tr><td width="20%" bgcolor="#cacaca">이름</td><td width="*" bgcolor="#ffffff"><%= rs.getString("name") %></td></tr>
				<tr><td width="20%" bgcolor="#cacaca">전화번호</td><td width="*" bgcolor="#ffffff"><%= rs.getString("tel") %></td></tr>
				<tr><td width="20%" bgcolor="#cacaca">이메일</td><td width="*" bgcolor="#ffffff"><%= rs.getString("email") %></td></tr>
				<tr><td width="20%" bgcolor="#cacaca">학과</td><td width="*" bgcolor="#ffffff"><%= rs.getString("dept") %></td></tr>
				<tr><td width="20%" bgcolor="#cacaca">성별</td><td width="*" bgcolor="#ffffff"><%= rs.getString("gender") %></td></tr>
				<tr><td width="20%" bgcolor="#cacaca">태어난 달</td><td width="*" bgcolor="#ffffff"><%= rs.getString("birth") %></td></tr>
				<tr><td width="20%" bgcolor="#cacaca">자기소개</td><td width="*" bgcolor="#ffffff"><%= rs.getString("introduction") %></td></tr>
				<tr><td></td><td>
			<input type="button" value="목록" onclick="location.href='list.jsp?state=Default'" />
			<input type="button" value="수정" onclick="location.href='pwcheck.jsp?id=<%= rs.getString("id") %>'" /></td></tr>
				</table>
				<% 
							}
						}
				rs.close();
				st.close();
				con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
			</div>
		</main>
		
			
		</div>
	</div>
</body>
</html>