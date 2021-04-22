<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
	<link rel="stylesheet" href="${ctxStatic}/plugins/bootstrap-slider/slider.css">
    <script type="text/javascript">
		$(function(){
			var baseImageFile = "/statics/sourceimage/lena.png"
			var newImagePath = "/statics/distimage/lena.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//高斯模糊
			$("#gaussian").click(function(){
				var kwidth = $("#kwidth").val();
				var kheight = $("#kheight").val();
				var sigmaX = $("#sigmaX").val();
				var sigmaY = $("#sigmaY").val();
				//alert(kwidth+"|"+kheight+"|"+sigmaX+"|"+sigmaY);
				var imagefile = baseImageFile;
				var srcurl = ctxPath+"/base/gaussian?_" + $.now()+"&kwidth="+kwidth+"&kheight="+kheight+"&sigmaX="+sigmaX+"&sigmaY="+sigmaY+"&imagefile="+baseImageFile;
				$("#newimg").attr("src",srcurl);
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/lena.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
			//滑动插件加载
			$("#kwidth").slider({
				tooltip: 'always',
			});
			$("#kheight").slider({
				tooltip: 'always',
			});
			$("#sigmaX").slider({
				tooltip: 'always',
			});
			$("#sigmaY").slider({
				tooltip: 'always',
			});
			
 			$("#kwidth").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
				$("#kwidth").val(e.value.newValue);
			    $("#gaussian").click();
			});
 			
 			$("#kheight").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
				$("#kheight").val(e.value.newValue);
			    $("#gaussian").click();
			});
 			
 			$("#sigmaX").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
				$("#sigmaX").val(e.value.newValue);
			    $("#gaussian").click();
			});
 			
 			$("#sigmaY").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
				$("#sigmaY").val(e.value.newValue);
			    $("#gaussian").click();
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
                        1.Gaussian Blur介绍
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                      		<h4>参考资料：<br>
                      		<a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/filtering.html#gaussianblur">Opencv官方文档：gaussianblur</a> <br>
                      		<a href="https://baike.baidu.com/item/%E9%AB%98%E6%96%AF%E6%A8%A1%E7%B3%8A/10885810?fr=aladdin&fromid=11165960&fromtitle=Gaussian+Blur">百度高斯模糊词条</a> <br>
                      		<br>高斯模糊：Gaussian Blur，也叫高斯平滑，是在图像处理过程中十分常用的处理效果，通常是用它来减少图像噪声，降低细节层次。
                      		在OpenCV中的相关材料中可能会出现高斯模糊和高斯滤波两种说法，其实这两种说法是有一定区别的。我们知道滤波器分为高通、低通、带通等类型，
                      		高斯滤波和高斯模糊就是依据滤波器是低通滤波器还是高通滤波器来区分的。比如低通滤波器，像素能量低的通过，而对于像素能量高的部分将会采取加权平均的方法重新计算像素的值，
                      		将能量像素的值变成能量较低的值，我们知道对于图像而言其高频部分展现图像细节，所以经过低通滤波器之后整幅图像变成低频造成图像模糊，这就被称为高斯模糊；
                      		相反高通滤波是允许高频通过而过滤掉低频，这样将低频像素进行锐化操作，图像变的更加清晰，被称为高斯滤波。
                      		说白了很简单就是：高斯滤波是指用高斯函数作为滤波函数的滤波操作而高斯模糊是用高斯低通滤波器。高斯滤波器是一类根据高斯函数的形状来选择权值的线性平滑滤波器，高斯滤波器对于服从正太分布的噪声非常有效
                      		public static void GaussianBlur(Mat src, Mat dst, Size ksize, double sigmaX, double sigmaY, int borderType); 各参数说明：</h4>
                      		<table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 20%">参数</th>
				                  <th>说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>Mat src</td>
				                  <td>源文件Mat对象，支持任何通道的图片类型，但是深度只支持CV_8U, CV_16U, CV_16S, CV_32F , CV_64F</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>Mat dst</td>
				                  <td>目标文件Mat对象，将和源图片有着相同的大小和类型</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td>Size ksize</td>
				                  <td>高斯核大小，模糊可以理解成每一个像素都取周边像素的平均值，这个ksize就是指定像素块大小的</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>double sigmaX</td>
				                  <td>sigmaX为高斯滤波在横线的滤波系数</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>double sigmaY</td>
				                  <td>sigmaY为高斯滤波在竖向的滤波系数。如果sigmaY是零,它被设置为等于sigmaX,如果X也为0，则将根据ksize.width和ksize.height计算</td>
				                </tr>
				                <tr>
				                  <td>6.</td>
				                  <td>int borderType</td>
				                  <td>borderType为边缘扩展点插值类型</td>
				                </tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
            </div>
            <!-- /.box-body -->
            
            <h4>&nbsp;&nbsp;高斯滤波测试</h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:20%">size中宽为2*kwidth+1</th>
                  <th style="width:20%">size中高为2*kheight+1</th>
                  <th style="width:20%">sigmaX</th>
                  <th style="width:20%">sigmaY</th>
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input id="kwidth" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="10" data-slider-step="1" data-slider-value="1"/>
				  </td>
                  <td>
                  		<input id="kheight" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="10" data-slider-step="1" data-slider-value="1"/>
                  </td>
                  <td>
                  		<input id="sigmaX" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="10" data-slider-step="1" data-slider-value="0"/>
                  </td>
                  <td>
                  		<input id="sigmaY" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="10" data-slider-step="1" data-slider-value="0"/>
                  </td>
                  <td><a class="btn btn-info"  id="gaussian"><i class="fa fa-object-ungroup"></i>高斯模糊</a>
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
			          <img  id="newimg" src=""  alt="识别后的图" />

			        </div><!-- /.box-body -->
			      </div><!-- /.box -->
			    </div><!-- /.col -->
			  </div>
						
			
</body>
<script src="${ctxStatic}/plugins/bootstrap-slider/bootstrap-slider.js?t=${version}"></script>
</html>
