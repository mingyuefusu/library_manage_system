<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nifty Modal Window Effects</title>
<meta name="description"
	content="Nifty Modal Window Effects with CSS Transitions and Animations" />
<meta name="keywords"
	content="modal, window, overlay, modern, box, css transition, css animation, effect, 3d, perspective" />
<meta name="author" content="Codrops" />

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="../public/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="../public/css/component.css" />
<script src="../public/js/modernizr.custom.js"></script>

</head>
<body>
	<%
		if (session.getAttribute("reader") == null) {
	%>
	<script>
		location.href = "../loginReader.html";
	</script>
	<%
		}
	%>
	<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
	<!-- All modals added here for the demo. You would of course just have one, dynamically created -->

	<div class="md-modal md-effect-13" id="modal-13">
		<div class="md-content">
			<h3>修改密码</h3>
			
				<form action="11updatePswSus.jsp" method="post"
				class="form-horizontal">
				<div class="form-group" align="center">
					<br>
					<label for="psw1" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10" align="center">
						<input type="password" class="form-control" name="psw1" id="password1" placeholder="请输入新密码" style="width:70%;"/>
					</div>
				</div>
				<br>
				<div class="form-group" align="center">
					<label for="psw2" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="psw2" id="password2" placeholder="请再次输入密码进行确认" style="width:70%;"/>
					</div>
				</div>
				<div align="center">
				<input type="submit" class="btn btn-primary" value="确认">

				</div>
				<br>
			</form>
				<button class="md-close btn-primary">取消</button>
				<br>
		</div>
		
	</div>


	<div class="container">
		<!-- Top Navigation -->
		<header style="backgorund-color:lightblue;height:20%;font-align:center;width:100%;font-family:YouYuan;">
		<h1>个人信息
			<span class="glyphicon glyphicon-bookmark" aria-hidden="true" style="font-size:17px;">&nbsp;Success is waking up in the morning,so excited about what you have to do.</span>
		</h1>
		</header>
	
		<div class="main clearfix" style="font-size:10px;margin-top:5%;font-family:YouYuan;">
			<div class="column">
<%
		try{
		String cardId=session.getAttribute("reader").toString();
		String sql="select*from borrow_card where ID = '"+ cardId +"';";
		ResultSet rs = check.executeQuery(sql);
		while (rs.next()) {
%>
<% int id = rs.getInt(1);%>
				<p><span class="glyphicon glyphicon-tags">&nbsp;借阅证编号：<%=rs.getString("ID")%></span></p><br>
				
				<p><span class="glyphicon glyphicon-user">&nbsp;借阅证姓名：<%=rs.getString("READER")%></span></p><br>
				<p><span class="glyphicon glyphicon-tag">&nbsp;规则编号：<%=rs.getString("RULE_ID")%></span></p><br>
				<p><span class="glyphicon glyphicon-star-empty">&nbsp;状态：
					<%
					if(rs.getString("STATUS").equals("1")){
						out.println("可用");
					}
					else{
						out.println("挂失");
					}
					%>
				</span></p>
<%
		}
		}catch(Exception e){

		}
 %>
			</div>
			<div class="column" align="center" style="font-size:15px"> 

				<button class="md-trigger" data-modal="modal-13"  style="margin-top:20%;">修改密码</button>

			</div>
		</div>
	</div>
	<!-- /container -->


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