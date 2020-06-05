<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</head>
<body>
<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <p class="navbar-brand">条件搜索：</p>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <form class="navbar-form navbar-left" action="bookSearch.jsp" method="post">
        <div class="form-group">
	        <select name="sel"  class="form-control">
					<option value="ID">图书编号</option>
					<option value="NAME">图书名称</option>
					<option value="AUTHOR">图书作者</option>
					<option value="LIBRARY_ID">图书馆编号</option>
					<option value="SORT_ID">图书分类编号</option>
					<option value="POSITION">位置</option>
					<option value="STATUS">状态</option>
					<option value="DESCRIPTION">描述</option>
			</select>
          <input type="text" class="form-control" placeholder="Search" name="inf">
        </div>
        <button type="submit" class="btn btn-default">查询</button>
      </form>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</body>
</html>