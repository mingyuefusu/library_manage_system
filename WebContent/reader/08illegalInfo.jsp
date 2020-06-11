<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- Bootstrap -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/bootstrap-table.css" rel="stylesheet">
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap-table.js"></script>
	<script src="../bootstrap-table-zh-CN.js"></script>
	<link rel="stylesheet" href="../public/layui/css/layui.css"  media="all">
	<link rel="stylesheet" href="../public/layui/css/layui.css"  media="all">
	<style>
		.layui-table,.layui-table-view{
			margin: 0 0px;
		}
		.layui-form-select dl dd.layui-this { background-color: #FF5722; }
	</style>
	
</head>
<body>
	<%
		if(session.getAttribute("reader") == null){
	%>
	<script>
		location.href="../loginReader.html";
	</script>
	<%
		}
	%>
	<script src="../public/layui/layui.js" charset="utf-8"></script>
	<!-- 表单 -->
	<table class="layui-hide" id="cardTable" lay-filter="formFilter"></table>
	
	<!-- 头部工具栏 -->
	<script type="text/html" id="headBar">
 		 条件搜索：
		<div class="layui-inline">
	  	  <select id="condition" name="condition" lay-verify="required">
        	<option value=""></option>
			<option value="book_id">图书编号</option>
        	<option value="borrow_date">借阅日期</option>
        	<option value="end_date">截止日期</option>
			<option value="return_date">归还日期</option>
			<option value="illegal">违章信息</option>
			<option value="manager_id">处理人</option>
		  </select>
	 	 </div>
  		<div class="layui-inline">
    		<input class="layui-input" id="conditionValue" name="conditionValue" id="demoReload" autocomplete="off">
  		</div>
  		<button class="layui-btn layui-btn-danger" name="condition" data-type="reload"  lay-event="search">搜索</button>
	</script>
	


	<script> 
	layui.use(['table','jquery'], function(){
	  $ = layui.jquery;
	  var table = layui.table;
	  // 进行渲染
	  var tableIns =  table.render({
	    elem: '#cardTable'
	    ,url:'./illegal'
	    ,toolbar: '#headBar'
	    ,cols: [[
	      {field:'card_id', width:180, title: '借阅证号', sort: true}
	      ,{field:'book_id', minwidth:80, title: '图书编号', sort: true}
	      ,{field:'borrow_date', width:250, title: '借阅日期', sort: true}
	      ,{field:'end_date', title: '截止日期', width: 250, sort: true}
	      ,{field:'return_date', width:250, title: '归还时间', sort: true}
	      ,{field:'illegal', width:180, title: '违章信息', sort: true,style:'color: red;'}
	      ,{field:'manager_id', width:90, title: '处理人', sort: true}

	    ]]
	    ,page: true
	    ,page: {theme: '#FF5722'},
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
	  	  	  	content: '',
	  	  	  })
	  	  	break;
	  	}
	  })
	});
	</script>
</body>
</html>