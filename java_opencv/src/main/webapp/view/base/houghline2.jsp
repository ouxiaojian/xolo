<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
	<link rel="stylesheet" href="${ctxStatic}/plugins/bootstrap-slider/slider.css">
	<link rel="stylesheet" href="${ctxStatic}/plugins/iCheck/all.css?t=${version}">
	<link rel="stylesheet" href="${ctxStatic}/plugins/iCheck/minimal/blue.css?t=${version}">
    <script type="text/javascript">
		$(function(){
			var baseImageFile = "/statics/sourceimage/line1.png"
			var newImagePath = "/statics/distimage/lena.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//缩放
			$("#houghline").click(function(){
				var threshold1 = $("#threshold1").val();
				var threshold2 = $("#threshold2").val();
				var threshold = $("#threshold").val();
				var minLineLength = $("#minLineLength").val();
				var maxLineGap = $("#maxLineGap").val();
				var imagefile = baseImageFile;
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				var srcurl = ctxPath+"/base/houghline?_" + $.now()+"&threshold1="+threshold1+"&threshold2="+threshold2+"&threshold="+threshold+
						"&minLineLength="+minLineLength+"&maxLineGap="+maxLineGap+"&imagefile="+imagefile;
				$("#newimg").attr("src",srcurl);
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/line1.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
			//滑动插件加载
			$("#threshold1,#threshold2,#threshold,#minLineLength,#maxLineGap").slider({
				tooltip: 'always',
			});
			
 			$("#threshold1").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue); 
			    //需要赋值，否则获取的有可能是变化之前的值
			    $("#threshold1").val(e.value.newValue);
			    $("#houghline").click();
			});
 			
 			$("#threshold2").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue); 
			    //需要赋值，否则获取的有可能是变化之前的值
			    $("#threshold2").val(e.value.newValue);
			    $("#houghline").click();
			});
 			
 			$("#threshold").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue); 
			    //需要赋值，否则获取的有可能是变化之前的值
			    $("#threshold").val(e.value.newValue);
			    $("#houghline").click();
			});
 			
 			$("#minLineLength").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue); 
			    //需要赋值，否则获取的有可能是变化之前的值
			    $("#minLineLength").val(e.value.newValue);
			    $("#houghline").click();
			});
 			
 			$("#maxLineGap").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue); 
			    //需要赋值，否则获取的有可能是变化之前的值
			    $("#maxLineGap").val(e.value.newValue);
			    $("#houghline").click();
			});
 			
 			
		});
		
		
		
	</script>
</head>
<body>

              <div class="box-group" id="accordion">
                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                <div class="panel box box-primary">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                        	 霍夫线变换
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                     <h4>参考资料：<br>
                    <a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/feature_detection.html#houghlines">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/feature_detection.html#houghlines</a><br>
                  	 霍夫线变换：Hough Line 是一种在影像中找出直线的方法，先求得角度与半径再利用三角函数推算直线。	 <br>
                	 实现原理:
                    <a href="http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/imgproc/imgtrans/hough_lines/hough_lines.html#hough-lines">霍夫线变换介绍demo</a><br>
		                     如HoughLinesP方法：public static void HoughLinesP(Mat image, Mat lines, double rho, double theta, int threshold, double minLineLength, double maxLineGap); 各参数说明：</h4>
                      		<table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 20%">参数</th>
				                  <th>说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>Mat image</td>
				                  <td>源文件Mat对象,单通道 8-bit 灰度图，一般是经过边缘检测的输出图像</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>Mat lines</td>
				                  <td>储存着检测到的直线的参数对 (r,\theta) 的容器</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td>double rho</td>
				                  <td>参数极径 r 以像素值为单位的分辨率. 我们使用 1 像素</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>double theta</td>
				                  <td>参数极角 \theta 以弧度为单位的分辨率. 我们使用 1度 (即CV_PI/180)</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>int threshold</td>
				                  <td>要”检测” 一条直线所需最少的的曲线交点</td>
				                </tr>
				                <tr>
				                  <td>6.</td>
				                  <td>double minLineLength</td>
				                  <td>能组成一条直线的最少点的数量. 点数量不足的直线将被抛弃。即为线段的最小长度</td>
				                </tr>
				                <tr>
				                  <td>7.</td>
				                  <td>double maxLineGap</td>
				                  <td>线段上最近两点之间的阈值，也就是能被认为在一条直线上的两点的最大距离</td>
				                </tr>
				                <tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
                
                
            </div>
            <!-- /.box-body -->
            
            <h4>&nbsp;&nbsp; 霍夫线变换</h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:15%">int threshold</th>
                  <th style="width:15%">double minLineLength</th>
                  <th style="width:15%">double maxLineGap</th>
                  <th style="width:15%">double Canny_threshold1</th>
                  <th style="width:15%">double Canny_threshold2</th>
<!--                   <th style="width:20%">使用黑白图</th> -->
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input id="threshold" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="300" data-slider-step="1" data-slider-value="30"/>
				  </td>
                  <td>
                  		<input id="minLineLength" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="300" data-slider-step="1" data-slider-value="50"/>
				  </td>
                  <td>
                  		<input id="maxLineGap" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="300" data-slider-step="1" data-slider-value="10"/>
                  </td>
                  <td>
                  		<input id="threshold1" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="300" data-slider-step="1" data-slider-value="100"/>
				  </td>
                  <td>
                  		<input id="threshold2" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="300" data-slider-step="1" data-slider-value="300"/>
                  </td>
<!--                   <td> -->
<!--                   		<input type="checkbox" name="isBinary" value="1"/>&nbsp;使用黑白图 &nbsp;<br> -->
                  
<!--                   </td> -->
                  <td><a class="btn btn-info"  id="houghline"><i class="fa fa-object-ungroup"></i>霍夫线检测</a>
			          <a class="btn btn-info" id="reset"><i class="fa fa-refresh"></i>重置</a></td>
                </tr>
              </tbody></table></div>
    			
    			
	
			   
			<div class="row">
			    <div class="col-sm-6">
			      <div class="box box-primary">
			        <div class="box-header with-border">
			          <h3 class="box-title">原图</h3>
			          <span class="label label-primary pull-right"><i class="fa fa-html5"></i></span>
			        </div><!-- /.box-header -->
			        <div class="box-body">
			          <p>未识别前的原文件。</p>
		          		<img id="oldimg" src=""  alt="原图" />
			        </div><!-- /.box-body -->
			      </div><!-- /.box -->
			    </div><!-- /.col -->
			    <div class="col-sm-6">
			      <div class="box box-danger">
			        <div class="box-header with-border">
			          <h3 class="box-title">识别后的图片</h3>
			          <span class="label label-danger pull-right"><i class="fa fa-database"></i></span>
			        </div><!-- /.box-header -->
			        <div class="box-body">
			          <p>点击识别按钮后，将显示识别后的文件。</p>
			          <img  id="newimg" src=""  alt="此处将展现识别后的图" />

			        </div><!-- /.box-body -->
			      </div><!-- /.box -->
			    </div><!-- /.col -->
			  </div>
						
			
</body>
<script src="${ctxStatic}/plugins/bootstrap-slider/bootstrap-slider.js?t=${version}"></script>
<script src="${ctxStatic}/plugins/iCheck/icheck.js?t=${version}"></script>
</html>
