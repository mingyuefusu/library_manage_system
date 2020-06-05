<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<script src="${ctx}/toastr/toastr.min.js"></script>
<link rel="stylesheet" href="${ctx}/toastr/toastr.min.css">
</head>
<body>
	<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
	<%
		String psw1 = request.getParameter("psw1");
		String psw2 = request.getParameter("psw2");

		//out.println(psw1 + " " + psw2);
		String id = session.getAttribute("reader").toString();

		if (psw1.equals(psw2) && psw1 != null && psw2 != null && !psw1.trim().equals("")
				&& !psw2.trim().equals("")) {
			String sql = "update borrow_card set PASSWORD ='" + psw1 + "' where ID=" + id;
			try {
				int i = check.executeUpdate(sql);
				if (i == 1) {
	%>
	<script>
		alert('修改成功！');
		window.location.href = "index.jsp";
	</script>

	<%
		} else {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "index.jsp";
	</script>
	<%
		}
		} catch (Exception e) {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "index.jsp";
	</script>
	<%
		}
		} else {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "index.jsp";
	</script>
	<%
		}
	%>



</body>
</html>