<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="../public/css/animate.css">
<link rel="stylesheet" href="../public/css/login.css" />
<link href="../public/css/table.css" rel="stylesheet">
<style>
	div table th{
		vertical-align: middle !important;
		text-align: center;
	}
</style>
</head>
<body>
<jsp:include flush="true" page="searchNav.jsp"></jsp:include>
<jsp:useBean id="search" scope="session" class="javabean.JDBCBean"></jsp:useBean>
<div  class="table-responsive" style="margin-top:-1.5%;">
	<table class="table table-hover">
		<tr align="center">
				<th>图书编号</th>
				<th>图书名称</th>
				<th>图书作者</th>
				<th>图书馆编号</th>
				<th>图书分类编号</th>
				<th>位置</th>
				<th>状态</th>
				<th  class="tab">描述</th>
		</tr>
<%
		String tiaojian = request.getParameter("sel");
		String inf = request.getParameter("inf");
		String sql="select*from books where " + tiaojian + "='" +inf+"';";
		//out.println(sql);
		ResultSet rs = search.executeQuery(sql);
		while (rs.next()) {
%>
	
			<tr align="center">
				<td><%=rs.getString("ID")%></td>
				<td><%=rs.getString("NAME")%></td>
				<td><%=rs.getString("AUTHOR")%></td>
				<td><%=rs.getString("LIBRARY_ID")%></td>
				<td><%=rs.getString("SORT_ID")%></td>
				<td><%=rs.getString("POSITION")%></td>
				<td><%=rs.getString("STATUS")%></td>
				<td><%=rs.getString("DESCRIPTION")%></td>
			</tr>
	
	
<%
		}
 %>
	</table>
</div>
</body>
</html>