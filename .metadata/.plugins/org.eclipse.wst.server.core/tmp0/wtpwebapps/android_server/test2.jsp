<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String uploadPath = application.getRealPath("upload");
	System.out.println(uploadPath);

	String str1 = request.getParameter("content_board_idx");
	int content_board_idx = Integer.parseInt(str1);
	
	String str2 = request.getParameter("content_writer_idx");
	int content_writer_idx = Integer.parseInt(str2);
	
	String content_subject = request.getParameter("content_subject");
	String content_text = request.getParameter("content_text");
	
	String dbUrl = "jdbc:mysql://localhost:3306/android";
	String dbId = "root";
	String dbPw = "whdgns1002@";
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
	String sql = "insert into content_table "
				+ "(content_board_idx, content_writer_idx, content_subject, "
				+ " content_writer_date, content_text) "
				+ "values (?, ?, ?, now(), ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, content_board_idx);
	pstmt.setInt(2, content_writer_idx);
	pstmt.setString(3, content_subject);
	pstmt.setString(4, content_text);
	
	pstmt.execute();
	
	conn.close();
%>