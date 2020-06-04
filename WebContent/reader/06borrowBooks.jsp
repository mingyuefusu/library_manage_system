<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../public/css/animate.css">
<link rel="stylesheet" href="../public/css/login.css" />
<style>
	th{
		vertical-align: middle !important;
		text-align: center;
	}
</style>
</head>
<body>
<%
	if(session.getAttribute("reader") == null ){
		%>
			<script>
				location.href = "../loginReader.html";
			</script>
		<%
	}
%>
<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
<div class="table-responsive">
  <table class="table table-hover">
			<tr align="center">
				<th>借阅证号</th>
				<th>图书编号</th>
				<th>借阅日期</th>
				<th>截止日期</th>
				<th>归还日期</th>
			</tr>
<%
	try{
		String id = session.getAttribute("reader").toString();
		String sql="select CARD_ID,BOOK_ID,BORROW_DATE,END_DATE,RETURN_DATE from borrow_books where CARD_ID = " + id;
		ResultSet rs = check.executeQuery(sql);
		while (rs.next()) {
%>
	
			<tr align="center">
				<td><%=rs.getString("CARD_ID")%></td>
				<td><%=rs.getString("BOOK_ID")%></td>
				<td><%=rs.getString("BORROW_DATE")%></td>
				<td><%=rs.getString("END_DATE")%></td>
				<td><%=rs.getString("RETURN_DATE")%></td>

			</tr>
	
	
<%
		}
	}catch(Exception e) {

	}
 %>
 </table>
 </div>
</body>
</html>
