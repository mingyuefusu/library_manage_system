<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>test</title>
  <!-- layui -->
  <link rel="stylesheet" href="../public/layui/css/layui.css">
  <script src="../public/layui/layui.js"></script>
  <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
  <style>
    .layui-table, .layui-table-view{
    	margin-top: 0px;
    }
  </style>
</head>
<body>
	<!-- 搜索框 -->
	<script  type="text/html" id="search">
		<div class="demoTable">
		条件搜索：
		 <div class="layui-inline">
	  	  <select id="condition" name="condition" lay-verify="required">
        	<option value=""></option>
        	<option value="id">id</option>
        	<option value="name">书名</option>
        	<option value="library">图书馆</option>
        	<option value="position">位置</option>
        	<option value="status">状态</option>
			<option value="description">描述</option>
		  </select>
	 	 </div>
	 	 <div class="layui-inline">
	  	  <input class="layui-input" name="conditionValue" id="conditionValue" autocomplete="off" placeholder="请输入搜索内容">
	 	 </div>
	 	 <button class="layui-btn" data-type="reload" lay-event="search">搜索</button>
		 <button type="button" class="layui-btn  layui-btn-sm"  lay-event="add"><i class="layui-icon"></i></button>
	</div>
	</script>
    
	<!-- 表单 -->
    <table id="demo" lay-filter="form">
      
    </table>
    
	<!-- 行操作  -->
	<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	<script>
		
		layui.use(['table', 'jquery'],function(){
		  $ = layui.jquery;
		  var table = layui.table;
		  var tableIns =  table.render({
		     elem: '#demo'
		    ,height: 600
		    //,url: './data.json' 
		    ,url: './bookList'
		    ,title: '数据表单'
		    ,toolbar: '#search'
		    ,page: true 
		    //,size: 'lg'
		    ,cols: [[
		   	  {type: 'numbers', width:50, fixed:'left'}
		      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
		      ,{field: 'name', title: '书名', width:180}
		      ,{field: 'library_id', title: '图书馆', width:80, edit: true} 
		      ,{field: 'sort_id', title: '分类', width: 100}
		      ,{field: 'position', title: '位置', width: 120, sort: true}
		      ,{field: 'status', title: '状态', width: 80, sort: true}
		      ,{field: 'description', title: '描述', width: 380}
		      //,{field: 'operate', title: '操作', width: 200, templet: '#operate'}
		      ,{fixed: 'right', title:'操作', width:150, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
		    ]]
		  	,id: 'idTest'
		  });
		  
		  // 直接编辑
		  table.on('edit(form)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
			  console.log(obj.value); //得到修改后的值
			  console.log(obj.field); //当前编辑的字段名
			  console.log(obj.data); //所在行的所有相关数据  
			});
		  
		  
		// 监听工具条  编辑，删除
		 table.on('tool(form)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
		    var data = obj.data; //获得当前行数据
		    var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
		    var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
		    var id = data.id;
		    if(layEvent === 'del'){ //删除
		      layer.confirm('真的删除行么', function(index){
		        //obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
		        layer.close(index);
		        //向服务端发送删除指令
		        $.ajax({
		        	url: './bookdel',
		        	method: 'get',
		        	dataType: 'JSON',
		        	data: "id=" +id,
		        	success: function(data){
		        		layer.msg("success");
		        	}
	        	})
		        //location.reload();
		      });
		    } else if(layEvent === 'edit'){ //编辑
		      //do something
		     
		      // 页面编辑
		      layer.open({
				  type: 2,
				  title: "更改信息",
				  area: ['800px', '600px'],
				  maxmin: true, //开启最大化最小化按钮
				  shadeClose: true,
				  content: "bookedit.jsp?id="+ id,
				  end: function () {
					  console.log("finish edit");
					  location.reload();
				  }
				});
		      
		      //同步更新缓存对应的值
		      obj.update({
		        username: '123'
		        ,title: 'xxx'
		      });
		    } else if(layEvent === 'LAYTABLE_TIPS'){
		      layer.alert('Hi，头部工具栏扩展的右侧图标。');
		    }
		  });
		
		   
		  
		  // 工具栏事件
		  table.on('toolbar(form)', function(obj){
			  var checkStatus = table.checkStatus(obj.config.id);
			  var data = obj.data;
			  switch(obj.event){
			    case 'search':
			    	 var conditionValue = $('#conditionValue');
			    	 var condition = $('#condition');
				    	//这里以搜索为例
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
			    	var addBookLayer = layer.open({
						  type: 2,
						  title: "添加书籍",
						  area: ['800px', '600px'],
						  maxmin: true, //开启最大化最小化按钮
						  shadeClose: true,
						  content: "bookadd.jsp",
						  end: function () {
							  console.log("finish add");
							  //location.reload();
						  }
						});
			    	layer.full(addBookLayer);
			    	break;
			    
			  };
			});
		  
		});
		
		
		
	</script>      
</body>
</html>