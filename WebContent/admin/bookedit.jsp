<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>bookadd</title>
  <!-- layui -->
  <link rel="stylesheet" href="../public/layui/css/layui.css">
  <script src="../public/layui/layui.js"></script>
 
  <style>
    .layui-form{
      margin-top: 10px;
      margin-right: 10px;
    }
  </style>
</head>
<body>
  <form class="layui-form" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">书名</label>
    <div class="layui-input-block">
      <input type="text" name="title" required  lay-verify="required" placeholder="请输入书名" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">图书馆</label>
    <div class="layui-input-block">
      <select name="library_id" lay-verify="required">
        <option value=""></option>
        <option value="0">南图</option>
        <option value="1">北图</option>
        <option value="2">第三图书馆</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">分类</label>
    <div class="layui-input-block">
      <select name="sort_id" lay-verify="required">
        <option value=""></option>
        <option value="1">幽默</option>
        <option value="2">护理</option>
        <option value="3">编程</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">位置</label>
    <div class="layui-input-block">
      <input type="text" name="position" required  lay-verify="required" placeholder="请输入位置编号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">状态</label>
    <div class="layui-input-block">
      <input type="radio" name="status" value="1" title="可借" checked>
      <input type="radio" name="status" value="0" title="不可借">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">书籍简介</label>
    <div class="layui-input-block">
      <textarea name="description" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
<script>

layui.use('form', function(){
  var form = layui.form;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });
});

</script>

</body>
</html>