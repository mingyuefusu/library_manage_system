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
<div style="width:98%;height:250px;;" >
	<img src="../public/image/09.jpg"  width="100%" height="250px" style="margin-left:1%;">
</div>
<div class="table-responsive">
  <table class="table table-hover">
			<tr align="center">
				<th>借阅证编号</th>
				<th>密码</th>
				<th>借阅者姓名</th>
				<th>规则编号</th>
				<th>状态</th>
				<th>修改</th>
			</tr>
<%
		request.setCharacterEncoding("utf-8");
		String cardId=session.getAttribute("reader").toString();
		String sql="select*from borrow_card where ID = '"+ cardId +"';";
		ResultSet rs = check.executeQuery(sql);
		while (rs.next()) {
%>
	
			<tr align="center">
			<% int id = rs.getInt(1);%>
				<td><%=rs.getString("ID")%></td>
				<td><%=rs.getString("PASSWORD")%></td>
				<td><%=rs.getString("READER")%></td>
				<td><%=rs.getString("RULE_ID")%></td>
				<td><%=rs.getString("STATE")%></td>
				<td><a onclick="check()" href=<% out.print("10updatePsw.jsp?id="+rs.getInt("ID"));%> class="btn btn-primary">修改密码</a></td>
			</tr>
	
	
<%
		}
 %>
 </table>
 </div>
</body>
</html>