<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
	<%
		String psw1 = request.getParameter("psw1");
		String psw2 = request.getParameter("psw2");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String name1 = request.getParameter("name1");
		String name2 = request.getParameter("name2");
	
		//out.println(psw1 + " " + psw2);
		String id = session.getAttribute("manager").toString();
		
		if(psw1!=null && psw2!=null){
		if (psw1.equals(psw2) && psw1 != null && psw2 != null && !psw1.trim().equals("")
				&& !psw2.trim().equals("")) {
			String sql = "update manager set PASSWORD ='" + psw1 + "' where ACCOUNT='" + id +"'";
			try {
				int i = check.executeUpdate(sql);
				if (i == 1) {
	%>
	<script>
		alert('修改成功！');
		window.location.href = "09managerSelf.jsp";
	</script>

	<%
		} else {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "09managerSelf.jsp";
	</script>
	<%
		}
		} catch (Exception e) {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "09managerSelf.jsp";
	</script>
	<%
		}
		} else {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "09managerSelf.jsp";
	</script>
	<%
		}
		
		
		}else if(email1!=null && email2!=null){
		//out.println(psw1 + " " + psw2);

		if (email1.equals(email2) && email1 != null && email2 != null && !email1.trim().equals("")
				&& !email2.trim().equals("")) {
			String sql = "update manager set EMAIL ='" + email1 + "' where ACCOUNT='" + id +"'";
			try {
				int i = check.executeUpdate(sql);
				if (i == 1) {
	%>
	<script>
		alert('修改成功！');
		window.location.href = "09managerSelf.jsp";
	</script>

	<%
		} else {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "09managerSelf.jsp";
	</script>
	<%
		}
		} catch (Exception e) {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "09managerSelf.jsp";
	</script>
	<%
		}
		} else {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "09managerSelf.jsp";
	</script>
	<%
		}
		
		
	}else if(name1!=null && name2!=null){
		//out.println(psw1 + " " + psw2);

		if (name1.equals(name2) && name1 != null && name2 != null && !name1.trim().equals("")
				&& !name2.trim().equals("")) {
			String sql = "update manager set NAME ='" + name1 + "' where ACCOUNT='" + id +"'";
			try {
				int i = check.executeUpdate(sql);
				if (i == 1) {
	%>
	<script>
		alert('修改成功！');
		window.location.href = "09managerSelf.jsp";
	</script>

	<%
		} else {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "09managerSelf.jsp";
	</script>
	<%
		}
		} catch (Exception e) {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "09managerSelf.jsp";
	</script>
	<%
		}
		} else {
	%>
	<script>
		alert('修改未成功！');
		window.location.href = "09managerSelf.jsp";
	</script>
	<%
		}
	}
	%>
</body>
</html>