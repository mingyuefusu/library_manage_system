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
	Connection connection = null;
	PreparedStatement  pstmt = null;
	ResultSet ruleSet = null;
	String sql = "select * from rules";
	String result = "";
	connection = (Connection)Base.getConnection();
	pstmt = connection.prepareStatement(sql);
	ruleSet = pstmt.executeQuery();
%>
<form class="layui-form  layui-form-pane" action="" lay-filter="cardFilter">
  <!-- 姓名 -->
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="reader" lay-verify="required" autocomplete="off" placeholder="请输入姓名" class="layui-input">
    </div>
  </div>
  
  <!-- 密码 -->
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
      <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input"  lay-verify="required">
    </div>
  </div>
  
  <!-- 借阅规则 -->
  <div class="layui-form-item">
    <label class="layui-form-label">规则</label>
    <div class="layui-input-block">
      <select name="rule_id" lay-filter="rule_id"  lay-verify="required">
        <% while(ruleSet.next()){ %>
          <option value=<%=ruleSet.getString("id") %>><%=ruleSet.getString("id") %></option>
        <%} %>
      </select>
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">状态</label>
    <div class="layui-input-block">
      <input type="radio" name="status" value="1" title="可用" checked="">
      <input type="radio" name="status" value="0" title="挂失">
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
    	url: './cardAdd',
    	method: 'post',
    	data: data.field, 
    	dataType: 'json',
    	success: function(data){
    		if(data.code == "0"){
    			parent.layer.open({
    				title: '注册账号为',
    				content: data.data['id'],
	    			end: function(){
						//parent.location.reload();
						var index = parent.layer.getFrameIndex(window.name); //操作父页面
	            		parent.layer.close(index);
					}
    			});
    			/*setTimeout(function(){
    				
    			}, 500);*/
    		}else{
    			leyer.msg("添加失败");
    		}
    	}
	
    });
    return false;
  })
 
});
</script>
</body>
</html>