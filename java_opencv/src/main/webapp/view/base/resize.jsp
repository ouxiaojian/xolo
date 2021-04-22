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
			var baseImageFile = "/statics/sourceimage/lena.png"
			var newImagePath = "/statics/distimage/lena.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//缩放
			$("#resize").click(function(){
				var resizeType = $("input[name='resize_type']:checked").val();
				var rewidth = $("#rewidth").val();
				console.log("houtai:"+rewidth);
				var reheight = $("#reheight").val();
				//alert(kwidth+"|"+kheight+"|"+sigmaX+"|"+sigmaY);
				var imagefile = baseImageFile;
				var srcurl = ctxPath+"/base/resize?_" + $.now()+"&rewidth="+rewidth+"&reheight="+reheight+"&resizeType="+resizeType+"&imagefile="+baseImageFile;
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
			$("#rewidth").slider({
				tooltip: 'always',
			});
			$("#reheight").slider({
				tooltip: 'always',
			});
			
 			$("#rewidth").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue); 
			    //需要赋值，否则获取的有可能是变化之前的值
			    $("#rewidth").val(e.value.newValue);
			    $("#resize").click();
			});
 			
 			$("#reheight").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);  
			    //需要赋值，否则获取的有可能是变化之前的值
			    $("#reheight").val(e.value.newValue);
			    $("#resize").click();
			});
 			
			//iCheck样式加载
		  	$("input[name='resize_type']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
		  	
			//type类型更换时自动生成
		  	$("input[name='resize_type']").on('ifChecked', function(event){
		  		$("#resize").click();
		  	 	 //alert($(event).text());
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
                        图片缩放方法说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                  	参考资料：<a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/geometric_transformations.html#resize">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/geometric_transformations.html#resize</a>
                      		<br>public static void resize(Mat src, Mat dst, Size dsize, double fx, double fy, int interpolation); 各参数说明：</h4>
                      		<table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 20%">参数</th>
				                  <th>说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>Mat src</td>
				                  <td>源文件Mat对象</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>Mat dst</td>
				                  <td>目标文件Mat对象</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td>Size dsize</td>
				                  <td>dsize表示输出图像的大小，如果为0，则dsize=Size(round(fx*src.cols),round(fy*src.rows))</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>double fx</td>
				                  <td>水平方向放大比例，dsize和fx、fy不能同时为0。取0时，fx=(double)dsize.width/src.cols</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>double fy</td>
				                  <td>垂直方向放大比例，dsize和fx、fy不能同时为0。取0时，fy=(double)dsize.height/src.rows</td>
				                </tr>
				                <tr>
				                  <td>6.</td>
				                  <td>int interpolation</td>
				                  <td>插值方式：INTER_NEAREST - 最近邻插值；INTER_LINEAR - 线性插值（默认）；INTER_AREA - 区域插值；INTER_CUBIC - 三次样条插值；INTER_LANCZOS4 - Lanczos插值</td>
				                </tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
            </div>
            <!-- /.box-body -->
            
            <h4>&nbsp;&nbsp;图像缩放测试</h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:20%">缩放倍数-宽</th>
                  <th style="width:20%">缩放倍数-高</th>
                  <th style="width:20%">放大OR缩小</th>
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input id="rewidth" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="2" data-slider-step="0.1" data-slider-value="1"/>
				  </td>
                  <td>
                  		<input id="reheight" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="2" data-slider-step="0.1" data-slider-value="1"/>
                  </td>
                  <td>
                  		<input type="radio" name="resize_type" value="1" checked="checked"/>&nbsp;放大 &nbsp;
                  		<input type="radio" name="resize_type" value="2"/>&nbsp;缩小&nbsp;
                  
                  </td>
                  <td><a class="btn btn-info"  id="resize"><i class="fa fa-object-ungroup"></i>缩放</a>
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
<script src="${ctxStatic}/plugins/iCheck/icheck.js?t=${version}"></script>
</html>
