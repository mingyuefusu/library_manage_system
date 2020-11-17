<%@page import="javabean.Util"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javabean.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javabean.JDBCBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>借阅证借阅记录</title>
<link rel="stylesheet" href="../public/layui/css/layui.css"  media="all">
<script src="../public/layui/layui.js" charset="utf-8"></script>
<style>
	.layui-table,.layui-table-view{
		margin: 0 0px;
	}
</style>
</head>
<body>
<%
	String id = request.getParameter("id");
	Connection connection = (Connection)Base.getConnection();
	String sql = "select * from borrow_books,books where card_id=? and borrow_books.book_id = books.id";
	PreparedStatement pstmt = connection.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet resultSet = null;
	resultSet = pstmt.executeQuery();

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
      <col>
    </colgroup>
    <thead>
      <tr>
        <th>ID</th>
        <th>书籍ID</th>
        <th>书籍名</th>
        <th>借阅时间</th>
        <th>截止时间</th>
        <th>归还时间</th>
        <th>违规信息</th>
        <th>处理人</th>
      </tr> 
    </thead>
    <tbody>
    <%
    	System.out.println(Util.getCurrentTimeString());
    %>
	 <% while(resultSet.next()){ %>
	   <%-- 图书超期 --%>
	   <%if(Util.getFormatDateTime(resultSet.getString("end_date")).compareTo(Util.getCurrentTimeString()) < 0 && resultSet.getString("return_date") == null){  %>
	   <tr style="color:#FF5722;">
	   <%} else{ %>
	   <tr>
	   <%} %>
	     <td><%=resultSet.getString("card_id") %></td>
	     <td><%=resultSet.getString("book_id") %></td>
	     <td><%=resultSet.getString("books.name") %></td>
	     <td><%=Util.getFormatDateTime(resultSet.getString("borrow_date")) %></td>
	     <td><%=Util.getFormatDateTime(resultSet.getString("end_date"))%></td>
	     <td><%=resultSet.getString("return_date")!=null?Util.getFormatDateTime(resultSet.getString("return_date")) : "未归还"  %></td>
	     <td><%=resultSet.getString("illegal")!=null?resultSet.getString("illegal"):""%></td>
	     <td><%=resultSet.getString("manager_id")!=null?resultSet.getString("manager_id"):"" %></td>
	   </tr>
	  <%} %>
    </tbody>
  </table>
</div>
</body>
</html>