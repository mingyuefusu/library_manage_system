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
th {
	vertical-align: middle !important;
	text-align: center;
}

.size {
	width: 35%;
	margin-top: 10%;
	margin-left: 30%;
}
</style>
</head>
<body>
	<div align="center" class="panel panel-info size">
		<div class="panel-heading">
			<h1 class="panel-title">修改密码</h1>
		</div>
		<div class="panel-body">
			<form action="11updatePswSus.jsp" method="post"
				class="form-horizontal" enctype="application/x-www-form-urlencoded">
				<div class="form-group">
					<br>
					<label for="password1" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="psw1" id="password1" placeholder="请输入新密码"/>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="password2" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="psw2" id="password2" placeholder="请再次输入密码进行确认"/><br>
					</div>
				</div>
				<input type="submit" class="btn btn-primary" value="确认">&emsp;&emsp;&emsp;
				<a onclick="check()" href="09cardInfo.jsp" class="btn btn-primary">返回</a> <br>
				<br>
			</form>

		</div>
	</div>
</body>
</html>