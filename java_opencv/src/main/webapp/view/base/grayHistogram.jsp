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
			var baseImageFile = "/statics/sourceimage/lena-gray.jpg"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			
			//灰度直方图
			$("#grayHistogram").click(function(){
				var cols = $("#cols_value").val();
				var image_w = $("#image_w").val();
				var image_h = $("#image_h").val();
				var image_kedu = $("#image_kedu").val();
				var isShow = $("input[name='isShow']").is(":checked");
				var imagefile = baseImageFile;
				//方式2，实时传输图片流的方式
				var srcurl = ctxPath+"/base/grayHistogram?_" + $.now()+"&cols="+cols+"&imageW="+image_w+"&imageH="+image_h+
						"&imageKedu="+image_kedu+"&isShow="+isShow+"&imagefile="+baseImageFile;
				$("#newimg").attr("src",srcurl); 
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/lena-gray.jpg";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
			//滑动插件加载
			$("#cols_value,#image_w,#image_h,#image_kedu").slider({
				tooltip: 'always',
			});
 			$("#cols_value").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#cols_value").val(e.value.newValue)
			    $("#grayHistogram").click();
			});
 			
 			$("#image_w").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#image_w").val(e.value.newValue)
			    $("#grayHistogram").click();
			});
 			
 			
 			$("#image_h").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#image_h").val(e.value.newValue)
			    $("#grayHistogram").click();
			});
 			
 			$("#image_kedu").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#image_kedu").val(e.value.newValue)
			    $("#grayHistogram").click();
			});
 			
 			$("input[name='isShow']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
			//type类型更换时自动生成
		  	$("input[name='isShow']").on("ifChanged", function(event){
		  		$("#grayHistogram").click();
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
                        	灰度直方图
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                      		<h4>参考资料：<br>
                      		<a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/histograms.html">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/histograms.html</a> <br>
                      		<a href="http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/imgproc/histograms/histogram_calculation/histogram_calculation.html#histogram-calculation">直方图计算</a> <br>
                      		<a href="http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/imgproc/histograms/histogram_equalization/histogram_equalization.html#histogram-equalization">直方图均衡化</a> <br>
                      		<a href="http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/imgproc/histograms/histogram_comparison/histogram_comparison.html#histogram-comparison">直方图对比</a> <br>
                      		</h4>
              
              
                      </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-body -->
            
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:16%">列数</th>
                  <th style="width:16%">图片宽</th>
                  <th style="width:16%">图片高</th>
                  <th style="width:16%">横向刻度</th>
                  <th style="width:16%">是否显示坐标线</th>
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input id="cols_value" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="255" data-slider-step="5" data-slider-value="255"/>
				  </td>
                  <td>
                  		<input id="image_w" data-slider-id='ex1Slider' type="text" data-slider-min="400" data-slider-max="1300" data-slider-step="1" data-slider-value="800"/>
				  </td>
                  <td>
                  		<input id="image_h" data-slider-id='ex1Slider' type="text" data-slider-min="300" data-slider-max="600" data-slider-step="1" data-slider-value="300"/>
				  </td>
                  <td>
                  		<input id="image_kedu" data-slider-id='ex1Slider' type="text" data-slider-min="10" data-slider-max="50" data-slider-step="10" data-slider-value="10"/>
				  </td>
                  <td>
                  		<input type="checkbox" name="isShow" value="1"/>&nbsp;显示坐标线 &nbsp;
				  </td>
                  <td><a class="btn btn-info"  id="grayHistogram"><i class="fa fa-object-ungroup"></i>展示灰度直方图</a>
			          <a class="btn btn-info" id="reset"><i class="fa fa-refresh"></i>重置</a></td>
                </tr>
              </tbody></table></div>
    			
    			
	
			   
			<div class="row">
			    <div class="col-sm-4">
			      <div class="box box-primary">
			        <div class="box-header with-border">
			          <h3 class="box-title">原图</h3>
			          <span class="label label-primary pull-right"><i class="fa fa-html5"></i></span>
			        </div><!-- /.box-header -->
			        <div class="box-body">
			          <p>未识别前的原文件。</p>
		          		<img style="width:auto; height:auto; max-width:100%; max-height:100%"  id="oldimg" src=""  alt="原图" />
			        </div><!-- /.box-body -->
			      </div><!-- /.box -->
			    </div><!-- /.col -->
			    <div class="col-sm-8">
			      <div class="box box-danger">
			        <div class="box-header with-border">
			          <h3 class="box-title">识别后的图片</h3>
			          <span class="label label-danger pull-right"><i class="fa fa-database"></i></span>
			        </div><!-- /.box-header -->
			        <div class="box-body">
			          <p>点击识别按钮后，将显示识别后的文件。</p>
			          <img  style="width:auto; height:auto; max-width:100%; max-height:100%"   id="newimg" src=""  alt="识别后的图" />

			        </div><!-- /.box-body -->
			      </div><!-- /.box -->
			    </div><!-- /.col -->
			  </div>
						
			
</body>
<script src="${ctxStatic}/plugins/bootstrap-slider/bootstrap-slider.js?t=${version}"></script>
<script src="${ctxStatic}/plugins/iCheck/icheck.js?t=${version}"></script>
</html>
