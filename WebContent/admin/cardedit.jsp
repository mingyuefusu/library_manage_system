<%@page import="javabean.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="javabean.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书证修改</title>
<link rel="stylesheet" href="../public/layui/css/layui.css"  media="all">
<script src="../public/layui/layui.js" charset="utf-8"></script>
 <style>
   .layui-form{
     margin: 10px 20px;
   }
</style>
</head>
<body>
<%
	// 获取借阅证信息
	String id = request.getParameter("id");
	
	
	// 获取rule
	Connection connection = null;
	PreparedStatement  pstmt = null;
	PreparedStatement infoPstmt = null;
	ResultSet ruleSet = null;
	ResultSet infoSet = null;
	String sql = "select * from rules";
	String infoSql = "select * from borrow_card where id=?";
	String result = "";
	// 公用连接
	connection = (Connection)Base.getConnection();
	pstmt 	  = connection.prepareStatement(sql);
	infoPstmt = connection.prepareStatement(infoSql);
	infoPstmt.setString(1,id);
	infoSet = infoPstmt.executeQuery();
	infoSet.next();
	ruleSet = pstmt.executeQuery();
%>
<form class="layui-form  layui-form-pane" action="" lay-filter="cardFilter">
  
  <!-- 账号 -->
  <div class="layui-form-item">
    <label class="layui-form-label">账号</label>
    <div class="layui-input-block">
      <input type="text" name="id" value=<%=id %> class="layui-input" disabled>
    </div>
  </div>
  
  <!-- 姓名 -->
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="reader" value=<%=infoSet.getString("reader") %> lay-verify="required" autocomplete="off" placeholder="请输入姓名" class="layui-input">
    </div>
  </div>
  
  <!-- 密码 -->
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
      <input type="password" name="password"  value=<%=infoSet.getString("password") %> placeholder="请输入密码" autocomplete="off" class="layui-input"  lay-verify="required">
    </div>
  </div>
  
 <!-- 借阅规则 -->
 <div class="layui-form-item">
   <label class="layui-form-label">规则</label>
   <div class="layui-input-block">
     <select name="rule_id" lay-filter="rule_id"  lay-verify="required">
       <% while(ruleSet.next()){ %>
         <option value=<%=ruleSet.getString("id") %> <%if(ruleSet.getString("id").equals(infoSet.getString("rule_id"))) out.print("selected"); %>><%=ruleSet.getString("id") %></option>
       <%} %>
     </select>
   </div>
 </div>
 
 <div class="layui-form-item">
   <label class="layui-form-label">状态</label>
   <div class="layui-input-block">
     <input type="radio" name="status" value="1" title="可用" <%if(infoSet.getString("status").equals("1")) out.print("checked"); %>>
     <input type="radio" name="status" value="0" title="挂失" <%if(infoSet.getString("status").equals("0")) out.print("checked"); %>>
   </div>
 </div>
 
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="submitForm">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>

<script>
layui.use(['form', 'jquery'], function(){
  var form = layui.form
  ,layer = layui.layer;
  $ = layui.jquery;
  // 提交表单
  form.on('submit(submitForm)', function(data){
	$.ajax({
    	url: './cardEdit',
    	type: 'post',
    	data: data.field, 
    	dataType: 'json',
    	timeout : 3000,
    	success: function(data){
    		if(data.code == "0"){
    			layer.msg("修改成功", {
    				icon: 6,
    				anim: 5,
    				time: 500,
    			});
    			setTimeout(function(){
    				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    				parent.layer.close(index); //再执行关闭   
    			}, 500)
    		}else{
    			leyer.msg("修改失败");
    		}
    	},
    	error: function(){
    		layer.msg("获取超时");
    	}
	
    });
    return false;
  })
 
});
</script>

<%
	Base.closeResource(connection, pstmt, ruleSet);
%>
</body>
</html>