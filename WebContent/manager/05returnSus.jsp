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

		String book = request.getParameter("bookid");
		String date1 = request.getParameter("date1");
		String ill = request.getParameter("ill");
		//out.println(ill);
		String managerid = request.getParameter("managerid");

		if(session.getAttribute("manager")!=null){

				String sql2 = "select * from books where ID =" + book;
				ResultSet rs2 = ret.executeQuery(sql2);
				
				if(rs2.next()){
					//out.println(psw1 + " " + psw2);
					//String id = session.getAttribute("manager").toString();
					int status=Integer.parseInt(rs2.getString("STATUS"));
					if(status==0){
						String sql = "update borrow_books set RETURN_DATE='" + date1 + "',ILLEGAL='" + ill + "',MANAGER_ID='" + managerid + "' where manager_id is null and BOOK_ID="+ book;
						
						//out.println(sql);
						try {
							int i = ret.executeUpdate(sql);
							
							
								//String sql1 = "update borrow_books set RETURN_DATE='" + date1 + "',ILLEGAL='" + ill + "',MANAGER_ID='" + managerid + "' order by BORROW_DATE desc  limit 1 ";
								//int k = ret.executeUpdate(sql1);
								
										String sql3="update books set STATUS=1 where ID="+book;
										ret.executeUpdate(sql3);
										%>
										<script>
											alert('归还成功！');
											window.location.href = "04judge.jsp";
										</script>
									
										<%
								
										} catch (Exception e) {
								%>
								<script>
									alert('归还未成功！');
									window.location.href = "04judge.jsp";
								</script>
								<%
									}
					}else{
						%>
						<script>
							alert('该图书未借出！');
							window.location.href = "04judge.jsp";
						</script>
						<%
					}
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