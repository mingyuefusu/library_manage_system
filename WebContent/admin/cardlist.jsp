<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>借阅卡</title>
	<link rel="stylesheet" href="../public/layui/css/layui.css"  media="all">
	<style>
		.layui-table,.layui-table-view{
			margin: 0 0px;
		}
	</style>
	
</head>
<body>
	<!-- 表单 -->
	<table class="layui-hide" id="cardTable" lay-filter="formFilter"></table>
	<script src="../public/layui/layui.js" charset="utf-8"></script>
	<!-- 头部工具栏 -->
	<script type="text/html" id="headBar">
 		 条件搜索：
		<div class="layui-inline">
	  	  <select id="condition" name="condition" lay-verify="required">
        	<option value=""></option>
        	<option value="id">ID</option>
        	<option value="name">书名</option>
			<option value="author">作者</option>
        	<option value="library">图书馆</option>
        	<option value="position">位置</option>
        	<option value="status">状态</option>
			<option value="description">描述</option>
		  </select>
	 	 </div>
  		<div class="layui-inline">
    		<input class="layui-input" id="conditionValue" name="conditionValue" id="demoReload" autocomplete="off">
  		</div>
  		<button class="layui-btn" name="condition" data-type="reload"  lay-event="search">搜索</button>
		<button type="button" class="layui-btn  layui-btn-sm" lay-event="add"><i class="layui-icon"></i></button>
	</script>
	
	<!-- 表格后面的操作 -->
	<script type="text/html" id="operateBar">
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
 	 	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	<script> 
	layui.use(['table','jquery'], function(){
	  $ = layui.jquery;
	  var table = layui.table;
	  // 进行渲染
	  var tableIns =  table.render({
	    elem: '#cardTable'
	    ,url:'./data.json'
	    ,toolbar: '#headBar'
	    ,cols: [[
	      {field:'id', width:80, title: 'ID', sort: true}
	      ,{field:'username', width:80, title: '用户名'}
	      ,{field:'sex', width:80, title: '性别', sort: true}
	      ,{field:'city', width:80, title: '城市'}
	      ,{field:'sign', title: '签名', minWidth: 150}
	      ,{field:'experience', width:80, title: '积分', sort: true}
	      ,{field:'score', width:80, title: '评分', sort: true}
	      ,{field:'classify', width:80, title: '职业'}
	      ,{field:'wealth', width:135, title: '财富', sort: true}
	      ,{fixed: 'right', title:'操作', toolbar: '#operateBar', align: 'center', width:150}
	    ]]
	    ,page: true
	  });
	  
	  // 头部工具栏事件
	  table.on('toolbar(formFilter)', function(obj){
		  var checkStatus = table.checkStatus(obj.config.id);
		  switch(obj.event){
		  	// 条件查找图书证
		    case 'search':
		      var conditionValue = $('#conditionValue');
	    	  var condition = $('#condition');
	    	  layer.msg(condition.val());
	    	  // 进行搜索，重新渲染
	    	  tableIns.reload({
				    where: { //设定异步数据接口的额外参数，任意设
				    	"condition": condition.val(),
				    	"conditionValue": conditionValue.val()
				    }
				    ,page: {
				      curr: 1 //重新从第 1 页开始
				    }
				  });
		    break;
		    // 添加借书证
		    case 'add':
		    	var addCardLayer = layer.open({
		    		type: 2,
		    		title: '添加借书证',
		    		area: ['800px', '500px'],
		  	  	  	maxmin: true,
		  	  	  	shadeClose: true,
		  	  	  	content: 'cardadd.jsp',
		    	});
		    	//layer.full(addCardLayer);
		  };
		});
	 
	  // 侧边工具栏事件
	  table.on(('tool(formFilter)'), function(obj){
	  	var data = obj.data;
	  	var layEvent = obj.event;
	  	var tr = obj.tr;
	  	switch(obj.event){
	  	  case 'edit':
	  	  	  layer.open({
	  	  	  	type: 2,
	  	  	  	title: '更改信息',
	  	  	  	area: ['800px', '600px'],
	  	  	  	maxmin: true,
	  	  	  	shadeClose: true,
	  	  	  	content: 'cardedit.jsp',
	  	  	  })
	  	  	break;
	  	}
	  })
	});
	</script>
</body>
</html>