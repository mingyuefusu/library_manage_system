<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ret" scope="session" class="javabean.JDBCBean"></jsp:useBean>
	<%
		String user = request.getParameter("userid");
		String book = request.getParameter("bookid");
		String date1 = request.getParameter("date1");
		String ill = request.getParameter("ill");
		out.println(ill);
		String managerid = request.getParameter("managerid");
		String sql1 = "select * from borrow_card where ID =" + user;
		
		ResultSet rs1 = ret.executeQuery(sql1);
		if(session.getAttribute("manager")!=null){
			if (rs1.next()) {
				String sql2 = "select * from books where ID =" + book;
				ResultSet rs2 = ret.executeQuery(sql2);
				
				if(rs2.next()){
					//out.println(psw1 + " " + psw2);
					//String id = session.getAttribute("manager").toString();
					int status=Integer.parseInt(rs2.getString("STATUS"));
					if(status==0){
						String sql = "update borrow_books set RETURN_DATE='" + date1 + "',ILLEGAL='" + ill + "',MANAGER_ID='" + managerid + "' where CARD_ID='" + user +"'and BOOK_ID="+ book;
						try {
							int i = ret.executeUpdate(sql);
							if (i == 1) {
								String sql4="select * from manager where ID="+managerid;
								ResultSet rs3=ret.executeQuery(sql4);
								if(rs3.next()){
								%>
									<script>
										alert('归还成功！');
										window.location.href = "04return.jsp";
									</script>
								
									<%
										String sql3="update books set STATUS=1 where ID="+book;
										ret.executeUpdate(sql3);
								}else{
									%>
									<script>
										alert('该管理员不存在！');
										window.location.href = "04return.jsp";
									</script>
								
									<%
								}
								
							} else {
								%>
								<script>
									alert('归还未成功！');
									window.location.href = "04return.jsp";
								</script>
								<%
									}
										} catch (Exception e) {
								%>
								<script>
									alert('归还未成功！');
									window.location.href = "04return.jsp";
								</script>
								<%
									}
					}else{
						%>
						<script>
							alert('该图书未借出！');
							window.location.href = "04return.jsp";
						</script>
						<%
					}
				}
			}else{
				%>
				<script>
					alert('用户不存在！');
					window.location.href = "04return.jsp";
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