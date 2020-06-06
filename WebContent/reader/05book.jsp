<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-table.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../bootstrap-table-zh-CN.js"></script>
</head>
<body>
<div>
	<table id="table" data-toggle="table" data-url="data1.json" data-pagination="true" data-search="true">
	  <thead>
	    <tr>
	      <th data-sortable="true" data-field="id">图书编号</th>
	      <th data-sortable="true" data-field="name">图书名称</th>
	      <th data-field="author">图书作者</th>
	      <th data-field="library">图书馆编号</th>
	      <th data-field="sort">图书分类编号</th>
	      <th data-field="position">位置</th>
	      <th data-field="status">状态</th>
	      <th data-field="description">描述</th>
	    </tr>
	  </thead>
	
	</table>
</div>
<script>
$('#table').bootstrapTable({
	  url: 'data1.json',
	  method: 'post',
	  contentType: "application/x-www-form-urlencoded",
	  
	  clickToSelect : true,
	  //排序
	  sortable:true,
	  sortOrder: "asc",
	  sidePagination : "server",
	  
	  pageSize: 10,
	  pageList: [10, 25, 50, 100],
	  //显示列及刷新
	  showColumns:true,
	  showRefresh:true,
	  
	  striped: true,
	  pagination: true,
	  search: true,
	  uniqueId : "id",
	  locale: "zh-CN",
	  strictSearch: true,
	  showExport: true,
	  columns: [{
	    field: 'id',
	    title: '图书编号',
	    align: 'center'
	  }, {
	    field: 'name',
	    title: '图书名称',
	    align: 'center'
	  }, {
		  field: 'author',
		    title: '图书作者',
		    align: 'center'
	  }, {
		  field: 'library',
		    title: '图书馆编号',
		    align: 'center'
	  }, {
		  field: 'sort',
		    title: '图书分类编号',
		    align: 'center'
	  }, {
		  field: 'position',
		    title: '位置',
		    align: 'center'
	  }, {
		  field: 'status',
		    title: '状态'
	  }, {
	    field: 'description',
	    title: '描述',
	    align: 'center'
	  }]
	})
</script>
</body>
</html>