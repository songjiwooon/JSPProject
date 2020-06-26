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
    <style>    
        #visual .content-container{	
            height:inherit;
            display:flex; 
            align-items: center;
        }
    </style>
</head>

<body>
    <!-- --------------------------- <body> --------------------------------------- -->
	<div id="body">
		<div class="content-container clearfix">
		<main class="main">
			<h2 class="main title">DBP 학생 목록</h2>
			
			<div class="notice margin-top">				
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>ID</th>
							<th>&nbsp;이름</th>
							<th>&nbsp;전화번호</th>
							<th>&nbsp;이메일</th>
							<th>&nbsp;학과</th>
							<th>&nbsp;성별</th>
							<th>&nbsp;생월</th>
							<th>&nbsp;자기소개</th>
						</tr>
					</thead>
					<tbody>
					<%
					int i = 1;
					request.setAttribute("state", "Default");
					
					try {
						Connection con = DBCon.DBConnection();
						Statement st = con.createStatement();
							
						String sql = "SELECT * FROM dbproject2.member";
						ResultSet rs = st.executeQuery(sql);

						while(rs.next()) {
							if(request.getParameter("state").equals(rs.getString("dept")) || request.getParameter("state").equals("Default")) {
								%>
								<tr>
									<td><% out.print(i); %></td>
									<td><a href="detail.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("id") %></a></td>
									<td>&nbsp;&nbsp; <%= rs.getString("name") %></td>
									<td>&nbsp;&nbsp; <%= rs.getString("tel") %></td>
									<td>&nbsp;&nbsp; <%= rs.getString("email") %></td>
									<td>&nbsp;&nbsp; <%= rs.getString("dept") %></td>
									<td>&nbsp;&nbsp; <%= rs.getString("gender") %></td>
									<td>&nbsp;&nbsp; <%= rs.getString("birth") %></td>
									<td>&nbsp;&nbsp; <%= rs.getString("introduction") %></td>												
								</tr>
								<%
								i++;
							}
						}
						
						rs.close();
						st.close();
						con.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
					</tbody>
				</table>
			</div>
			
			<div class="search-form margin-top first align-right">
			<br>	
				<form action=list.jsp method=get>
					<fieldset>
						<legend class="hidden">학생 분류</legend>
						<label class="hidden">학과</label>
						<select name="state">
							<option  value="Default">전체</option>
							<option  value="Computer">컴퓨터공학부</option>
							<option  value="Information">정보통신학부</option>
							<option  value="Itcontents">IT콘텐츠학과</option>
							<option  value="Korean">국어국문학과</option>							
						</select> 
						<input type="submit" value="검색" />
					</fieldset>
				</form>
			</div>
		</main>
		
			
		</div>
	</div>

    </body>
    
    </html>