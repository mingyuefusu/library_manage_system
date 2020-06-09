<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../public/layui/css/layui.css" media="all">
<script src="../public/layui/layui.js"></script>
<style>
.layui-form-label{
	margin-left:20%;
}
</style>
</head>
<body>
		<div align="center" style=" margin-top: 2%;"><h1>借阅图书</h1></div>
	<div align="center"
		style="margin-left:30%; margin-top: 5%; width: 40%;">

		<form class="layui-form layui-form-pane" action="03borrowSus.jsp">
			<div class="layui-form-item">
				<label class="layui-form-label">借阅证号</label>
				<div class="layui-input-inline">
					<input type="text" name="userid" lay-verify="required"
						placeholder="请输入借阅证号" autocomplete="off" class="layui-input"><br>
				</div>

			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">图书编号</label>
				<div class="layui-input-inline">
					<input type="text" name="bookid" lay-verify="required"
						placeholder="请输入图书编号" autocomplete="off" class="layui-input"><br>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">借阅日期</label>
				<div class="layui-input-inline">
					<input type="text" name="date1" id="date1" autocomplete="off"
						class="layui-input"><br>
				</div>

			</div>


			<div class="layui-form-item" align="center">
				<button class="layui-btn" lay-submit="" lay-filter="demo2">借阅</button>
			</div>
		</form>


		<script>
			layui
					.use(
							[ 'form', 'layedit', 'laydate' ],
							function() {
								var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
								//日期
								laydate.render({
									elem : '#date1',
									type : 'datetime',
									format : 'yyyy-M-d H:m:s',
									value: new Date()
								});
								laydate.render({
									elem : '#date2',
									type : 'datetime',
									format : 'yyyy-M-d H:m:s'
								});

								//创建一个编辑器
								var editIndex = layedit
										.build('LAY_demo_editor');

							
								//监听提交
								form.on('submit(demo1)', function(data) {
									layer.alert(JSON.stringify(data.field), {
										title : '最终的提交信息'
									})
									return false;
								});

								//表单赋值
								layui.$('#LAY-component-form-setval').on(
										'click', function() {
											form.val('example', {
												"username" : "贤心" // "name": "value"
												,
												"password" : "123456",
												"interest" : 1,
												"like[write]" : true //复选框选中状态
												,
												"close" : true //开关状态
												,
												"sex" : "女",
												"desc" : "我爱 layui"
											});
										});

								//表单取值
								layui.$('#LAY-component-form-getval').on(
										'click', function() {
											var data = form.val('example');
											alert(JSON.stringify(data));
										});

							});
		</script>
	</div>
</body>
</html>