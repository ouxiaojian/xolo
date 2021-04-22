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
			var baseImageFile = "/statics/sourceimage/pic_transform.png"
			//var baseImageFile = "/statics/sourceimage/ada.png"
			var newImagePath = "/statics/distimage/pic_transform.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//二值化
			$("#handle").click(function(){
				var imagefile = baseImageFile;
				//方式2，实时传输图片流的方式
				var srcurl = ctxPath+"/base/picTransform?_" + $.now()+"&imagefile="+baseImageFile;
				$("#newimg").attr("src",srcurl); 
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/pic_transform.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
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
                        python中经典的四点透视变换方法的java实现。轻松实现图像的透视变换
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                      		<h4>参考资料：<br>
                      		<a href="https://www.pyimagesearch.com/2014/08/25/4-point-opencv-getperspective-transform-example/">
                      		https://www.pyimagesearch.com/2014/08/25/4-point-opencv-getperspective-transform-example/</a> <br>
                      		<a href="https://www.pyimagesearch.com/2016/03/21/ordering-coordinates-clockwise-with-python-and-opencv/">
                      		https://www.pyimagesearch.com/2016/03/21/ordering-coordinates-clockwise-with-python-and-opencv/</a> <br>
                      		<a href="https://www.pyimagesearch.com/2014/09/01/build-kick-ass-mobile-document-scanner-just-5-minutes/">
                      		https://www.pyimagesearch.com/2014/09/01/build-kick-ass-mobile-document-scanner-just-5-minutes/</a> <br>
                      		</h4>
              
                      </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-body -->
            
            <h4>&nbsp;&nbsp;效果测试</h4>	
    			 <div class="box-body">
    			 	<a class="btn btn-info"  id="handle"><i class="fa fa-object-ungroup"></i>处理</a>
	            	<a class="btn btn-info" id="reset"><i class="fa fa-refresh"></i>重置</a>
    			</div>
    			
    			
	
			   
			<div class="row">
			    <div class="col-sm-8">
			      <div class="box box-primary">
			        <div class="box-header with-border">
			          <h3 class="box-title">原图</h3>
			          <span class="label label-primary pull-right"><i class="fa fa-html5"></i></span>
			        </div><!-- /.box-header -->
			        <div class="box-body">
			          <p>原文件。</p>
		          		<img  id="oldimg" src=""  alt="原图" />
			        </div><!-- /.box-body -->
			      </div><!-- /.box -->
			    </div><!-- /.col -->
			    <div class="col-sm-4">
			      <div class="box box-danger">
			        <div class="box-header with-border">
			          <h3 class="box-title">处理后的图片</h3>
			          <span class="label label-danger pull-right"><i class="fa fa-database"></i></span>
			        </div><!-- /.box-header -->
			        <div class="box-body">
			          <p>点击处理按钮后，将显示处理后的文件。</p>
			          <img  id="newimg" src=""  alt="处理后的图" />

			        </div><!-- /.box-body -->
			      </div><!-- /.box -->
			    </div><!-- /.col -->
			  </div>
						
			
</body>
<script src="${ctxStatic}/plugins/bootstrap-slider/bootstrap-slider.js?t=${version}"></script>
<script src="${ctxStatic}/plugins/iCheck/icheck.js?t=${version}"></script>
</html>
