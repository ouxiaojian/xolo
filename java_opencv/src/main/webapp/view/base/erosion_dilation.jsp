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
			$("#erosion_dilation").click(function(){
				var isBinary = $("input[name='isBinary']").is(":checked");
				var operateType = $("input[name='operate_type']:checked").val();
				var shapeType = $("input[name='shape_type']:checked").val();
				var kSize = $("#kSize").val();
				//alert(kwidth+"|"+kheight+"|"+sigmaX+"|"+sigmaY);
				var imagefile = baseImageFile;
				if(isBinary){
					imagefile = "/statics/sourceimage/test2.png";
					$("#oldimg").attr("src",baseUrl+imagefile);
				}else{
					$("#oldimg").attr("src",baseUrl+baseImageFile);
				}
				var srcurl = ctxPath+"/base/erodingAndDilation?_" + $.now()+"&operateType="+operateType+"&shapeType="+shapeType+"&kSize="+kSize+"&isBinary="+isBinary+"&imagefile="+imagefile;
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
			$("#kSize").slider({
				tooltip: 'always',
			});
			
 			$("#kSize").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue); 
			    //需要赋值，否则获取的有可能是变化之前的值
			    $("#kSize").val(e.value.newValue);
			    $("#erosion_dilation").click();
			});
 			
 			
			//iCheck样式加载
			
		  	$("input[name='operate_type']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
			//type类型更换时自动生成
		  	$("input[name='operate_type']").on('ifChecked', function(event){
		  		$("#erosion_dilation").click();
		  	});
			
			
		  	$("input[name='shape_type']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
			//type类型更换时自动生成
		  	$("input[name='shape_type']").on('ifChecked', function(event){
		  		$("#erosion_dilation").click();
		  	});
 			
		  	$("input[name='isBinary']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
			//type类型更换时自动生成
		  	$("input[name='isBinary']").on("ifChanged", function(event){
		  		$("#erosion_dilation").click();
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
                        腐蚀膨胀说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                    <h4>参考资料：<br>
                      		<a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/filtering.html#erode">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/filtering.html#erode</a> <br>
                      		<a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/filtering.html#dilate">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/filtering.html#dilate</a> <br>
                    从图像处理角度看，二值图像的腐蚀和膨胀就是将一个小型二值图（结构元素，一般为3*3大小）在一个大的二值图上逐点移动并进行比较，根据比较的结果作出相应处理而已。
膨胀算法：用3X3的结构元素，扫描二值图像的每一个像素，用结构元素与其覆盖的二值图像做“与”运算，如果都为0，结构图像的该像素为0，否则为1.结果：使二值图像扩大一圈。
腐蚀算法：用3X3的结构元素，扫描二值图像的每一个像素，用结构元素与其覆盖的二值图像做“与”运算，如果都为1，结构图像的该像素为1，否则为0.结果：使二值图像减小一圈。
OpenCV里面的腐蚀膨胀说的都是针对白色目标区域的。膨胀是指图像中的白色目标区域扩大，腐蚀是指白色区域变少，对于白色区域来说就是腐蚀。
                    	腐蚀膨胀算法为public static void erode(Mat src, Mat dst, Mat kernel)；public static void dilate(Mat src, Mat dst, Mat kernel)
                    	两者都需要使用一个核矩阵即参数中的kernel进行处理：public static Mat getStructuringElement(int shape, Size ksize); 各参数说明：</h4>
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
				                  <td>Mat kernel</td>
				                  <td>腐蚀或膨胀操作的内核，预设的是一个3*3的矩阵</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>int shape</td>
				                  <td>内核使用的形状:MORPH_RECT=0矩形;MORPH_CROSS=1交叉; MORPH_ELLIPSE=2椭圆；</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>Size ksize</td>
				                  <td>使用 的内核大小</td>
				                </tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
            </div>
            <!-- /.box-body -->
            
            <h4>&nbsp;&nbsp;腐蚀膨胀测试</h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:20%">腐蚀膨胀因子，具体ksize为：设置数值*2+1</th>
                  <th style="width:20%">内核形状</th>
                  <th style="width:20%">腐蚀OR膨胀</th>
                  <th style="width:20%">使用黑白图</th>
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input id="kSize" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="20" data-slider-step="1" data-slider-value="1"/>
				  </td>
                  <td>
                  		<input type="radio" name="shape_type" value="0" checked="checked"/>&nbsp;MORPH_RECT=0矩形 &nbsp;<br>
                  		<input type="radio" name="shape_type" value="1"/>&nbsp;MORPH_CROSS=1交叉 &nbsp;<br>
                  		<input type="radio" name="shape_type" value="2"/>&nbsp;MORPH_ELLIPSE=2椭圆&nbsp;
                  </td>
                  <td>
                  		<input type="radio" name="operate_type" value="1" checked="checked"/>&nbsp;腐蚀 &nbsp;<br>
                  		<input type="radio" name="operate_type" value="2"/>&nbsp;膨胀&nbsp;
                  
                  </td>
                  <td>
                  		<input type="checkbox" name="isBinary" value="1"/>&nbsp;使用黑白图 &nbsp;<br>
                  
                  </td>
                  <td><a class="btn btn-info"  id="erosion_dilation"><i class="fa fa-object-ungroup"></i>腐蚀膨胀</a>
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
