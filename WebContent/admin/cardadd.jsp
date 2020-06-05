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
<form class="layui-form  layui-form-pane" action="" lay-filter="cardFilter">
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="reader" lay-verify="required" autocomplete="off" placeholder="请输入姓名" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
      <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input"  lay-verify="required">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">规则</label>
    <div class="layui-input-block">
      <select name="rule_id" lay-filter="rule_id"  lay-verify="required">
        <option value=""></option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="2">3</option>
        <option value="3">音乐</option>
        <option value="4">旅行</option>
      </select>
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">是否可用</label>
    <div class="layui-input-block">
      <input type="radio" name="status" value="1" title="可用" checked="">
      <input type="radio" name="status" value="0" title="不可用">
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
    			parent.layer.msg(data.data["id"],{
    				icon: 6,
    				time: 5500
    			});
    			/*setTimeout(function(){
    				parent.location.reload();
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