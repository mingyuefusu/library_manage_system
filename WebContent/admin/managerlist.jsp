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
	<table class="layui-hide" id="managerTable" lay-filter="formFilter"></table>
	<script src="../public/layui/layui.js" charset="utf-8"></script>
	<!-- 头部工具栏 -->
	<script type="text/html" id="headBar">
		<button type="button" class="layui-btn  layui-btn-sm" lay-event="add"><i class="layui-icon">添加管理员</i></button>
	</script>
	
	<!-- 表格侧边栏 -->
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
	    elem: '#managerTable'
	    ,url:'./managerList'
	    ,toolbar: '#headBar'
	    ,height: 600
	    ,cols: [[
	      {field:'id', width:80, title: 'ID', sort: true}
	      ,{field:'account', width:80, title: '账号', sort: true}
	      ,{field:'name', width:80, title: '姓名'}
	      ,{field:'email', title: '邮箱', minWidth: 150}
	      ,{fixed: 'right', title:'操作', toolbar: '#operateBar', align: 'center', width:150}
	    ]]
	  });
	  
	  // 头部工具栏事件
	  table.on('toolbar(formFilter)', function(obj){
		  var checkStatus = table.checkStatus(obj.config.id);
		  switch(obj.event){
		    // 添加管理员
		    case 'add':
		    	var addCardLayer = layer.open({
		    		type: 2,
		    		title: '添加管理员',
		    		area: ['800px', '500px'],
		  	  	  	maxmin: true,
		  	  	  	shadeClose: true,
		  	  	  	content: 'manageradd.jsp',
		    	});
		    	//layer.full(addCardLayer);
		  };
		});
	 
	  // 侧边工具栏事件
	  table.on(('tool(formFilter)'), function(obj){
	  	var data = obj.data;
	  	var layEvent = obj.event;
	  	var id = data.id;
	  	var tr = obj.tr;
	  	switch(obj.event){
	  	  case 'edit':
	  	  	  layer.open({
	  	  	  	type: 2,
	  	  	  	title: '更改信息',
	  	  	  	area: ['800px', '600px'],
	  	  	  	maxmin: true,
	  	  	  	shadeClose: true,
	  	  	  	content: 'manageredit.jsp?id=' +id,
	  	  	  })
	  	  	break;
	  	  case 'del':
	  		  layer.confirm('确定要删除么？',function(){
	  			  layer.msg("ok");
	  			  $.ajax({
	  				  url: './managerDel',
	  				  data: 'id=' +id,
	  				  type: 'get',
	  				  dataType: 'json',
	  				  timeout: 3000,
	  				  success: function(data){
	  					  layer.msg("???");
	  					  if(data.code == 0){
	  						  layer.msg(data.msg,{
	  							  icon: 6,
	  							  anim: 5,
	  							  time: 500
	  						  });
	  						  setTimeout(function(){
	  							  parent.location.reload();
	  						  },500);
	  					  }else{
	  						  layer.msg(data.code);
	  					  }
	  				  },
	  				  error: function(){
	  					  layer.msg("连接超时");
	  				  }
	  			  })
	  		  })
	  	}
	  })
	});
	</script>
</body>
</html>