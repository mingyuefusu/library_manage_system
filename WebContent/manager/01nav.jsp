<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>图书馆管理人员页面</title>
	<link rel="stylesheet" href="../public/layui/css/layui.css">
	<script src="../public/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">图书馆管理人员页面</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
   
   <ul class="layui-nav layui-layout-left">

      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="../reader/04readerFrame.jsp" target="parent">图书馆首页</a></dd>
          <dd><a href="../adminLogin.html" target="parent">系统管理员</a></dd>
        </dl>
      </li>
    </ul>
    
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
         <%=session.getAttribute("manager") %>
        </a>
        <dl class="layui-nav-child">
          <dd><a href="09managerSelf.jsp"  target="content">基本资料</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="./quit" target="_parent">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;"><i class="layui-icon layui-icon-read" style="font-size: 20px; color: lightblue;"></i>&nbsp;图书管理</a>
          <dl class="layui-nav-child">
            <dd><a href="02borrow.jsp" target="content">借阅图书</a></dd>
            <dd><a href="04judge.jsp;" target="content">归还图书</a></dd>

          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;"><i class="layui-icon layui-icon-form" style="font-size: 20px; color: orange;"></i>&nbsp;报表管理</a>
          <dl class="layui-nav-child">
            <dd><a href="06borrowTable.jsp" target="content">借书报表</a></dd>
            <dd><a href="07returnTable.jsp" target="content">还书报表</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="08announcement.jsp" target="content"><i class="layui-icon layui-icon-release" style="font-size: 20px; color: yellow;"></i>&nbsp;发布公告</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <iframe src="02borrow.jsp" name="content" height="100%" width="100%" frameborder="0" ></iframe>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © 图书管理系统 
  </div>
</div>
<script src="../src/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>