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
        	<option value="reader">姓名</option>
			<option value="rule_id">借阅规则</option>
        	<option value="status">状态</option>
		  </select>
	 	 </div>
  		<div class="layui-inline">
    		<input class="layui-input" id="conditionValue" name="conditionValue" id="demoReload" autocomplete="off" placeholder="请输入搜索内容">
  		</div>
  		<button class="layui-btn" name="condition" data-type="reload"  lay-event="search">搜索</button>
		<button type="button" class="layui-btn  layui-btn-sm" lay-event="add"><i class="layui-icon">添加借阅证</i></button>
	</script>
	
	<!-- 表格侧边栏的操作 -->
	<script type="text/html" id="operateBar">
		<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="cardBorrow">查看借阅</a>
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
 	 	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	<!-- 状态模板 -->
	<script type="text/html" id="statusTpl">
  		{{#  if(d.status == 0){ }}
   	 		<span style="color:red">挂失<span>
  		{{#  } else { }}
    	        可用
  		{{#  } }}
	</script>
	
	<script> 
	layui.use(['table','jquery'], function(){
	  $ = layui.jquery;
	  var table = layui.table;
	  // 进行渲染
	  var tableIns =  table.render({
	    elem: '#cardTable'
	    ,url:'./cardList'
	    ,toolbar: '#headBar'
    	,height: 600
	    ,cols: [[
	      {field:'id', width:180, title: 'ID', sort: true}
	      ,{field:'reader', width:180, title: '用户名', sort: true}
	      ,{field:'rule_id', width:180, title: '借阅规则', sort: true}
	      ,{field:'status', width:180, title: '状态', templet: '#statusTpl'}
	      ,{fixed: 'right', title:'操作', toolbar: '#operateBar', align: 'center', width:250}
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
		  	  	  	end: function(){
		  	  	  		$('.layui-laypage-btn').click();
		  	  	  	}
		    	});
		    	
		    	//layer.full(addCardLayer);
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
	  	  	  	content: 'cardedit.jsp?id=' +id,
	  	  	  	end: function(){
	  	  	  		$(".layui-laypage-btn").click();
	  	  	  	}
	  	  	  })
	  	  	  
	  	  	break;
	  	  case 'del':
	  		  layer.confirm('确认删除么?<br><span style="color:red;">这将删除该借阅证的所有记录</span>',function(index){
	  			  layer.close(index);
	  			  $.ajax({
	  				  url: './cardDel',
 					  type: 'get',
 					  data: 'id=' +id,
 					  dataType: 'json',
 					  timeout: 3000,
 					  success: function(data){
 						  if(data.code == 0){
 							  console.log(data);
 							  layer.msg(data.msg,{
 								  icon: 6,
 								  time: 1500
 							  })
 							 // 还是本页数据
 							 $(".layui-laypage-btn").click();
 						  }else{
 							  layer.open({
 								  title: '失败',
 								  content: data.msg
 							  })
 						  }
 					  },
 					  error:  function(){
 						  layer.msg("连接超时"); 					  
					  }
	  			  })
	  			  
	  		  })
  		  break;
	  	  case 'cardBorrow':
	  		  layer.open({
	  			type: 2,
	  	  	  	title: '借阅历史',
	  	  	  	area: ['800px', '600px'],
	  	  	  	maxmin: true,
	  	  	  	shadeClose: true,
	  	  	  	content: 'cardborrow.jsp?id=' +id,
	  	  	  	end: function(){
	  	  	  		//$(".layui-laypage-btn").click();
	  	  	  	}
	  		  })
	  	}
	  })
	});
	</script>
</body>
</html>