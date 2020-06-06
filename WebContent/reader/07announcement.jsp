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
	body{
		font-family:YouYuan;
	}
</style>
</head>
<body>
 <div style="background: steelblue;height: 30px;;color:#fff;border-radius: 8px;width: 90%;margin:auto auto;">
<marquee style="font-size:20px;font-family:YouYuan;" behavior="scroll" direction="left"  hspace="0.1%" vspace="0.1%" loop="-1" scrollamount="20" scrolldelay="100" onMouseOut="this.start()" onMouseOver="this.stop()">
    ❤图书馆公告栏，记得查收公告呀！❤
</marquee> 
</div>

<div class="a" align="center">
	
		<h2>近期公告</h2>

<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
<%
		String sql="select*from announcement";
		ResultSet rs = check.executeQuery(sql);
		while (rs.next()) {

%>
	<div class="panel panel-info"  style="margin-left:5%;width:80%;">
		<div class="panel-heading" align="center">
		    <span><%=rs.getString("TITLE") %></span>
		    <span style="margin-right:1%;"><%=rs.getString("PUBLISH_DATE") %></span>
		</div>
		<div class="panel-body" >
			<p style="word-wrap:break-word;"><%=rs.getString("DETAIL") %></p>
		
		</div>
	</div>
<%
		}
		
 %>

</div>
</body>
</html>