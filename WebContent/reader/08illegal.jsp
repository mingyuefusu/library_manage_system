<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ill" scope="session" class="javabean.JDBCBean"></jsp:useBean>
<div class="table-responsive">
  <table class="table table-hover">
			<tr align="center">
				<th>日期</th>
				<th>违章信息</th>
			</tr>
<%
		request.setCharacterEncoding("utf-8");
		String sql="select*from books;";
		ResultSet rs = ill.executeQuery(sql);
		while (rs.next()) {
%>
	
			<tr align="center">
				<td><%=rs.getString("ID")%></td>
				<td><%=rs.getString("NAME")%></td>
				<td><%=rs.getString("LIBRARY_ID")%></td>
				<td><%=rs.getString("SORT_ID")%></td>
				<td><%=rs.getString("POSITION_ID")%></td>
				<td><%=rs.getString("STATE")%></td>
				<td><%=rs.getString("DESCRIPTION")%></td>
			</tr>
	
	
<%
		}
 %>
 </table>
 </div>
</body>
</html>