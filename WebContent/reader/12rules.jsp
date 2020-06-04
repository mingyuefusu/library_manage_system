<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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

<link rel="stylesheet" id="templatecss" type="text/css" href="../public/css/message.css">
<style>
	body{
		background-color:#fff;
		color:black;
	}
</style>
</head>
<body>
<jsp:useBean id="msg" scope="session" class="javabean.JDBCBean"></jsp:useBean>
	
<%		
		String sql = "select * from rules";
		
			ResultSet rs = msg.executeQuery(sql);
		
			while (rs.next()) {
	%>
	<div class="panel panel-info" style="width:50%;height:80%; margin-left:25%;">
		<div class="panel-heading" align="center">
		    <h4>借阅证规则编号：<%=rs.getString("ID") %></h4>
		</div>
		<div class="panel-body">
			<p>可借阅数量：<%=rs.getString("BORROW_NUM") %></p>
			<p>可借阅图书馆：<%=rs.getString("BORROW_LIBRARY") %></p>
			<p>过期扣费/天：<%=rs.getString("OVERTIME_FEE") %></p>
		
		</div>
	</div>


<%
		}
 %>
</body>
</html>