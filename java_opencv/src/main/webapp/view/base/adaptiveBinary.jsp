<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
	<link rel="stylesheet" href="${ctxStatic}/plugins/iCheck/all.css?t=${version}">
	<link rel="stylesheet" href="${ctxStatic}/plugins/bootstrap-slider/slider.css">
	<link rel="stylesheet" href="${ctxStatic}/plugins/iCheck/minimal/blue.css?t=${version}">
    <script type="text/javascript">
		$(function(){
			var baseImageFile = "/statics/sourceimage/ada.png"//
			var newImagePath = "/statics/distimage/lena.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//二值化
			$("#binary").click(function(){
				var binaryType = $("input[name='thresh_type']:checked").val();
				var adaptiveMethod = $("input[name='adaptiveMethod']:checked").val();
				var blockSize = $("#block_value").val();
				var constantC = $("#constantC").val();
				var imagefile = baseImageFile;
				//方式2，实时传输图片流的方式
				var srcurl = ctxPath+"/base/adaptiveBinary?_" + $.now()+"&binaryType="+binaryType+"&blockSize="+blockSize+"&adaptiveMethod="+adaptiveMethod+"&constantC="+constantC+"&imagefile="+baseImageFile;
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
			$("#block_value,#constantC").slider({
				tooltip: 'always',
			});
			
 			$("#constantC").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#constantC").val(e.value.newValue)
			    $("#binary").click();
			});
 			
 			$("#block_value").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#block_value").val(e.value.newValue)
			    $("#binary").click();
			});
			//iCheck样式加载
		  	$("input[name='thresh_type'],input[name='adaptiveMethod']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
		  	
			//type类型更换时自动生成
		  	$("input[name='thresh_type'],input[name='adaptiveMethod']").on('ifChecked', function(event){
		  		$("#binary").click();
		  	 	 //alert($(event).text());
		  	});
		});
		
		
	</script>
</head>
<body>

                <div class="box-body">
              <div class="box-group" id="accordion">
                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                <div class="panel box box-primary">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                        1.adaptivethreshold函数介绍
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                      		<h4>参考资料：<br>
                      		<a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/miscellaneous_transformations.html#adaptivethreshold">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/miscellaneous_transformations.html#adaptivethreshold</a> <br>
                      		<br>
                      		public static void adaptiveThreshold(Mat src, Mat dst, double maxValue, int adaptiveMethod, int thresholdType, int blockSize, double C); 各参数说明：
                      		adaptiveThreshold()支持两种自适应方法，即ADAPTIVE_THRESH_MEAN_C（平均）和ADAPTIVE_THRESH_GAUSSIAN_C（高斯）。
                      		在两种情况下，自适应阈值T(x, y)。通过计算每个像素周围bxb大小像素块的加权均值并减去常量C得到。其中，
                      		b由blockSize给出，大小必须为奇数；如果使用平均的方法，则所有像素周围的权值相同；
                      		如果使用高斯的方法，则（x,y）周围的像素的权值则根据其到中心点的距离通过高斯方程得到。
                      		</h4>
                      		<table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 20%">参数</th>
				                  <th>说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>Mat src</td>
				                  <td>源文件Mat对象，单通道, 8-bit or 32-bit</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>Mat dst</td>
				                  <td>目标文件Mat对象，将和源图片有着相同的大小和类型</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td>double maxValue</td>
				                  <td>最大像素值</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>int adaptiveMethod</td>
				                  <td>自适应方法，平均或高斯</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>int thresholdType</td>
				                  <td>二值化类型</td>
				                </tr>
				                <tr>
				                  <td>6.</td>
				                  <td>int blockSize</td>
				                  <td>范围对比块大小</td>
				                </tr>
				                <tr>
				                  <td>7.</td>
				                  <td>double C</td>
				                  <td>常量</td>
				                </tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
                <div class="panel box box-success">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                        2.二值化类型说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="box-body">
							 <table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 10%">二值化类型</th>
				                  <th>公式</th>
				                  <th>效果图</th>
				                  <th>解释说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>THRESH_BINARY</td>
				                  <td><img alt="" src ="${ctxStatic}/images/THRESH_BINARY_1.png"></td>
				                  <td><img alt="" src="${ctxStatic}/images/THRESH_BINARY_2.png"></td>
				                  <td>在运用该阈值类型的时候，先要选定一个特定的阈值量，比如：125，这样，新的阈值产生规则可以解释为大于125的像素点的灰度值设定为最大值(如8位灰度值最大为255)，灰度值小于125的像素点的灰度值设定为0。</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>THRESH_BINARY_INV</td>
				                  <td><img alt="" src ="${ctxStatic}/images/THRESH_BINARY_INV_1.png"></td>
				                  <td><img alt="" src="${ctxStatic}/images/THRESH_BINARY_INV_2.png"></td>
				                  <td>该阈值化与二进制阈值化相似，先选定一个特定的灰度值作为阈值，不过最后的设定值相反。（在8位灰度图中，例如大于阈值的设定为0，而小于该阈值的设定为255）。</td>
				                </tr>
				              </tbody>
				             </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-body -->
            
            <h4>
    			&nbsp;&nbsp;二值化效果测试      </h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:15%">blockSize</th>
                  <th style="width:15%">constantC</th>
                  <th style="width:30%">type</th>
                  <th style="width:20%">adaptiveMethod</th>
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input id="block_value" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="51" data-slider-step="2" data-slider-value="31"/>
				  </td>
                  <td>
						<input id="constantC" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="50" data-slider-step="1" data-slider-value="15"/>
				  </td>
                  <td>
                  		<input type="radio" name="thresh_type" value="0" checked="checked"/>THRESH_BINARY &nbsp;
                  		<input type="radio" name="thresh_type" value="1"/>THRESH_BINARY_INV&nbsp;
                  </td>
                  <td>
                  		<input type="radio" name="adaptiveMethod" value="0" checked="checked"/>ADAPTIVE_THRESH_MEAN_C &nbsp;<br>
                  		<input type="radio" name="adaptiveMethod" value="1"/>ADAPTIVE_THRESH_GAUSSIAN_C&nbsp;
                  </td>
                  <td><a class="btn btn-info"  id="binary"><i class="fa fa-object-ungroup"></i>二值化</a>
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
