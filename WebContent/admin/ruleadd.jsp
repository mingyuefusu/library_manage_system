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
	// 获取图书馆map
	Map<String, String> libraryMap = Common.getLibraryMap();
%>
 <form class="layui-form   layui-form-pane" action="">
  <input type="id" name="id" value="3" class="layui-hide">
  <div class="layui-form-item">
    <label class="layui-form-label">限制天数</label>
    <div class="layui-input-block">
      <input type="text" name="limit_day" required lay-verify="required" placeholder="请输入限制天数" autocomplete="off" class="layui-input">
    </div>
  </div>
  <!-- 作者 -->
  <div class="layui-form-item">
    <label class="layui-form-label">限制数量</label>
    <div class="layui-input-block">
      <input type="text" name="borrow_num" required  lay-verify="required" placeholder="请输入限制数量" autocomplete="off" class="layui-input">
    </div>
  </div>

    <div class="layui-form-item">
    <label class="layui-form-label">限制图书馆</label>
    <div class="layui-input-block" >
      <%
      for(String key : libraryMap.keySet()){
  		%>
  		<input type="checkbox" name=<%="borrow_library[" +key +"]" %> title=<%=libraryMap.get(key) %> checked>
  		<%
  	  }
      %>
      
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">逾期每天费用</label>
    <div class="layui-input-block">
      <input type="text" name="overtime_fee" required  lay-verify="required" placeholder="请输入逾期每天费用" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="submitButton">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
	    	url: './ruleAdd',
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
	    			leyer.msg("添加失败");
	    		}
	    			
	    	    //parent.layer.msg('您将标记 [ sdf ] 成功传送给了父窗口');
	    	    
	    	}
	    })
	    
	    
	    return false;
	  });
	});

</script>
</body>
</html>