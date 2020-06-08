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
.sidebar li a:hover{
	background:#337ab7;
	color:white;
} 
.faq-tabbable li a:focus{
	background:skyblue;
	color:white;
} 
</style>

</head>
<body>

	<div style="text-align:center;width:100%;height:100%;font-size：20px;">
		<ul class="nav nav-pills nav-stacked nav-inverse sidebar faq-tabbable">
		<% if(session.getAttribute("reader")!=null){%>
			<li role="presentation"><a href="01main.jsp" target="view_frame"><span class="glyphicon glyphicon-picture" aria-hidden="true">&nbsp;首页</span></a></li>
			<li role="presentation"><a href="05book.jsp" target="view_frame"><span class="glyphicon glyphicon-search" aria-hidden="true">&nbsp;图书查询</span></a></li>
			<li role="presentation"><a href="12rules.jsp" target="view_frame"><span class="glyphicon glyphicon-bell" aria-hidden="true">&nbsp;读者规则</span></a></li>
			<li role="presentation"><a href="07announcement.jsp" target="view_frame"><span class="glyphicon glyphicon-bullhorn" aria-hidden="true">&nbsp;查看公告</span></a></li>
			<li role="presentation"><a href="index.jsp" target="view_frame"><span class="glyphicon glyphicon-user" aria-hidden="true">&nbsp;个人信息</span></a></li>
			<li role="presentation"><a href="06borrow.jsp" target="view_frame"><span class="glyphicon glyphicon-book" aria-hidden="true">&nbsp;借阅信息</span></a></li>
			<li role="presentation"><a href="08illegalInfo.jsp" target="view_frame"><span class="glyphicon glyphicon-remove" aria-hidden="true">&nbsp;违章信息</span></a></li>
			<li role="presentation"><a href="13message.jsp" target="view_frame"><span class="glyphicon glyphicon-pencil" aria-hidden="true">&nbsp;读者留言</span></a></li>
		<%
			}else{ 
		%>
			<li role="presentation"><a href="01main.jsp" target="view_frame"><span class="glyphicon glyphicon-picture" aria-hidden="true">&nbsp;首页</span></a></li>
			<li role="presentation"><a href="05book.jsp" target="view_frame"><span class="glyphicon glyphicon-search" aria-hidden="true">&nbsp;图书查询</span></a></li>
			<li role="presentation"><a href="12rules.jsp" target="view_frame"><span class="glyphicon glyphicon-bell" aria-hidden="true">&nbsp;读者规则</span></a></li>
			<li role="presentation"><a href="07announcement.jsp" target="view_frame"><span class="glyphicon glyphicon-bullhorn" aria-hidden="true">&nbsp;查看公告</span></a></li>
			<li role="presentation"><a href="15checkMessage.jsp" target="view_frame"><span class="glyphicon glyphicon-envelope" aria-hidden="true">&nbsp;查看留言</span></a></li>
			<%
			}
			%>
		</ul>
	</div>
</body>
</html>