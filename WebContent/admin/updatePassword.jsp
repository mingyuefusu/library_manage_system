<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
<!-- layui -->
<link rel="stylesheet" href="../public/layui/css/layui.css">
<script src="../public/layui/layui.js"></script>
<style>
  .layui-form{
    margin: 10px 20px;
      
 }

</style>
</head>
</head>
<body>
<form class="layui-form layui-form-pane" action="" lay-filter="formFilter">

  <div class="layui-form-item">
    <label class="layui-form-label">旧密码</label>
    <div class="layui-input-block">
      <input type="password" name="oldPassword" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">新密码</label>
    <div class="layui-input-block">
      <input type="password" name="newPassword" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  
	<div class="layui-form-item">
    <label class="layui-form-label">确认密码</label>
    <div class="layui-input-block">
      <input type="password" name="conPassword" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>

 
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="submitButton">确认修改</button>
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
	    	url: './updatePassword',
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
	    				var index = parent.layer.getFrameIndex(window.name); //操作父页面
	            		parent.layer.close(index);
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