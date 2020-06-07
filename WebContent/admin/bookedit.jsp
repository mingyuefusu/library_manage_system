<%@page import="javabean.JDBCBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javabean.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>bookedit</title>
  <!-- layui -->
  <link rel="stylesheet" href="../public/layui/css/layui.css">
  <script src="../public/layui/layui.js"></script>
 
  <style>
    .layui-form{
      margin: 10px 20px;
    }
  </style>
</head>
<body>
  
  <%
  	JDBCBean db = new JDBCBean();
  	int id = Integer.parseInt(request.getParameter("id"));
	ResultSet resultSet = null;
	ResultSet librarySet = null;
	ResultSet bookSortSet = null;
	String sql = "select * from books where id=" +id ;
 	resultSet =  db.executeQuery(sql);
 	resultSet.next();
  	String name = resultSet.getString("name");
  	String author = resultSet.getString("author");
  	int library_id = resultSet.getInt("library_id");
  	int sort_id = resultSet.getInt("sort_id");
  	String position = resultSet.getString("position");
  	int status = resultSet.getInt("status");
  	String description = resultSet.getString("description");
  	db.close();
  	// 获取图书馆列表
  	JDBCBean db2 = new JDBCBean();
  	String librarySql = "select * from library";
  	librarySet = db2.executeQuery( librarySql );
  	
  	
  	// 获取书籍分类
  	JDBCBean db3 = new JDBCBean();
  	String bookSortSql = "select * from book_sort";
  	bookSortSet = db3.executeQuery( bookSortSql );
  	
  %>
  
  <form class="layui-form   layui-form-pane" action="">
 <%-- 隐藏id --%>
  <input type="id" name="id" value=<%=id %> class="layui-hide">
  <!-- 书名 -->
  <div class="layui-form-item">
    <label class="layui-form-label">书名</label>
    <div class="layui-input-block">
      <input type="text" name="name" value=<%=name %> required  lay-verify="required" placeholder="请输入书名" autocomplete="off" class="layui-input">
    </div>
  </div>
  <!-- 作者 -->
  <div class="layui-form-item">
    <label class="layui-form-label">作者</label>
    <div class="layui-input-block">
      <input type="text" name="author" value=<%=author %> required  lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input">
    </div>
  </div>
  <!-- 图书馆 -->
  <div class="layui-form-item">
    <label class="layui-form-label">图书馆</label>
    <div class="layui-input-block">
      <select name="library_id" lay-verify="required">
      	<option value=""></option>
      	<% while( librarySet.next() ){ %>
      		<%-- 选中原来的 图书馆--%>
        	<option value=<%=librarySet.getString("id") %> <%if(Integer.parseInt(librarySet.getString("id")) == library_id){ out.print("selected"); } %> ><%=librarySet.getString("name") %></option>
        <%} %>
      </select>
    </div>
  </div>
  <!-- 分类 -->
  <div class="layui-form-item">
    <label class="layui-form-label">分类</label>
    <div class="layui-input-block">
      <select name="sort_id" lay-verify="required">
      <option value=""></option>
        <% while(bookSortSet.next()){ %>
        <option value=<%=bookSortSet.getInt("id") %> <% if(bookSortSet.getInt("id") == sort_id) out.print("selected"); %>><%=bookSortSet.getString("name") %></option>
        <%} %>
      </select>
    </div>
  </div>
  <!-- 位置 -->
  <div class="layui-form-item">
    <label class="layui-form-label">位置</label>
    <div class="layui-input-block">
      <input type="text" name="position" value=<%=position %> required  lay-verify="required" placeholder="请输入位置编号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <!-- 位置 -->
  <div class="layui-form-item">
    <label class="layui-form-label">状态</label>
    <div class="layui-input-block">
      <input type="radio" name="status" value="1" title="可借" <%if(status==1) out.print("checked"); %>>
      <input type="radio" name="status" value="0" title="不可借" <%if(status==0) out.print("checked"); %> >
    </div>
  </div>
   
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">书籍简介</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea layui-hide"  name="description" lay-verify="content" id="LAY_demo_editor"><%=description %></textarea>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
<script>

layui.use(['form', 'layedit', 'jquery'], function(){
  //layer.closeAll();
  $ = layui.jquery;
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit;
  var editIndex = layedit.build('LAY_demo_editor');
  // 自定义验证规则
  form.verify({
	  // 解决异步传输问题
	  content: function(value){
		  return layedit.sync(editIndex);
	  }
  })
  //监听提交
  form.on('submit(formDemo)', function(data){
    $.ajax({
    	url: './bookEdit',
    	method: 'post',
    	data: data.field, //JSON.stringify(data.field),
    	dataType: 'json',
    	success: function(data){
    		if(data.code == "0"){
    			parent.layer.msg("修改成功",{
    				icon: 6,
    				time: 500
    			});
    			setTimeout(function(){
    				var index = parent.layer.getFrameIndex(window.name); //操作父页面
            		parent.layer.close(index);
    			}, 500);
        		
    		}else{
    			leyer.msg("修改失败");
    		}
    	    
    	}
    })
    
    
    return false;
  });
});

</script>
<%
	// 关闭资源
	bookSortSet.close();
	librarySet.close();
	resultSet.close();
	db.close();
%>
</body>
</html>