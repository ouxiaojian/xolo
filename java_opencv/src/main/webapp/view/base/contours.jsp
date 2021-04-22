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
			//var baseImageFile = "/statics/sourceimage/contours.png"
			//var baseImageFile = "/statics/sourceimage/contours1.png"
			var baseImageFile = "/statics/sourceimage/contours2.png"
			var newImagePath = "/statics/distimage/lena.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//缩放
			$("#contours").click(function(){
				var contourNum = $("#contourNum").val();
				var mode = $("input[name='mode']:checked").val();
				var method = $("input[name='method']:checked").val();
				console.log("mode:"+mode+"method:"+method);
				var imagefile = baseImageFile;
				var srcurl = ctxPath+"/base/contours?_" + $.now()+"&mode="+mode+"&method="+method+"&contourNum="+contourNum+"&imagefile="+baseImageFile;
				$("#newimg").attr("src",srcurl);
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/contours.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
 			
			//iCheck样式加载
		  	$("input[name='mode']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
		  	
			//type类型更换时自动生成
		  	$("input[name='mode']").on('ifChecked', function(event){
		  		$("#contours").click();
		  	 	 //alert($(event).text());
		  	});
			
			//iCheck样式加载
		  	$("input[name='method']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
		  	
			//type类型更换时自动生成
		  	$("input[name='method']").on('ifChecked', function(event){
		  		$("#contours").click();
		  	 	 //alert($(event).text());
		  	});
 			
			$("#contourNum").slider({
				tooltip: 'always',
			});
			
 			$("#contourNum").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
				$("#contourNum").val(e.value.newValue);
			    $("#contours").click();
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
                        轮廓识别方法说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                    <h4>参考资料<br>
                    <a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/structural_analysis_and_shape_descriptors.html#findcontours">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/structural_analysis_and_shape_descriptors.html#findcontours</a><br>
                    <a href="http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/imgproc/shapedescriptors/find_contours/find_contours.html#find-contours">http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/imgproc/shapedescriptors/find_contours/find_contours.html#find-contours</a><br>
                      		public static void findContours(Mat image, List (MatOfPoint) contours, Mat hierarchy, int mode, int method, Point offset); 各参数说明：</h4>
                      		<table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 20%">参数</th>
				                  <th>说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>Mat src</td>
				                  <td>源文件Mat对象8bit 单通道二值化图像,注意：查找轮廓方法因为有内置的边缘检测，所以是会更改原图的，因此使用的时候，可以clone一个使用</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>List (MatOfPoint) contours</td>
				                  <td>找到的轮廓数据集</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td> Mat hierarchy</td>
				                  <td>输出向量，包含图像的拓扑信息</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>int mode</td>
				                  <td>轮廓获取模式，有RETR_EXTERNAL=0:只检索最外面的轮廓;
		 RETR_LIST=1:检索所有的轮廓，并将其放入list中;
		 RETR_CCOMP=2:检索所有的轮廓，并将他们组织为两层:顶层是各部分的外部边界，第二层是空洞的边界;
		 RETR_TREE=3:检索所有的轮廓，并重构嵌套轮廓的整个层次。</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>int method</td>
				                  <td>取得轮廓的方法，边缘近似方法(除了RETR_RUNS使用内置的近似，其他模式均使用此设定的近似算法)。可取值如下:
			 CV_CHAIN_CODE:以Freeman链码的方式输出轮廓，其他方法输出多边形(顶点的序列)。
			 CHAIN_APPROX_NONE=1:将所有的连码点，转换成点。
			 CHAIN_APPROX_SIMPLE=2:压缩水平的、垂直的和斜的部分，也就是，函数只保留他们的终点部分。
			 CHAIN_APPROX_TC89_L1=3，CV_CHAIN_APPROX_TC89_KCOS=4:使用the flavors of Teh-Chin chain近似算法的一种。
			 CV_LINK_RUNS=5:通过连接水平段的1，使用完全不同的边缘提取算法。使用RETR_LIST检索模式能使用此方法。</td>
				                </tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
            </div>
            <!-- /.box-body -->
            
            <h4>&nbsp;&nbsp;轮廓识别测试</h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:20%">轮廓获取模式</th>
                  <th style="width:30%">轮廓识别方法</th>
                  <th style="width:30%">轮廓序号</th>
                  <th style="">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input type="radio" name="mode" value="0" checked="checked"/>&nbsp;RETR_EXTERNAL=0 &nbsp;<br>
                  		<input type="radio" name="mode" value="1"/>&nbsp;RETR_LIST=1&nbsp;<br>
                  		<input type="radio" name="mode" value="2"/>&nbsp;RETR_CCOMP=2&nbsp;<br>
                  		<input type="radio" name="mode" value="3"/>&nbsp;RETR_TREE=3&nbsp;<br>
                  </td>
                  <td>
<!--                   		<input type="radio" name="method" value="0" checked="checked"/>&nbsp;CV_CHAIN_CODE=0 &nbsp;<br> -->
                  		<input type="radio" name="method" value="1" checked="checked"/>&nbsp;CHAIN_APPROX_NONE=1 &nbsp;<br>
                  		<input type="radio" name="method" value="2"/>&nbsp;CHAIN_APPROX_SIMPLE=2&nbsp;<br>
                  		<input type="radio" name="method" value="3"/>&nbsp;CHAIN_APPROX_TC89_L1=3&nbsp;<br>
                  		<input type="radio" name="method" value="4"/>&nbsp;CV_CHAIN_APPROX_TC89_KCOS=4&nbsp;<br>
                  		<input type="radio" name="method" value="5"/>&nbsp;CV_LINK_RUNS=5&nbsp;
                  </td>
                  <td>
                  		<br><br>
                  		<input id="contourNum" data-slider-id='ex1Slider' type="text" data-slider-min="-1" data-slider-max="100" data-slider-step="1" data-slider-value="-1"/>
				  </td>
                  <td>
                  	   <a class="btn btn-info" id="contours"><i class="fa fa-object-ungroup"></i>查找轮廓</a>
			          <a class="btn btn-info" id="reset"><i class="fa fa-refresh"></i>重置</a>
			       </td>
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
