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

<link rel="stylesheet" id="templatecss" type="text/css"
	href="../public/css/message.css">
</head>
<body id="home">
		<div class="rain">
			<div class="border start">
				<form>
					<label for="card">借阅证号</label>
					<input id="card" type="text" placeholder="请输入您的借阅证号"/>
					<label for="book">书籍编号</label>
					<input id="book" type="text" placeholder="请输入您的书籍编号"/>
					<label for="mes">留言</label>
					<textarea id="mes"  placeholder="请输入您的留言"></textarea>
					<label for="date">日期</label>
					<input id="date" type="text" placeholder="请输入时间"/><br>&emsp;&emsp;&emsp;
                    <div align="center">
                    <button type="submit" class="btn btn-warning" style="margin-left:0">提交</button>&emsp;&emsp;&emsp;
                    <button type="reset" class="btn btn-danger" style="margin-right:0">重置</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</body>
</html>