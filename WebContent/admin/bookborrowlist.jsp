<%@page import="javabean.Util"%>
<%@page import="javabean.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书籍借阅历史</title>
<link rel="stylesheet" href="../public/layui/css/layui.css"  media="all">
<script src="../public/layui/layui.js" charset="utf-8"></script>
  <style>
    .layui-table, .layui-table-view{
    	margin-top: 0px;
    }
  </style>
</head>
<body>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet resultSet = null;
	String sql = "select * from borrow_books,borrow_card where book_id=? and card_id=borrow_card.id order by borrow_books.id desc";
	connection = (Connection)Base.getConnection();
	pstmt = connection.prepareStatement(sql);
	pstmt.setString(1,id);
	resultSet = pstmt.executeQuery();
/*	while(resultSet.next()){
		out.print(resultSet.getString("id"));
	}*/
%>
<div class="layui-form">
  <table class="layui-table">
    <colgroup>
      <col width="150">
      <col width="150">
      <col width="200">
      <col width="200">
      <col width="200">
      <col width="200">
      <col width="220">
      <col width="200">
      <col width="200">
    </colgroup>
    <thead>
      <tr>
        <th>ID</th>
        <th>书籍ID</th>
        <th>书籍名</th>
        <th>借阅证</th>
        <th>借阅者</th>
        <th>借阅时间</th>
        <th>归还时间</th>
        <th>违规信息</th>
        <th>处理人</th>
      </tr>
      <%while(resultSet.next()){ %>
      <tr>
      	<td><%=resultSet.getString("id") %></td>
      	<td><%=id %></td>
      	<td><%=name %></td>
      	<td><%=resultSet.getString("borrow_card.id") %></td>
      	<td><%=resultSet.getString("reader") %></td>
      	<td><%=Util.getFormatDateTime(resultSet.getString("borrow_date")) %></td>
      	<td><%=resultSet.getString("return_date") != null? Util.getFormatDateTime(resultSet.getString("return_date")) : "" %></td>
      	<td><%=resultSet.getString("illegal") != null? resultSet.getString("illegal") : "" %></td>
      	<td><%=resultSet.getString("manager_id") != null? resultSet.getString("manager_id") : ""  %></td>
      </tr> 
      <%} %>
    </thead>
    <tbody>
 	  <tr>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>