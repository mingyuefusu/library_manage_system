<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javabean.JDBCBean"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
  <style>
    .layui-table, .layui-table-view{
    	margin-top: 0px;
    }
  </style>
</head>
<body>
	<%
		
		JDBCBean libraryDb = new JDBCBean();
		JDBCBean bookSortDb = new JDBCBean();
		ResultSet librarySet = null;
		ResultSet bookSortSet = null;
		// 准备sql
		String librarySql = "select * from library";
		String bookSortSql = "select * from book_sort";
		// 进行查询
		librarySet = libraryDb.executeQuery( librarySql );
		bookSortSet = bookSortDb.executeQuery( bookSortSql );
		// 准备json
		JSONObject libraryJson = new JSONObject();
		JSONObject bookSortJson = new JSONObject();
		
		// 遍历set
		// 获取图书馆json
		while( librarySet.next() ){
			libraryJson.put(librarySet.getString("id") , librarySet.getString("name"));
		}
		// 获取分类json		
		while( bookSortSet.next() ){
			bookSortJson.put(bookSortSet.getString("id") , bookSortSet.getString("name"));
		}
		librarySet.close();
		libraryDb.close();
		
	%>
	<!-- 搜索框 -->
	<script  type="text/html" id="search">
		<div class="demoTable">
		条件搜索：
		 <div class="layui-inline">
	  	  <select id="condition" name="condition" lay-verify="required">
        	<option value=""></option>
        	<option value="id">ID</option>
        	<option value="name">书名</option>
			<option value="author">作者</option>
        	<option value="library_id">图书馆</option>
        	<option value="position">位置</option>
        	<option value="status">状态</option>
			<option value="description">描述</option>
		  </select>
	 	 </div>
	 	 <div class="layui-inline">
	  	  <input class="layui-input" name="conditionValue" id="conditionValue" autocomplete="off" placeholder="请输入搜索内容">
	 	 </div>
	 	 <button class="layui-btn" data-type="reload" lay-event="search">搜索</button>
		 <button type="button" class="layui-btn  layui-btn-sm"  lay-event="add"><i class="layui-icon">添加书籍</i></button>
	</div>
	</script>
    
	<!-- 表单 -->
    <table id="demo" lay-filter="form">
      
    </table>
    
	<!-- 行操作  -->
	<script type="text/html" id="operateBar">
		<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="bookBorrowList">查看借阅</a>
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	<script>
		// 图书馆json
		var libraryJson = <%=libraryJson %>
		// 图书分类json
		var bookSortJson = <%=bookSortJson %>
	</script>
	<!-- 状态模板 -->
	<script type="text/html" id="statusTpl">
  		{{#  if(d.status == 1){ }}
   	 		<span style="color:#5FB878;">可借</span>
  		{{#  } else { }}
    	        借出
  		{{#  } }}
	</script>
	
	 
	<script>
		
		layui.use(['table', 'jquery'],function(){
		  $ = layui.jquery;
		  var table = layui.table;
		  var tableIns =  table.render({
		     elem: '#demo'
		    ,height: 600
		    ,url: './bookList'
		    ,title: '数据表单'
		    ,toolbar: '#search'
		    ,page: true 
		    ,cols: [[
		   	  {type: 'numbers', width:50, fixed:'left'}
		      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
		      ,{field: 'name', title: '书名', width:170, sort: true}
		      ,{field: 'author', title: '作者', width: 140, sort: true}
		      ,{field: 'library_id', title: '图书馆', width:80, edit: true //,templet: '#libraryTemp'}
		          ,templet: function(d){
		              return libraryJson[d.library_id];
		            }}
		      ,{field: 'sort_id', title: '分类', width: 80, sort: true, edit:true
		    	  ,templet: function(d){
		    		  return bookSortJson[d.sort_id];
		    	  }}
		      ,{field: 'position', title: '位置', width: 110, sort: true}
		      ,{field: 'status', title: '状态', width: 60, templet:'#statusTpl'}
		      ,{field: 'description', title: '描述', width: 340}
		      ,{fixed: 'right', title:'操作', width: 200, align:'center', toolbar: '#operateBar'} //这里的toolbar值是模板元素的选择器
		    ]]
		  });
		  
		  // 直接编辑
		  table.on('edit(form)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
			  console.log(obj.value); //得到修改后的值
			  console.log(obj.field); //当前编辑的字段名
			  console.log(obj.data); //所在行的所有相关数据  
			});
		  
		  
		// 监听侧边工具条  编辑，删除
		 table.on('tool(form)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
		    var data = obj.data; //获得当前行数据
		    var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
		    var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
		    var id = data.id;
		    var name = data.name;
		    if(layEvent === 'del'){ //删除
		      layer.confirm('真的删除行么', function(index){
		        layer.close(index);
		        //向服务端发送删除指令
		        $.ajax({
		        	url: './bookDel',
		        	method: 'get',
		        	dataType: 'JSON',
		        	data: "id=" +id,
		        	success: function(data){
		        		if(data.code == 0){
		        			layer.msg(data.msg);
		        			$('.layui-laypage-btn').click();
		        		}else{
		        			layer.msg(data.msg);
		        		}
		        		
		        	}
	        	})
		      });
		    } else if(layEvent === 'edit'){ //编辑
		      // 页面编辑
		      layer.open({
				  type: 2,
				  title: "更改信息",
				  area: ['800px', '600px'],
				  maxmin: true, //开启最大化最小化按钮
				  shadeClose: true,
				  content: "bookedit.jsp?id="+ id,
				  end: function(){
					  $(".layui-laypage-btn").click();
				  }
				});
		    }else if(layEvent === 'bookBorrowList') { //查看该书籍借阅历史
		    	layer.open({
		    		title: '书籍借阅历史',
		    		type: 2,
		    		area: ['800px', '600px'],
		    		maxmin: true,
		    		shadeClose: true,
		    		content: "bookborrowlist.jsp?id=" +id +"&name="+name
		    	})
		    	
		    }
		  });
		
		   
		  
		  // 顶部工具栏事件
		  table.on('toolbar(form)', function(obj){
			  var checkStatus = table.checkStatus(obj.config.id);
			  var data = obj.data;
			  switch(obj.event){
			  	// 条件查找
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
		    	// 添加书籍
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
							  $(".layui-laypage-btn").click();
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