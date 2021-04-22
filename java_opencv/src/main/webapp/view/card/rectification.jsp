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
			//var baseImageFile = "/statics/sourceimage/xx1.jpg"
			var baseImageFile = "/statics/sourceimage/x2.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//缩放
			$("#rectification").click(function(){
				var markType = $("input[name='markType']:checked").val();
				var imagefile = baseImageFile;
				var srcurl = ctxPath+"/rect/rectification?_" + $.now()+"&markType="+markType+"&imagefile="+imagefile;
				$("#newimg").attr("src",srcurl);
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/x1.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
 			
		  	$("input[name='markType']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
			//type类型更换时自动生成
		  	$("input[name='markType']").on("ifChanged", function(event){
		  		$("#rectification").click();
		  	});
			
		  	$("input[name='imgChange']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
			//type类型更换时自动生成
		  	$("input[name='imgChange']").on("ifChanged", function(event){
		  		var isChecked = $("input[name='imgChange']").is(":checked");
		  		if(isChecked){
			  		baseImageFile = "/statics/sourceimage/xx1.jpg";
			  		$("#oldimg").attr("src",baseUrl+baseImageFile);
		  		}else{
			  		baseImageFile = "/statics/sourceimage/x2.png";
			  		$("#oldimg").attr("src",baseUrl+baseImageFile);
		  		}
		  		$("#rectification").click();
		  	});
			
		});
		
		
		
	</script>
</head>
<body>

            
            <h4>&nbsp;&nbsp;图像透视变换</h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:30%">模板匹配类型</th>
                  <th style="width:20%">再狠一点</th>
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td> 
                   		<input type="radio" name="markType" value="1" checked="checked"/>&nbsp;使用模板匹配查找定位点 &nbsp;<br>
                   		<input type="radio" name="markType" value="2"/>&nbsp;使用霍夫圆变换查找定位点&nbsp;<br>
                  
                   </td> 
                  <td> 
                   		<input type="checkbox" name="imgChange" value="1" />&nbsp;使用透视图片 &nbsp;<br>
                  
                   </td> 
                  <td><a class="btn btn-info"  id="rectification"><i class="fa fa-object-ungroup"></i>图像透视变换</a>
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
		          		<img style="width:auto; height:auto; max-width:100%; max-height:100%"  id="oldimg" src=""  alt="原图" />
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
			          <img style="width:auto; height:auto; max-width:100%; max-height:100%" id="newimg" src=""  alt="此处将展现识别后的图" />

			        </div><!-- /.box-body -->
			      </div><!-- /.box -->
			    </div><!-- /.col -->
			  </div>
						
			
</body>
<script src="${ctxStatic}/plugins/bootstrap-slider/bootstrap-slider.js?t=${version}"></script>
<script src="${ctxStatic}/plugins/iCheck/icheck.js?t=${version}"></script>
</html>
