<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分类添加</title>
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
    <label class="layui-form-label">分类名</label>
    <div class="layui-input-block">
      <input type="text" name="name" lay-verify="required" required autocomplete="off" placeholder="请输入分类名" class="layui-input">
    </div>
  </div>
 
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">分类描述</label>
    <div class="layui-input-block">
      <textarea name="description" placeholder="请输入内容" class="layui-textarea" style="height:300px"></textarea>
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
	    	url: './sortAdd',
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