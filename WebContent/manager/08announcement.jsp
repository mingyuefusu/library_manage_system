<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../public/layui/css/layui.css"  media="all">
<script src="../public/layui/layui.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table class="layui-hide" id="annTable" lay-filter="formFilter"></table>
	
	<script type="text/html" id="headBar">
		<button type="button" class="layui-btn  layui-btn-sm" lay-event="add"><i class="layui-icon"><i class="layui-icon layui-icon-release" style="font-size: 20px; color: yellow;"></i>&nbsp;发布新公告</i></button>
	</script>
	
	<script type="text/html" id="rightBar">
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
 	 	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	<script> 
	layui.use(['table','jquery'], function(){
	  $ = layui.jquery;
	  var table = layui.table;
	  // 进行渲染
	  var tableIns =  table.render({
	    elem: '#annTable'
	    ,url:'./announcement'
	    ,toolbar: '#headBar'
	    ,height: 600
	    ,cols: [[
	      {field:'id', width:80, title: 'ID', sort: true}
	      ,{field:'title', width:230, title: '标题'}
	      ,{field:'detail', width:580, title: '公告'}
	      ,{field:'publish_date', title: '发布日期', minWidth: 100, sort: true}
	      ,{fixed: 'right', title:'操作', toolbar: '#rightBar', align: 'center', width:150}
	    ]]
	  });
	  
	  // 头部工具栏事件
	  table.on('toolbar(formFilter)', function(obj){
		  var checkStatus = table.checkStatus(obj.config.id);
		  switch(obj.event){
		    // 添加公告
		    case 'add':
		    	var addCardLayer = layer.open({
		    		type: 2,
		    		title: '发布公告',
		    		area: ['800px', '500px'],
		  	  	  	maxmin: true,
		  	  	  	shadeClose: true,
		  	  	  	content: '08add.jsp',
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
	  	  	  	content: '08edit.jsp?id=' +id,
	  	  	  })
	  	  	break;
	  	  case 'del':
	  		  layer.confirm('确定要删除么？',function(){
	  			  layer.msg("ok");
	  			  $.ajax({
	  				  url: './announcementDel',
	  				  data: 'id=' +id,
	  				  type: 'get',
	  				  dataType: 'json',
	  				  timeout: 3000,
	  				  success: function(data){
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