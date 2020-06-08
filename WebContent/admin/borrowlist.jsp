<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>借阅记录</title>
	<link rel="stylesheet" href="../public/layui/css/layui.css"  media="all">
	<style>
		.layui-table,.layui-table-view{
			margin: 0 0px;
		}
	</style>
	
</head>
<body>
	<script src="../public/layui/layui.js" charset="utf-8"></script>
	<!-- 表单 -->
	<table class="layui-hide" id="history" lay-filter="formFilter"></table>
	
	<!-- 头部工具栏 -->
	<script type="text/html" id="headBar">
 		 条件搜索：
		<div class="layui-inline">
	  	  <select id="condition" name="condition" lay-verify="required">
        	<option value=""></option>
			<option value="other">超期未还</option>
        	<option value="id">ID</option>
        	<option value="card_id">借阅证号</option>
			<option value="book_id">书籍ID</option>
        	<option value="borrow_date">借阅日期</option>
        	<option value="end_date">限制日期</option>
			<option value="return_date">返还日期</option>
			<option value="illegal">违章信息</option>
			<option value="manager_id">处理人</option>
		  </select>
	 	 </div>
  		<div class="layui-inline">
    		<input class="layui-input" id="conditionValue" name="conditionValue" id="demoReload" autocomplete="off">
  		</div>
  		<button class="layui-btn" name="condition" data-type="reload"  lay-event="search">搜索</button>
	</script>
	<script> 
	layui.use(['table','jquery'], function(){
	  $ = layui.jquery;
	  var table = layui.table;
	  // 进行渲染
	  var tableIns =  table.render({
	    elem: '#history'
	    ,url:'./borrowList'
	    ,toolbar: '#headBar'
	    ,cols: [[
	      {field:'id', width:80, title: 'ID', sort: true}
	      ,{field:'card_id', width:180, title: '借阅证号'}
	      ,{field:'book_id', width:100, title: '书籍ID', sort: true}
	      ,{field:'borrow_date', width:180, title: '借阅时间'}
	      ,{field:'end_date', title: '限定时间', width: 180}
	      ,{field:'return_date', width:180, title: '归还时间', sort: true}
	      ,{field:'illegal', minWidth:280, title: '违章信息', sort: true}
	      ,{field:'manager_id', width:80, title: '处理人'}
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
		    
		  };
		});
	 
	  
	});
	</script>
</body>
</html>