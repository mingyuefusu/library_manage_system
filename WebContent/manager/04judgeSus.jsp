<%@ page import="javabean.DateTime" %>
<%@ page import="javabean.CompareDate" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="judge" scope="session" class="javabean.JDBCBean"></jsp:useBean>
<%

	String book = request.getParameter("bookid");
	session.setAttribute("book", book);
	if(session.getAttribute("manager")!=null){
		DateTime date = new DateTime();
		String now = date.show();
		String bookid = request.getParameter("bookid");
		
		String sql="select*from borrow_books where book_id = "+bookid;
		ResultSet rs = judge.executeQuery(sql);
		String end = "";
		String ret = "";
		String card = "";
		while (rs.next()) {
			end = rs.getString("end_date");
			ret = rs.getString("return_date");
			card = rs.getString("card_id");
		}
		if(ret==null){
		//CompareDate cd = new CompareDate();
		long n = CompareDate.show(now,end);
		//out.println(sql);
		//out.println(n);
		//out.println(end);
		//out.println(now);
		session.setAttribute("days", n);
		
		String sql1="select*from borrow_card where id = "+card;
		ResultSet rs1 = judge.executeQuery(sql1);
		String rule = "";
		while (rs1.next()) {
			rule = rs1.getString("rule_id");
		}
		
		String sql2="select*from rules where id = "+rule;
		ResultSet rs2 = judge.executeQuery(sql2);
		String fee = "";
		while (rs2.next()) {
			fee = rs2.getString("overtime_fee");
		}
		session.setAttribute("fee", fee);
		%>
		<script>
			window.location.href = "04return.jsp";
		</script>
		<%
		}else{
			%>
			<script>
				alert("该书未借出或不存在！");
				window.location.href = "04judge.jsp";
			</script>
			<%
		}
	}else{
		%>
		<script>
			alert('请先登录！');
			window.parent.location.href = "../loginManager.html";
		</script>
		<%
	}

%>
</body>
</html>