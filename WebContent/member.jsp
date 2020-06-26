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
</head>
<%
//detail에서 수정을 누르고 pwcheck를 거쳐 인증이 확인되면 보는 화면
if(!request.getParameter("id").equals("")) {
%>
	<body>
	<%
	String id = request.getParameter("id");
	String id_check = "";
	
	try {
		Connection con = DBCon.DBConnection();
		Statement st = con.createStatement();
			
		String sql = "SELECT * FROM dbproject2.member";
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next()) {	
			id_check = rs.getString("id");
			
			if (id.equals(id_check)) {
				%>
			    <form action="memberform" method=get>
			    <table width="700">
					<tr>
					 <th>회 원 정 보 수 정
					 </th>
					</tr>
					<tr>
					 <td>
					  <table width="100%" bgcolor="#000000" cellpadding="5" cellspacing="1" border="0">
					  <tr>
					   <td width="20%" bgcolor="#cacaca">
					    &nbsp;아이디
					   </td>
					   <td width="*" bgcolor="#ffffff">
					    <input type="text" value="<%= request.getParameter("id") %>" name="id" readonly />
					   </td>
					  </tr>
					  
					  <tr>
					   <td width="20%" bgcolor="#cacaca">
					    &nbsp;비밀번호
					   </td>
					   <td width="*" bgcolor="#ffffff">
					    <input type="password" value="<%= rs.getString("pwd") %>" name="pwd" />
					   </td>
					  </tr>
					  
					  <tr>
					   <td width="20%" bgcolor="#cacaca">
					    &nbsp;이름
					   </td>
					   <td width="*" bgcolor="#ffffff">
					    <input type="text" value="<%= rs.getString("name") %>" name="name" readonly />
					   </td>
					  </tr>
					  
					  <tr>
					   <td width="20%" bgcolor="#cacaca">
					    &nbsp;전화번호
					   </td>
					   <td width="*" bgcolor="#ffffff">
					    <input type="text" value="<%= rs.getString("tel") %>" name="tel" />
					   </td>
					  </tr>
					  
					  <tr>
					   <td width="20%" bgcolor="#cacaca">
					    &nbsp;이메일
					   </td>
					   <td width="*" bgcolor="#ffffff">
					    <input type="text" value="<%= rs.getString("email") %>" name="email" />
					   </td>
					  </tr>
					  
					  <tr>
					   <td width="20%" bgcolor="#cacaca">
					    &nbsp;학부
					   </td>
					   <td width="*" bgcolor="#ffffff">
					    <select name="dept">
			                 <option value="Computer"> 컴퓨터공학부
			                 <option value="Information"> 정보통신학부
			                 <option value="Itcontents"> IT콘텐츠학과
			                 <option value="Korean"> 국어국문학과
			              </select>
					   </td>
					  </tr>
					  
					  <tr>
					   <td width="20%" bgcolor="#cacaca">
					    &nbsp;성별
					   </td>
					   <td width="*" bgcolor="#ffffff">
					    <input type="radio"  name="gender"  value="male" checked />남자 
			            <input type="radio"  name="gender"  value="female" />여자
					   </td>
					  </tr>
					  
					  <tr>
					   <td width="20%" bgcolor="#cacaca">
					    &nbsp;생월
					   </td>
					   <td width="*" bgcolor="#ffffff">
					    <select name="birth">
			                 <option value="January"> 1월
			                 <option value="February"> 2월
			                 <option value="March"> 3월
			                 <option value="April"> 4월
			                 <option value="May"> 5월
			                 <option value="June"> 6월
			                 <option value="July"> 7월
			                 <option value="August"> 8월
			                 <option value="September"> 9월
			                 <option value="October"> 10월
			                 <option value="November"> 11월
			                 <option value="December"> 12월
			              </select>
					   </td>
					  </tr>
					  
					  <tr>
					   <td width="20%" bgcolor="#cacaca">
					    &nbsp;자기소개
					   </td>
					   <td width="*" bgcolor="#ffffff">
					    <textarea cols="30" rows="10" name="introduction"><%= rs.getString("introduction") %></textarea>
					   </td>
					  </tr>
					  
					  <tr>
					   <td>
					    <input type="submit" name="submit" value="수정" />
					   </td>
					  </tr>
					  
					  </table>		
					 </td>
					</tr>
				</table>
			    </form>
			</body>
			<%
			break;
			}
		}
	rs.close();
	st.close();
	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//회원가입 시 보는 화면
else {
	%>
	<body>
	    <form action="memberform" method=get>
	    <table width="700">
			<tr>
			 <th>회 원 가 입
			 </th>
			</tr>
			<tr>
			 <td>
			  <table width="100%" bgcolor="#000000" cellpadding="5" cellspacing="1" border="0">
			  <tr>
			   <td width="20%" bgcolor="#cacaca">
			    &nbsp;아이디
			   </td>
			   <td width="*" bgcolor="#ffffff">
			    <input type="text" name="id" />
			   </td>
			  </tr>
			  
			  <tr>
			   <td width="20%" bgcolor="#cacaca">
			    &nbsp;비밀번호
			   </td>
			   <td width="*" bgcolor="#ffffff">
			    <input type="password" name="pwd" />
			   </td>
			  </tr>
			  
			  <tr>
			   <td width="20%" bgcolor="#cacaca">
			    &nbsp;이름
			   </td>
			   <td width="*" bgcolor="#ffffff">
			    <input type="text" name="name" />
			   </td>
			  </tr>
			  
			  <tr>
			   <td width="20%" bgcolor="#cacaca">
			    &nbsp;전화번호
			   </td>
			   <td width="*" bgcolor="#ffffff">
			    <input type="text" name="tel" />
			   </td>
			  </tr>
			  
			  <tr>
			   <td width="20%" bgcolor="#cacaca">
			    &nbsp;이메일
			   </td>
			   <td width="*" bgcolor="#ffffff">
			    <input type="text" name="email" />
			   </td>
			  </tr>
			  
			  <tr>
			   <td width="20%" bgcolor="#cacaca">
			    &nbsp;학부
			   </td>
			   <td width="*" bgcolor="#ffffff">
			    <select name="dept">
	                 <option value="Computer"> 컴퓨터공학부
	                 <option value="Information"> 정보통신학부
	                 <option value="Itcontents"> IT콘텐츠학과
	                 <option value="Korean"> 국어국문학과
	              </select>
			   </td>
			  </tr>
			  
			  <tr>
			   <td width="20%" bgcolor="#cacaca">
			    &nbsp;성별
			   </td>
			   <td width="*" bgcolor="#ffffff">
			    <input type="radio"  name="gender"  value="male" checked />남자 
	            <input type="radio"  name="gender"  value="female" />여자
			   </td>
			  </tr>
			  
			  <tr>
			   <td width="20%" bgcolor="#cacaca">
			    &nbsp;생월
			   </td>
			   <td width="*" bgcolor="#ffffff">
			    <select name="birth">
	                 <option value="January"> 1월
	                 <option value="February"> 2월
	                 <option value="March"> 3월
	                 <option value="April"> 4월
	                 <option value="May"> 5월
	                 <option value="June"> 6월
	                 <option value="July"> 7월
	                 <option value="August"> 8월
	                 <option value="September"> 9월
	                 <option value="October"> 10월
	                 <option value="November"> 11월
	                 <option value="December"> 12월
	              </select>
			   </td>
			  </tr>
			  
			  <tr>
			   <td width="20%" bgcolor="#cacaca">
			    &nbsp;자기소개
			   </td>
			   <td width="*" bgcolor="#ffffff">
			    <textarea cols="30" rows="10" name="introduction"></textarea>
			   </td>
			  </tr>
			  
			  <tr>
			   <td>
			    <input type="submit" name="submit" value="전송" />
			   </td>
			  </tr>
			  
			  </table>		
			 </td>
			</tr>
		</table>
	    </form>
	</body>
	
	<%
}
%>
</html>