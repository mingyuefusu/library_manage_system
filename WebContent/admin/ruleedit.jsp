<%@page import="javabean.Common"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javabean.Base"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>规则添加</title>
<!-- layui -->
<link rel="stylesheet" href="../public/layui/css/layui.css">
<script src="../public/layui/layui.js"></script>
<style>
  .layui-form{
    margin: 10px 20px;
      
 }
 .layui-form-pane .layui-form-label{
 	width: 120px;
 }
 .layui-form-pane .layui-input-block{
 	margin-left: 120px;
 }
</style>
</head>
<body>
<%
    String id = request.getParameter("id");
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet resultSet = null;
	String sql = "";
	
	connection = (Connection)Base.getConnection();
	sql = "select * from rules where id = ?";
	pstmt = connection.prepareStatement(sql);
	pstmt.setString(1, id);
	resultSet = pstmt.executeQuery();
	resultSet.next();
	
	String[] libraryList = resultSet.getString("borrow_library").split("、"); 
	// 获取图书馆map
	Map<String, String> libraryMap = Common.getLibraryMap();
%>
 <form class="layui-form   layui-form-pane" action="">
  <input type="text" name="id" value=<%=id %> class="layui-hide">
  <div class="layui-form-item">
    <label class="layui-form-label">限制天数</label>
    <div class="layui-input-block">
      <input type="text" name="limit_day" value=<%=resultSet.getString("limit_day") %> required lay-verify="required" placeholder="请输入限制天数" autocomplete="off" class="layui-input">
    </div>
  </div>
  <!-- 作者 -->
  <div class="layui-form-item">
    <label class="layui-form-label">限制数量</label>
    <div class="layui-input-block">
      <input type="text" name="borrow_num" value=<%=resultSet.getString("borrow_num") %> required  lay-verify="required" placeholder="请输入限制数量" autocomplete="off" class="layui-input">
    </div>
  </div>

    <div class="layui-form-item">
    <label class="layui-form-label">限制图书馆</label>
    <div class="layui-input-block" >
      <%
      for(String key : libraryMap.keySet()){
    	  boolean flag = false;
  		%>
  		<input type="checkbox" name=<%="borrow_library[" +key +"]" %> title=<%=libraryMap.get(key) %> 
  		<% for(String key0 : libraryList){
  			flag = false;
  			if(key0.equals(key)){
  				flag = true;
  			}
  			if(flag == true)
  				out.print("checked");
  		}
  		%>>
  		<%
  	  }
      %>
      
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">逾期每天费用</label>
    <div class="layui-input-block">
      <input type="text" name="overtime_fee" value=<%=resultSet.getString("overtime_fee") %> required  lay-verify="required" placeholder="请输入逾期每天费用" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="bookForm">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
<script>


layui.use(['form', 'jquery'], function(){
	  //layer.closeAll();
	  $ = layui.jquery;
	  var form = layui.form
	  ,layer = layui.layer
	  //监听提交
	  form.on('submit(bookForm)', function(data){
	    $.ajax({
	    	url: './ruleEdit',
	    	method: 'post',
	    	data: data.field,
	    	dataType: 'json',
	    	success: function(data){
	    		if(data.code == "0"){
	    			parent.layer.msg("修改成功",{
	    				icon: 6,
	    				time: 500
	    			});
	    			setTimeout(function(){
	    				parent.location.reload();
	    			}, 500);
	    		}else{
	    			leyer.msg("修改失败");
	    		}
	    			
	    	    //parent.layer.msg('您将标记 [ sdf ] 成功传送给了父窗口');
	    	    
	    	}
	    })
	    
	    
	    return false;
	  });
	});

</script>

<%
	Base.closeResource(connection, pstmt, resultSet);
%>
</body>
</html>