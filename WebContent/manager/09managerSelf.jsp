<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../public/layui/css/layui.css" media="all">
<script src="../public/layui/layui.js"></script>
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="../public/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="../public/css/component.css" />
<script src="../public/js/modernizr.custom.js"></script>
<style>
body{
	background-color:white !important;
	color:black !important;
}
.md-content {
	color: black;
	background: white;
	position: relative;
	border-radius: 3px;
	margin: 0 auto;
}
button{
	background-color:#009688;

}
button:hover{
	background-color:#5FB878;
}
.md-modal{

	width: 35%;
}
</style>
</head>
<body>
<jsp:useBean id="gly"  scope="session" class="javabean.JDBCBean"></jsp:useBean>
<fieldset class="layui-elem-field" style="width:30%;margin-left:30%;margin-top:5%;height:30%;">
  <legend>管理员基本信息</legend>
  <div class="layui-field-box" align="center" style="font-size:20px;font-family:YouYuan;margin-top:10%;margin-bottom:10%;">
  <%
		String manacc = session.getAttribute("manager").toString();
    	String sql = "select*from manager where ACCOUNT = '"+ manacc +"';";
    	//out.print(sql);
    	ResultSet rs = gly.executeQuery(sql);
    	while(rs.next()){
%>
	<p>姓名：<%=rs.getString("name") %></p><br>
	<p>账号：<%=rs.getString("account") %></p><br>
	<p>邮箱：<%=rs.getString("email") %></p><br>


	 <button class="md-trigger layui-btn layui-btn-radius" data-modal="modal-3">修改名字</button>
	 <button class="md-trigger layui-btn layui-btn-radius" data-modal="modal-13">修改密码</button>
	 <button class="md-trigger layui-btn layui-btn-radius" data-modal="modal-1">修改邮箱</button>

<%
    	}
%>
  </div>
 </fieldset> 


	<div class="md-modal md-effect-13" id="modal-13">
		<div class="md-content">
			<h3>修改密码</h3>
			
				<form action="10updateManager.jsp" method="post"
				class="form-horizontal">
				<div class="form-group" align="center" style="margin-left:3%;">
					<br>
					<label for="psw1" class="col-sm-2 control-label" >新密码</label>
					<div class="col-sm-10" align="center">
						<input type="password" class="form-control" name="psw1" id="password1" placeholder="请输入新密码" style="width:50%;margin-left:8%;"/>
					</div>
				</div>
				<br>
				<div class="form-group" align="center" style="margin-left:3%;">
					<label for="psw2" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="psw2" id="password2" placeholder="请再次输入密码进行确认" style="width:50%;margin-left:8%;"/>
					</div>
				</div>
				<div align="center">
				<input type="submit" class="layui-btn layui-btn-radius" value="确认">

				</div>
				<br>
			</form>
				<button class="md-close layui-btn-radius" style="font-size:14px;">取消</button>
				<br>
		</div>
		
	</div>


<div class="md-modal md-effect-13" id="modal-1">
		<div class="md-content">
			<h3>修改邮箱</h3>
			
				<form action="10updateManager.jsp" method="post"
				class="form-horizontal">
				<div class="form-group" align="center" style="margin-left:3%;">
					<br>
					<label for="email1" class="col-sm-2 control-label" >新邮箱</label>
					<div class="col-sm-10" align="center">
						<input type="text" class="form-control" name="email1" id="password1" placeholder="请输入新邮箱" style="width:50%;margin-left:8%;"/>
					</div>
				</div>
				<br>
				<div class="form-group" align="center" style="margin-left:3%;">
					<label for="email2" class="col-sm-2 control-label">新邮箱</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="email2" id="password2" placeholder="请再次输入邮箱进行确认" style="width:50%;margin-left:8%;"/>
					</div>
				</div>
				<div align="center">
				<input type="submit" class="layui-btn layui-btn-radius" value="确认">

				</div>
				<br>
			</form>
				<button class="md-close layui-btn-radius" style="font-size:14px;">取消</button>
				<br>
		</div>
		
	</div>


<div class="md-modal md-effect-13" id="modal-3">
		<div class="md-content">
			<h3>修改名字</h3>
			
				<form action="10updateManager.jsp" method="post"
				class="form-horizontal">
				<div class="form-group" align="center" style="margin-left:3%;">
					<br>
					<label for="name1" class="col-sm-2 control-label" >新名字</label>
					<div class="col-sm-10" align="center">
						<input type="text" class="form-control" name="name1" id="password1" placeholder="请输入新名字" style="width:50%;margin-left:8%;"/>
					</div>
				</div>
				<br>
				<div class="form-group" align="center" style="margin-left:3%;">
					<label for="name2" class="col-sm-2 control-label">新名字</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="name2" id="password2" placeholder="请再次输入名字进行确认" style="width:50%;margin-left:8%;"/>
					</div>
				</div>
				<div align="center">
				<input type="submit" class="layui-btn layui-btn-radius" value="确认">

				</div>
				<br>
			</form>
				<button class="md-close layui-btn-radius" style="font-size:14px;">取消</button>
				<br>
		</div>
		
	</div>
	
	
	
	<div class="md-overlay"></div>
	<!-- the overlay element -->

	<!-- classie.js by @desandro: https://github.com/desandro/classie -->
	<script src="../public/js/classie.js"></script>
	<script src="../public/js/modalEffects.js"></script>

	<!-- for the blur effect -->
	<!-- by @derSchepp https://github.com/Schepp/CSS-Filters-Polyfill -->
	<script>
		// this is important for IEs
		var polyfilter_scriptpath = '/js/';
	</script>
	<script src="../public/js/cssParser.js"></script>
	<script src="../public/js/css-filters-polyfill.js"></script>



</body>
</html>