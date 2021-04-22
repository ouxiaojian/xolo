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
			$("#canny").click(function(){
				var isBinary = $("input[name='isBinary']").is(":checked");
				var threshold1 = $("#threshold1").val();
				var threshold2 = $("#threshold2").val();
				var imagefile = baseImageFile;
				if(isBinary){
					imagefile = "/statics/sourceimage/test2.png";
					$("#oldimg").attr("src",baseUrl+imagefile);
				}else{
					$("#oldimg").attr("src",baseUrl+baseImageFile);
				}
				var srcurl = ctxPath+"/base/canny?_" + $.now()+"&threshold1="+threshold1+"&threshold2="+threshold2+"&isBinary="+isBinary+"&imagefile="+imagefile;
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
			$("#threshold1").slider({
				tooltip: 'always',
			});
			$("#threshold2").slider({
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
			    $("#canny").click();
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
			    $("#canny").click();
			});
 			
 			
		  	$("input[name='isBinary']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
			//type类型更换时自动生成
		  	$("input[name='isBinary']").on("ifChanged", function(event){
		  		$("#canny").click();
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
                        	 Canny边缘检测
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                    <h4>参考资料：<br>
                    <a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/feature_detection.html#canny">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/feature_detection.html#canny</a><br>
                   通常情况下边缘检测的目的是在保留原有图像属性的情况下，显著减少图像的数据规模。目前有多种算法可以进行边缘检测，虽然Canny算法年代久远，但可以说它是边缘检测的一种标准算法，而且仍在研究中广泛使用。
                   <br> Canny边缘检测,被认为是最优算法的边缘检测，优点：1、低错误率，可以尽可能多的识别出最多的边缘，同时尽可能减少噪点产生，
                    高定位性，识别出的边缘，与原图像中的实际边缘尽可能相近。最少处理次数，指标是一次影像中的边缘。Canny算法内部处理步骤：
                    1、使用高斯平滑滤波器进行除噪，减少噪点。2、计算梯度幅值和方向，此处按照Sobel滤波器的步骤。3、应用抑制非极大值，保留了一些细线条
                    方法：public static void Canny(Mat image, Mat edges, double threshold1, double threshold2); 各参数说明：</h4>
                      		<table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 20%">参数</th>
				                  <th>说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>Mat image</td>
				                  <td>源文件Mat对象,单通道l 8-bit 灰度图</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>Mat edges</td>
				                  <td>目标边缘集合Mat对象</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td>double threshold1</td>
				                  <td>下限阈值，如果一个像素的梯度低于下限阈值， 则被抛弃；</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>double threshold2</td>
				                  <td>上限阈值，如果一个像素的梯度大于上限阈值，则被认为是边缘像素。Canny推荐的上下限阈值比为2：1到3：1之间</td>
				                </tr>
				                <tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
                
                
            </div>
            <!-- /.box-body -->
            
            <h4>&nbsp;&nbsp;Canny边缘检测</h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:20%">上限阈值</th>
                  <th style="width:20%">下限阈值</th>
<!--                   <th style="width:20%">使用黑白图</th> -->
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input id="threshold1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="300" data-slider-step="1" data-slider-value="50"/>
				  </td>
                  <td>
                  		<input id="threshold2" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="300" data-slider-step="1" data-slider-value="150"/>
                  </td>
<!--                   <td> -->
<!--                   		<input type="checkbox" name="isBinary" value="1"/>&nbsp;使用黑白图 &nbsp;<br> -->
                  
<!--                   </td> -->
                  <td><a class="btn btn-info"  id="canny"><i class="fa fa-object-ungroup"></i>Canny边缘检测</a>
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
