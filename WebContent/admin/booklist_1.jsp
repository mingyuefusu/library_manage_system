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
    .layui-table{
      margin-top: 0px;
    }
  </style>
</head>
<body>
    <table id="demo" lay-filter="test">
      
    </table>
 <script type="text/html" id="operate">
   <button type="button" class="layui-btn layui-btn-warm">修改</button> 
   <button type="button" class="layui-btn layui-btn-danger">删除</button> 
</script>
<script>
layui.use('table', function(){
  var table = layui.table;
  table.render({
    elem: '#demo'
    ,height: 600
    //,url: './data.json' 
    ,url: './bookList'
    ,title: '数据表单'
    ,toolbar: true
    ,page: true 
    ,size: 'lg'
    ,cols: [[ 
      {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
      ,{field: 'name', title: '姓名', width:120}
      ,{field: 'library_name', title: '图书馆', width:80} 
      ,{field: 'sort_id', title: '分类', width: 177}
      ,{field: 'position_id', title: '位置', width: 80, sort: true}
      ,{field: 'state', title: '状态', width: 80, sort: true}
      ,{field: 'descript', title: '描述', width: 80}
      ,{field: 'operate', title: '操作', width: 200, templet: '#operate'}
    ]]
  });
  
});
</script>
          
</table>
</body>
</html>