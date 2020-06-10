<%@ page import="java.sql.*"%>
<%@ page import="javabean.EndTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="borrow" scope="session" class="javabean.JDBCBean"></jsp:useBean>
	<%
		String user = request.getParameter("userid");
		String book = request.getParameter("bookid");
		String date1 = request.getParameter("date1");
		
		
		//String date2 = request.getParameter("date2");
		String sql1 = "select * from borrow_card where ID =" + user;
		
		ResultSet rs1 = borrow.executeQuery(sql1);
		
		
		if(session.getAttribute("manager")!=null){
			if (rs1.next()) {
				
				String rule = rs1.getString("rule_id");	
				int cardstatus = Integer.parseInt(rs1.getString("STATUS"));
				
				String sql4="select*from rules where id = "+rule;
				ResultSet rs4 = borrow.executeQuery(sql4);
				int n =0;
				String library = "";
				String[] libraryArray = {};
				int num = 0;
				while(rs4.next()){
					n=rs4.getInt("limit_day");
					library = rs4.getString("borrow_library");
					libraryArray=library.split("、");
					num = rs4.getInt("borrow_num");
				}
				
				EndTime endtime = new EndTime();
				String end = endtime.show(n);
				
				if(cardstatus!=0){
					String sql2 = "select * from books where ID =" + book;
					ResultSet rs2 = borrow.executeQuery(sql2);
					
					if(rs2.next()){
						
						int status=Integer.parseInt(rs2.getString("STATUS"));
						String lib = Integer.toString(rs2.getInt("library_id"));
						for(int z=0;z<libraryArray.length;z++){
							//out.println(lib);
							//out.println(libraryArray[z]);
							if(libraryArray[z].equals(lib)){
								String countSql = "select count(*) as count from borrow_books where manager_id is null and card_id ="+ user;

								ResultSet rsSql = borrow.executeQuery(countSql);
								int count=0;
								while(rsSql.next()){
									count = rsSql.getInt("count");
								}
								//out.println(count);
								if(count<num){
									if(status==1){
										String sql = "insert borrow_books(CARD_ID,BOOK_ID,BORROW_DATE,END_DATE)values('" + user + "','" + book
												+ "','" + date1 + "','" + end + "');";
										try {
											int i = borrow.executeUpdate(sql);
											if (i == 1) {
												%>
												<script>
													alert('借阅成功！');
													window.location.href = "02borrow.jsp";
												</script>
											
												<%
													String sql3="update books set STATUS=0 where ID="+book;
													borrow.executeUpdate(sql3);
												
											} else {
												%>
												<script>
													alert('借阅未成功！');
													window.location.href = "02borrow.jsp";
												</script>
												<%
													}
														} catch (Exception e) {
												%>
												<script>
													alert('借阅未成功！');
													window.location.href = "02borrow.jsp";
												</script>
												<%
													}
									}else{
										%>
										<script>
											alert('该图书已借出！');
											window.location.href = "02borrow.jsp";
										</script>
										<%
									}
								}else{
									%>
									<script>
										alert('该用户已达到可借阅数量！若需还借书，请先还书！');
										window.location.href = "02borrow.jsp";
									</script>
									<%
								}
								}
							if(z==libraryArray.length-1 && !libraryArray[z].equals(lib)){
								%>
								<script>
									alert('该图书未在可借阅的图书馆内！');
									window.location.href = "02borrow.jsp";
								</script>
								<%
							}
						}
						
					}else{
						%>
						<script>
							alert('该图书不存在！');
							window.location.href = "02borrow.jsp";
						</script>
						<%
					}
				}else{
					%>
					<script>
						alert('借阅证已挂失！');
						window.location.href = "02borrow.jsp";
					</script>
					<%
				}
				} else {
				%>
				<script>
					alert('用户不存在！');
					window.location.href = "02borrow.jsp";
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