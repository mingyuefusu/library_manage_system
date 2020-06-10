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
<style>
.layui-form-label{
	margin-left:20%;
}
</style>
</head>
<body>
<jsp:useBean id="judge" scope="session" class="javabean.JDBCBean"></jsp:useBean>
		<div align="center" style=" margin-top: 2%;"><h1>归还图书</h1></div>
	<div align="center"
		style="margin-left:30%; margin-top: 5%; width: 40%;">

		<%
  				Object days = session.getAttribute("days");
				Object fee = session.getAttribute("fee");
  				int d = Integer.parseInt(days.toString());
  				float f = Float.parseFloat(fee.toString());
  				String book = session.getAttribute("book").toString();
  				String mes = "";
  				String mes2 = "";
  				float sum = 0;
  				if(d<0){
  					mes = "已逾期"+(-d)+"天";
  					sum = d*f*(-1);
  					mes2 = "罚款"+sum;
  				}
  				else{
  					mes = "还剩"+d+"天";
  					//mes2 = "无需罚款";
  				}
  				session.setAttribute("mes",mes);
  				session.setAttribute("mes2",mes2);
  		%>
		
		<form class="layui-form layui-form-pane" action="05returnSus.jsp">
			<div><blockquote class="layui-elem-quote layui-quote-nm">
  				
  				<%=session.getAttribute("mes") %><br>
  				<%=session.getAttribute("mes2") %>
				 </blockquote>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">图书编号</label>
				<div class="layui-input-inline">
					<input type="text" name="bookid" lay-verify="required"
						value=<%=session.getAttribute("book") %> autocomplete="off" class="layui-input"><br>
				</div>
			</div>

			<%
				
				String sql2="select*from borrow_books where return_date is null and book_id = "+book;
				ResultSet rs2 = judge.executeQuery(sql2);
				String end = "";
				while (rs2.next()) {
				
				
			%>

			<div class="layui-form-item">
				<label class="layui-form-label">截止日期</label>
				<div class="layui-input-inline">
					<input type="text" name="end"  autocomplete="off"
						class="layui-input" value=<%=rs2.getString("end_date") %>><br>
				</div>

			</div>
			
			<%} %>
			<div class="layui-form-item">
				<label class="layui-form-label">归还日期</label>
				<div class="layui-input-inline">
					<input type="text" name="date1" id="date1" autocomplete="off"
						class="layui-input"><br>
				</div>

			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">违规信息</label>
				<div class="layui-input-inline">
					<input type="text" name="ill" 
						placeholder="若无违规信息，则不填" autocomplete="off" class="layui-input"><br>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">管理员编号</label>
				<div class="layui-input-inline">
					<input type="text" name="managerid" readonly="readonly"
						  class="layui-input" value="<%=session.getAttribute("manager")%>"><br>
				</div>
			</div>
			
			<div class="layui-form-item" align="center">
				<button class="layui-btn layui-btn-warm" lay-submit="" lay-filter="demo2">归还</button>
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
									format : 'yyyy-MM-dd H:m:s',
									min:0,
									max:0,
									value: new Date()
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