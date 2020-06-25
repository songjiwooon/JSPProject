package com.hanshin.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@WebServlet("/memberform")
public class memberform extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset = UTF-8");
		PrintWriter out = resp.getWriter();
		
		String mode = req.getParameter("submit");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		String dept = req.getParameter("dept");
		String gender = req.getParameter("gender");
		String birth = req.getParameter("birth");
		String introduction = req.getParameter("introduction");
		
		String id_check = "";
		String name_check = "";
		String state = "";
		
		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://127.0.0.1:3306/dbproject2?serverTimezone=UTC";
		
		try {
			Class.forName(jdbc_driver).newInstance();
			Connection con = DriverManager.getConnection(jdbc_url, "root", "112400ss");
			Statement st = con.createStatement();
			
			String sql = "SELECT * FROM dbproject2.member";
			ResultSet rs = st.executeQuery(sql);
			PreparedStatement pst = con.prepareStatement(sql);
			
			if(mode.equals("수정")) {
				while(rs.next()) {	
					id_check = rs.getString("id");
					name_check = rs.getString("name");
					
					if (id.equals(id_check) && name.equals(name_check)) {
						sql = "UPDATE dbproject2.member SET pwd = ?, tel = ?, email = ?, dept = ?, gender = ?, birth = ?, introduction = ? WHERE (id = ?)";
						pst = con.prepareStatement(sql);
						
						pst.setString(1, pwd);
						pst.setString(2, tel);
						pst.setString(3, email);
						pst.setString(4, dept);
						pst.setString(5, gender);
						pst.setString(6, birth);
						pst.setString(7, introduction);
						pst.setString(8, id);
						pst.executeUpdate();
						break;
					}
				}
				resp.sendRedirect("edit.jsp");
			}
			
			if(mode.equals("전송")) {
				while(rs.next()) {	
					id_check = rs.getString("id");
					
					if (id.equals(id_check)) {
						JOptionPane.showMessageDialog(null, "아이디가 중복입니다. 다시 시도하세요.");
						resp.sendRedirect("member.jsp");
					}
					else if (!id.equals(id_check)) state = "idP";
				}
				if(state.equals("idP")) {
					sql = "INSERT INTO dbproject2.member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
					pst = con.prepareStatement(sql);
					pst.setString(1, id);
					pst.setString(2, pwd);
					pst.setString(3, name);
					pst.setString(4, tel);
					pst.setString(5, email);
					pst.setString(6, dept);
					pst.setString(7, gender);
					pst.setString(8, birth);
					pst.setString(9, introduction);
					pst.executeUpdate();

					resp.sendRedirect("login.jsp");
				}
			}
			
			pst.close();
			rs.close();
			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		out.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
}
