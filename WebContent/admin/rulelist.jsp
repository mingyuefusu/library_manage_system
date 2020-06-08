<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>规则列表</title>
	<link rel="stylesheet" href="../public/layui/css/layui.css"  media="all">
	<style>
		.layui-table,.layui-table-view{
			margin: 0 0px;
		}
	</style>
	
</head>
<body>
	<!-- 表单 -->
	<table class="layui-hide" id="ruleTable" lay-filter="formFilter"></table>
	<script src="../public/layui/layui.js" charset="utf-8"></script>
	<!-- 头部工具栏 -->
	<script type="text/html" id="headBar">
		<button type="button" class="layui-btn  layui-btn-sm" lay-event="add"><i class="layui-icon">添加</i></button>
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
	    elem: '#ruleTable'
	    ,url:'./ruleList'
	    ,toolbar: '#headBar'
	    ,height: '600'
	    ,cols: [[
	      {fixed: 'left',field:'id', width:140, title: 'ID', sort: true}
	      ,{field:'limit_day', width:180, title: '限制天数', sort: true}
	      ,{field:'borrow_num', width:180, title: '限制本数', sort: true}
	      ,{field:'borrow_library', width:180, title: '限制图书馆'}
	      ,{field:'overtime_fee', title: '逾期每天费用', width: 150}
	      ,{fixed: 'right', title:'操作', toolbar: '#operateBar', align: 'center', width:150}
	    ]]
	  });
	  
	  // 头部工具栏事件
	  table.on('toolbar(formFilter)', function(obj){
		  var checkStatus = table.checkStatus(obj.config.id);
		  switch(obj.event){
		    // 添加规则
		    case 'add':
		    	var addCardLayer = layer.open({
		    		type: 2,
		    		title: '添加规则',
		    		area: ['800px', '500px'],
		  	  	  	maxmin: true,
		  	  	  	content: 'ruleadd.jsp',
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
	  	  	  	content: 'ruleedit.jsp?id=' +id,
	  	  	  })
	  	  	break;
	  	  case 'del':
	  		  layer.confirm("确认要删除么，非必要请勿删除",function(){
	  			$.ajax({
	  				url: './ruleDel',
	  				data: "id=" +id,
	  				type: 'get',
	  				dataType: 'json',
	  				timout: 3000,
	  				success: function(data){
	  					if(data.code == 0){
	  						layer.msg(data.msg,{
	  							icon: 6,
	  							anim: 5,
	  							time: 500
	  						})
	  						setTimeout(function(){
	  							parent.location.reload();
	  						}, 500)
	  						
	  					}else{
	  						layer.msg(data.msg,{
	  							icon:5,
	  							anim:6 
	  						})
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