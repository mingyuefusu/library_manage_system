<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="../public/js/echarts.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width:1200px;height:500px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        myChart.setOption({
		    title: {
		        text: '借书情况'
		    },
		    tooltip: {},
		    legend: {
		        data:['借书量']
		    },
		    xAxis: {
		        data: []
		    },
		    yAxis: {},
		    series: [{
		        name: '借书量',
		        type: 'line',
		        data: []
		    }]
		});
        // 使用刚指定的配置项和数据显示图表。
        //myChart.setOption(option);
        // 异步加载数据
		$.get('./libraryData').done(function (data) {
			if(data.code == 0){
				// 填入数据
			    myChart.setOption({
			        xAxis: {
			            data: data.data.days
			        },
			        series: [{
			            // 根据名字对应到相应的系列
			            name: '借书量',
			            data: data.data.data,
			            type: 'line'
			        }]
	    		});
			}else{
				$('body').append($("<div style='color:red;'>调用接口失败</div>"));
			}
		    
		});
    </script>
</body>
</html>