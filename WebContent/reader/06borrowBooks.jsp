<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<style>
	th{
		vertical-align: middle !important;
		text-align: center;
	}
</style>
</head>
<body>
<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
<div class="table-responsive">
  <table class="table table-hover">
			<tr align="center">
				<th>借阅证号</th>
				<th>图书编号</th>
				<th>借阅日期</th>
				<th>截止日期</th>
				<th>归还日期</th>
				<th>违章信息</th>
				<th>处理信息的管理员</th>
			</tr>
<%
		String id = session.getAttribute("reader").toString();
		String sql="select*from borrow_books where CARD_ID = " + id;
		ResultSet rs = check.executeQuery(sql);
		while (rs.next()) {
%>
	
			<tr align="center">
				<td><%=rs.getString("CARD_ID")%></td>
				<td><%=rs.getString("BOOK_ID")%></td>
				<td><%=rs.getString("BORROW_DATE")%></td>
				<td><%=rs.getString("END_DATE")%></td>
				<td><%=rs.getString("RETURN_DATE")%></td>
				<td><%=rs.getString("ILLEGAL")%></td>
				<td><%=rs.getString("MANAGER_ID")%></td>
			</tr>
	
	
<%
		}
 %>
 </table>
 </div>
</body>
</html>