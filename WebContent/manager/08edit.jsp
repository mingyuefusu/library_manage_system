<%@page import="java.sql.*"%>
<%@page import="javabean.Base"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../public/layui/css/layui.css">
<script src="../public/layui/layui.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
<%
	String id = request.getParameter("id");
	Connection connection = (Connection)Base.getConnection();
	String sql = "select * from announcement where id=?";
	PreparedStatement pstmt = connection.prepareCall(sql);
	pstmt.setString(1,id);
	ResultSet resultSet = pstmt.executeQuery();
	resultSet.next();

%>
<form class="layui-form layui-form-pane"  action="" lay-filter="formFilter">
  <input type="text" name="id" value=<%=id %>  lay-verify="required" required autocomplete="off" placeholder="请输入姓名" class="layui-input layui-hide">
  <div class="layui-form-item">
    <label class="layui-form-label">标题</label>
    <div class="layui-input-block">
      <input type="text" name="title" value=<%=resultSet.getString("title") %> lay-verify="required" required autocomplete="off" placeholder="请输入标题" class="layui-input">
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">公告</label>
    <div class="layui-input-block">
      <input type="text" name="detail" value=<%=resultSet.getString("detail") %> lay-verify="required" placeholder="请输入公告" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="submitButton">立即提交</button>
    </div>
  </div>
</form>
<script>


layui.use(['form', 'jquery'], function(){
	  $ = layui.jquery;
	  var form = layui.form
	  ,layer = layui.layer
	  //监听提交
	  form.on('submit(submitButton)', function(data){
	    $.ajax({
	    	url: './announcementEdit',
	    	method: 'post',
	    	data: data.field,
	    	dataType: 'json',
	    	success: function(data){
	    		if(data.code == "0"){
	    			parent.layer.msg("添加成功",{
	    				icon: 6,
	    				time: 500
	    			});
	    			setTimeout(function(){
	    				parent.location.reload();
	    			}, 500);
	    		}else{
	    			layer.msg(data.msg);
	    		}
	    	    
	    	}
	    })
	    
	    
	    return false;
	  });
	});

</script>
</body>
</html>