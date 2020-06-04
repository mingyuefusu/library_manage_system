<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<style>
.showCarousel  .carousel-inner > .item > img {

    display: block;
    width:100%;
    height:620px;
}
.showCarousel{
	margin-top:2%;
}
font{
	font-size:40px;
	color:black;
	font-family:YouYuan;
	font-weight:900;
}
.carousel-caption{
	margin-bottom:10%;
}
</style>
</head>
<body>

<div id="carousel-example-generic" class="carousel slide showCarousel" data-ride="carousel" data-interval="2000" style="width:96%;margin-left:2%;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="../public/image/Carousel1.jpg" alt="...">
      <div class="carousel-caption">
		<font>hello world!</font>
      </div>
    </div>
    <div class="item">
      <img src="../public/image/Carousel2.jpg" alt="...">
      <div class="carousel-caption">
		<font>冲鸭！</font>
      </div>
    </div>
	<div class="item">
      <img src="../public/image/Carousel3.jpg" alt="...">
      <div class="carousel-caption">
		<font>今天你掉头发了吗？</font>
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</body>
</html>