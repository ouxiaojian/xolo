<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
	<link rel="stylesheet" href="${ctxStatic}/plugins/bootstrap-slider/slider.css">
    <script type="text/javascript">
		$(function(){
			var baseImageFile = "/statics/sourceimage/floodfill3.png"
			var newImagePath = "/statics/distimage/floodfill.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//锐化
			$("#floodfill").click(function(){
				var graysize = $("#graysize").val();
				var lodiff = $("#lodiff").val();
				var updiff = $("#updiff").val();
				var flag = $("#flag").val();
				//alert(graysize+"|"+lodiff+"|"+updiff+"|"+flag);
				var imagefile = baseImageFile;
				var srcurl = ctxPath+"/base/floodfill?_" + $.now()+"&graysize="+graysize+"&lodiff="+lodiff+"&updiff="+updiff+"&flag="+flag+"&imagefile="+baseImageFile;
				$("#newimg").attr("src",srcurl);
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/floodfill3.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
			//滑动插件加载
			$("#graysize").slider({
				tooltip: 'always',
			});
			$("#lodiff").slider({
				tooltip: 'always',
			});
			$("#updiff").slider({
				tooltip: 'always',
			});
			$("#flag").slider({
				tooltip: 'always',
			});
			
 			$("#graysize").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
				$("#graysize").val(e.value.newValue);
			    $("#floodfill").click();
			});
 			
 			$("#lodiff").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
				$("#lodiff").val(e.value.newValue);
			    $("#floodfill").click();
			});
 			
 			$("#updiff").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
				$("#updiff").val(e.value.newValue);
			    $("#floodfill").click();
			});
 			
 			$("#flag").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
				$("#flag").val(e.value.newValue);
			    $("#floodfill").click();
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
                       漫水填充floodfill
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                      		<h4>参考资料：<br>
                      		<a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/miscellaneous_transformations.html#floodfill">Opencv官方文档：floodfill</a> <br>
                      		<a href="https://blog.csdn.net/poem_qianmo/article/details/28261997">OpenCV漫水填充算法</a> <br>
                      		<br>public static int floodFill(Mat image, Mat mask, Point seedPoint, Scalar newVal, Rect rect, Scalar loDiff, Scalar upDiff, int flags); 各参数说明：</h4>
                      		<table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 20%">参数</th>
				                  <th>说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>Mat image</td>
				                  <td>输入/输出1通道或3通道，8位或浮点图像</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>Mat mask</td>
				                  <td>操作掩模,。它应该为单通道、8位、长和宽上都比输入图像 image 大两个像素点的图像。第二个版本的floodFill需要使用以及更新掩膜，所以这个mask参数我们一定要将其准备好并填在此处。需要注意的是，漫水填充不会填充掩膜mask的非零像素区域。例如，一个边缘检测算子的输出可以用来作为掩膜，以防止填充到边缘。同样的，也可以在多次的函数调用中使用同一个掩膜，以保证填充的区域不会重叠。另外需要注意的是，掩膜mask会比需填充的图像大，所以 mask 中与输入图像(x,y)像素点相对应的点的坐标为(x+1,y+1)。</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td>Point seedPoint</td>
				                  <td>Point类型的seedPoint，漫水填充算法的起始点</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>Scalar newVal</td>
				                  <td>Scalar类型的newVal，像素点被染色的值，即在重绘区域像素的新值</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>Rect rect</td>
				                  <td>Rect类型的rect,有默认值0，一个可选的参数，用于设置floodFill函数将要重绘区域的最小边界矩形区域。</td>
				                </tr>
				                <tr>
				                  <td>6.</td>
				                  <td> Scalar loDiff</td>
				                  <td>Scalar类型的loDiff，有默认值Scalar( )，表示当前观察像素值与其部件邻域像素值或者待加入该部件的种子像素之间的亮度或颜色之负差（lower brightness/color difference）的最大值。</td>
				                </tr>
				                <tr>
				                  <td>7.</td>
				                  <td> Scalar upDiff</td>
				                  <td>Scalar类型的upDiff，有默认值Scalar( )，表示当前观察像素值与其部件邻域像素值或者待加入该部件的种子像素之间的亮度或颜色之正差（lower brightness/color difference）的最大值。</td>
				                </tr>
				                <tr>
				                  <td>6.</td>
				                  <td>int flags</td>
				                  <td>int类型的flags，操作标志符，此参数包含三个部分，比较复杂<br>
    <b>低八位（第0~7位）</b>用于控制算法的连通性，可取4 (4为缺省值) 或者 8。如果设为4，表示填充算法只考虑当前像素水平方向和垂直方向的相邻点；如果设为 8，除上述相邻点外，还会包含对角线方向的相邻点。<br>
   <b>高八位部分（16~23位）</b> 可以为0 或者如下两种选项标识符的组合：     
FLOODFILL_FIXED_RANGE - 如果设置为这个标识符的话，就会考虑当前像素与种子像素之间的差，否则就考虑当前像素与其相邻像素的差。也就是说，这个范围是浮动的。
FLOODFILL_MASK_ONLY - 如果设置为这个标识符的话，函数不会去填充改变原始图像 (也就是忽略第三个参数newVal), 而是去填充掩模图像（mask）。这个标识符只对第二个版本的floodFill有用，因第一个版本里面压根就没有mask参数。<br>
   <b> 中间八位部分</b>，上面关于高八位FLOODFILL_MASK_ONLY标识符中已经说的很明显，需要输入符合要求的掩码。Floodfill的flags参数的中间八位的值就是用于指定填充掩码图像的值的。但如果flags中间八位的值为0，则掩码会用1来填充。<br>
    而所有flags可以用or操作符连接起来，即“|”。例如，如果想用8邻域填充，并填充固定像素值范围，填充掩码而不是填充源图像，以及设填充值为38，那么输入的参数是这样：
    flags=8 | FLOODFILL_MASK_ONLY | FLOODFILL_FIXED_RANGE | (38<<8)

				                  
				                  </td>
				                </tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
            </div>
            <!-- /.box-body -->
            
            <h4>&nbsp;&nbsp;漫水填充测试</h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:20%">灰度值</th>
                  <th style="width:20%">lodiff</th>
                  <th style="width:20%">updiff</th>
                  <th style="width:20%">flag</th>
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input id="graysize" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="255" data-slider-step="1" data-slider-value="40"/>
				  </td>
                  <td>
                  		<input id="lodiff" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="5"/>
                  </td>
                  <td>
                  		<input id="updiff" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="5"/>
                  </td>
                  <td>
                  		<input id="flag" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="0"/>
                  </td>
                  <td><a class="btn btn-info"  id="floodfill"><i class="fa fa-object-ungroup"></i>漫水填充</a>
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
