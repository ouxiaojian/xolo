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
			//var baseImageFile = "/statics/sourceimage/color2.png"
			var baseImageFile = "/statics/sourceimage/color.png"
			var baseImageFile = "/statics/sourceimage/color1.png"
			var newImagePath = "/statics/distimage/lena.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//缩放
			$("#findcolor").click(function(){
				//alert($(this).attr("data-code"));
				//var color = $(this).attr("data-code");
				var colorType = $("input[name='colorType']:checked").val();
				var color = $("input[name='color']:checked").val();
				console.log("color:"+color);
				var imagefile = baseImageFile;
				var srcurl = ctxPath+"/base/findcolor?_" + $.now()+"&color="+color+"&colorType="+colorType+"&imagefile="+baseImageFile;
				$("#newimg").attr("src",srcurl);
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/color2.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
 			
			//iCheck样式加载
		  	$("input[name='colorType']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
		  	
			//type类型更换时自动生成
		  	$("input[name='colorType']").on('ifChecked', function(event){
		  		$("#findcolor").click();
		  	 	 //alert($(event).text());
		  	});
			
			//iCheck样式加载
		  	$("input[name='color']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
		  	
			//type类型更换时自动生成
		  	$("input[name='color']").on('ifChecked', function(event){
		  		$("#findcolor").click();
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
                        颜色检测说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                    备注知识：所谓RGB就是：红（Red）、绿（Green）、蓝（Blue）三种色光原色。RGB色彩模型的混色属于加法混色。每种原色的数值越高，色彩越明亮。 R、G、B都为0时是黑色，都为255时是白色。RGB是电脑设计中最直接的色彩表示方法。电脑中的24位真彩图像，就是采用RGB模型来精确记录色彩。所以，在电脑中利用RGB数值可以精确取得某种颜色。
RGB虽然表示直接，但是R、G、B数值和色彩的三属性没有直接的联系，不能揭示色彩之间的关系。所以在进行配色设计时，RGB模型就不是那么合适了。在所有美术软件中，都可以直接设置RGB的数值。有些软件还提供了直观的"RGB三维色彩模型"来设置RGB色彩值。<br>
HSV是指Hue(色相)、Saturation(饱和度)和Value(值)。RGB和CMY颜色模型都是面向硬件的，而HSV颜色模型是面向用户的。 HSV模型对应于圆柱坐标系的一个圆锤形子集。圆锤的顶面对应于V=1，代表的颜色较亮。色调H由绕V轴的旋转角给定，红色对应于角度0°，绿色对应于角度120°，蓝色对应于角度240°。每一种颜色和它的补色相差180°
HSV本质上与RGB模式没有区别,只是产生颜色的方式不同。

                      		 public static void inRange(Mat src, Scalar lowerb, Scalar upperb, Mat dst); 各参数说明：</h4>
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
				                  <td>Scalar lowerb</td>
				                  <td>颜色下限值</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td> Scalar upperb</td>
				                  <td>颜色上限值</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>Mat dst</td>
				                  <td>输出大小与输入图像相同，且type类型为CV_8U</td>
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
                  <th style="width:20%">RGB方式|HSV方式</th>
                  <th style="width:40%">颜色</th>
                  <th style="">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input type="radio" name="colorType" value="1" checked="checked"/>&nbsp;RGB &nbsp;
                  		<input type="radio" name="colorType" value="2"/>&nbsp;HSV&nbsp;
                  </td>
                  <td>
                  		<input type="radio" name="color" value="1" checked="checked"/>&nbsp;红色 &nbsp;
                  		<input type="radio" name="color" value="2"/>&nbsp;蓝色&nbsp;
                  		<input type="radio" name="color" value="3"/>&nbsp;绿色&nbsp;
                  		<input type="radio" name="color" value="4"/>&nbsp;黄色&nbsp;
                  </td>
                  <td>
                  	   <a class="btn btn-info" id="findcolor"><i class="fa fa-object-ungroup"></i>查找颜色</a>
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
