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

</style>
</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
			     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        			<span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
     			</button>
				<a class="navbar-brand" href="#">欢迎登陆图书管理系统</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
        			<li><p style="margin-top:25%;color:grey;">借阅者页面<span class="sr-only">(current)</span></p></li>
				</ul>
				
				
				<ul class="nav navbar-nav navbar-right">
					<li><a href="javascript:;">
					<%if(session.getAttribute("reader")==null){ 
						
					} else{%>
         				<%=session.getAttribute("reader") %>
         				<%} %>
        			</a></li>
				    <%if(session.getAttribute("reader") !=null) {%>
					<li><a href="./exit" target="_parent">退出</a></li>
					<%}else{%>
					<li><a href="04readerFrame.jsp" target="_parent" onClick="">登录</a></li>	
					<%}
					%>
					
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>