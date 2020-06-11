<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>系统管理员</title>
	<!-- layui -->
	<link rel="stylesheet" href="../public/layui/css/layui.css">
	<script src="../public/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">系统管理员</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">首页</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="../reader/04readerFrame.jsp">图书馆首页</a></dd>
          <dd><a href="../loginManager.html">图书管理员</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          系统管理员
        </a>
        <dl class="layui-nav-child">
          <dd id="updatePassword"><a href="javascript:;">修改密码</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="./logOut">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="./booklist.jsp"  target="content"><i class="layui-icon layui-icon-read" style="font-size: 16px; color: #1E9FFF;"></i> 书籍管理</a>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="./sortlist.jsp"  target="content"><i class="layui-icon layui-icon-tabs" style="font-size: 16px; color: #1E9FFF;"></i> 书籍类型</a>
        </li>
        <li class="layui-nav-item">
          <a href="./cardlist.jsp"  target="content"><i class="layui-icon layui-icon-template-1" style="font-size: 16px; color: #1E9FFF;"> </i>借阅证管理</a>
        </li>
        <li class="layui-nav-item"><a href="./borrowlist.jsp" target="content"><i class="layui-icon layui-icon-chart-screen" style="font-size: 16px; color: #1E9FFF;"></i> 借阅信息查询</a></li>
        <li class="layui-nav-item"><a href="./rulelist.jsp"  target="content"><i class="layui-icon layui-icon-file-b" style="font-size: 16px; color: #1E9FFF;"> </i>借阅规则管理</a></li>
        <li class="layui-nav-item"><a href="./managerlist.jsp" target="content"><i class="layui-icon layui-icon-group" style="font-size: 16px; color: #1E9FFF;"></i>图书管理员管理</a></li>
        <li class="layui-nav-item"><a href="./librarydata.jsp" target="content"><i class="layui-icon layui-icon-windows" style="font-size: 16px; color: #1E9FFF;"> </i>系统管理</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <iframe src="librarydata.jsp" name="content" height="100%" width="100%" frameborder="0" scrolling="no"></iframe>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    ©  图书管理系统
  </div>
</div>

<script>
//JavaScript代码区域
layui.use(['element', 'jquery', 'layer'], function(){
  $ = layui.jquery;
  var element = layui.element
  $ = layui.jquery;
  var form = layui.form
  ,layer = layui.layer;

  $("#updatePassword").click(function(){
	  layer.open({
	    title: '修改密码',
	    type: 2,
	    area: ['300px', '300px'],
	    maxmin: true,
  	  	shadeClose: true,
  	  	content: 'updatePassword.jsp'
	  })
  })
});
</script>
</body>
</html>