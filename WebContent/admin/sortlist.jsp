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
		<button type="button" class="layui-btn  layui-btn-sm" lay-event="add"><i class="layui-icon">添加分类</i></button>
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
	    ,url:'./sortList'
	    ,toolbar: '#headBar'
	    ,height: 600
	    ,cols: [[
	      {field:'id', width:80, title: 'ID', sort: true}
	      ,{field:'name', width:180, title: '分类名', sort: true}
	      ,{field:'description', width:480, title: '描述', sort: true}
	      ,{fixed: 'right', title:'操作', toolbar: '#operateBar', align: 'center', width:150}
	    ]]
	  });
	  
	  // 头部工具栏事件
	  table.on('toolbar(formFilter)', function(obj){
		  var checkStatus = table.checkStatus(obj.config.id);
		  switch(obj.event){
		    // 添加分类
		    case 'add':
		    	var addCardLayer = layer.open({
		    		type: 2,
		    		title: '添加借书证',
		    		area: ['800px', '500px'],
		  	  	  	maxmin: true,
		  	  	  	shadeClose: true,
		  	  	  	content: 'sortadd.jsp',
		    	});
		  };
		});
	 
	  // 侧边工具栏事件
	  table.on(('tool(formFilter)'), function(obj){
	  	var data = obj.data;
	  	var layEvent = obj.event;
	  	var tr = obj.tr;
	  	var id = data.id;
	  	switch(obj.event){
	  	  case 'edit':
	  	  	  layer.open({
	  	  	  	type: 2,
	  	  	  	title: '更改信息',
	  	  	  	area: ['800px', '600px'],
	  	  	  	maxmin: true,
	  	  	  	shadeClose: true,
	  	  	  	content: 'sortedit.jsp?id=' +id,
	  	  	  })
	  	  	break;
	  	  case 'del':
	  		  layer.confirm('确认删除么？<br><span style="color:red;">这将会将该分类下的书籍归为未分类</span>', function(){
	  			  $.ajax({
	  				  url: './sortDel',
	  				  type: 'get',
	  				  data: 'id=' +id,
	  				  success: function(data){
	  					if(data.code == 0){
	  		    			parent.layer.msg(data.msg,{
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
	  		  })
	  	}
	  })
	});
	</script>
</body>
</html>