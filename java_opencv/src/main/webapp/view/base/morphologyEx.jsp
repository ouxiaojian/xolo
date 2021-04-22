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
				var srcurl = ctxPath+"/base/morphologyEx?_" + $.now()+"&operateType="+operateType+"&shapeType="+shapeType+"&kSize="+kSize+"&isBinary="+isBinary+"&imagefile="+imagefile;
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
                        	腐蚀膨胀进阶
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                    <h4>参考资料：<br>
                    	<a href="http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/imgproc/opening_closing_hats/opening_closing_hats.html#morphology-2">官网形态学进阶demo</a><br>
                      	<a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/filtering.html#morphologyex">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/filtering.html#morphologyex</a> <br>
                    腐蚀和膨胀是最基本的形态学操作，但是运用这两种基本的操作，我们可以实现更高级的形态学变换，如OpenCV给我们提供的
                    morphologyEx函数，就可以实现诸如：开闭运算、形态学梯度、“顶帽”、“黑帽”等。
                    	public static void morphologyEx(Mat src, Mat dst, int op, Mat kernel); 
                    	其中核矩阵即参数中的kernel进行处理：public static Mat getStructuringElement(int shape, Size ksize); 各参数说明：</h4>
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
				                  <td>int op</td>
				                  <td>操作类型:MORPH_OPEN=2开运算;MORPH_CLOSE=3闭运算; MORPH_GRADIENT=4形态梯度；MORPH_TOPHAT=5顶帽；MORPH_BLACKHAT=6黑帽</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>Mat kernel</td>
				                  <td>腐蚀或膨胀操作的内核，预设的是一个3*3的矩阵</td>
				                </tr>
				                <tr>
				                <tr>
				                  <td>5.</td>
				                  <td>int shape</td>
				                  <td>内核使用的形状:MORPH_RECT=0矩形;MORPH_CROSS=1交叉; MORPH_ELLIPSE=2椭圆；</td>
				                </tr>
				                <tr>
				                  <td>6.</td>
				                  <td>Size ksize</td>
				                  <td>使用 的内核大小</td>
				                </tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
                
                
                <div class="panel box box-success">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                        操作类型说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="box-body">
							 <table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th>类型说明</th>
				                  <th>公式</th>
				                  <th>解释说明</th>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>MORPH_OPEN，开运算</td>
				                  <td><img alt="" src ="${ctxStatic}/images/MORPH_OPEN.png"></td>
				                  <td>先腐蚀后膨胀的过程，用来消除小物体、在纤细点处分离物体、平滑较大物体的边界的同时并不明显改变其面积</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td>MORPH_CLOSE，闭运算</td>
				                  <td><img alt="" src ="${ctxStatic}/images/MORPH_CLOSE.png"></td>
				                  <td>先膨胀后腐蚀的过程，能够排除小型黑洞(黑色区域)</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>MORPH_GRADIENT，形态梯度</td>
				                  <td><img alt="" src ="${ctxStatic}/images/MORPH_GRADIENT.png"></td>
				                  <td>为膨胀图与腐蚀图之差，对二值图像进行这一操作可以将团块（blob）的边缘突出出来。可以用形态学梯度来保留物体的边缘轮廓。</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>MORPH_TOPHAT，顶帽</td>
				                  <td><img alt="" src ="${ctxStatic}/images/MORPH_TOPHAT.png"></td>
				                  <td>又被称为”礼帽“运算。为原图像与“开运算“的结果图之差。因为开运算带来的结果是放大了裂缝或者局部低亮度的区域，因此，从原图中减去开运算后的图，得到的效果图突出了比原图轮廓周围的区域更明亮的区域，且这一操作和选择的核的大小相关。
顶帽运算往往用来分离比邻近点亮一些的斑块。当一幅图像具有大幅的背景的时候，而微小物品比较有规律的情况下，可以使用顶帽运算进行背景提取。</td>
				                </tr>
				                <tr>
				                  <td>6.</td>
				                  <td>MORPH_BLACKHAT，黑帽</td>
				                  <td><img alt="" src ="${ctxStatic}/images/MORPH_BLACKHAT.png"></td>
				                  <td>为”闭运算“的结果图与原图像之差，黑帽运算后的效果图突出了比原图轮廓周围的区域更暗的区域，且这一操作和选择的核的大小相关。
										所以，黑帽运算用来分离比邻近点暗一些的斑块</td>
				                </tr>
				              </tbody>
				             </table>
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
                  <th style="width:20%">操作类型</th>
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
                  		<input type="radio" name="operate_type" value="2" checked="checked"/>&nbsp;2开运算&nbsp;<br>
                  		<input type="radio" name="operate_type" value="3"/>&nbsp;3闭运算&nbsp;<br>
                  		<input type="radio" name="operate_type" value="4"/>&nbsp;4形态梯度&nbsp;<br>
                  		<input type="radio" name="operate_type" value="5"/>&nbsp;5顶帽&nbsp;<br>
                  		<input type="radio" name="operate_type" value="6"/>&nbsp;6黑帽&nbsp;
                  
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
