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
			var baseImageFile = "/statics/sourceimage/t4.bmp";
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			
			//二值化
			$("#pageOCR").click(function(){
				var ocrType = $("input[name='ocrType']:checked").val();
				if(ocrType==1){
					baseImageFile =  "/statics/sourceimage/t4.bmp";
					$("#oldimg").attr("src",baseUrl+baseImageFile);
				}else if(ocrType==2){
					baseImageFile =  "/statics/sourceimage/page.png";
					$("#oldimg").attr("src",baseUrl+baseImageFile);
				}else{
					baseImageFile =  "/statics/sourceimage/page2.png";
					$("#oldimg").attr("src",baseUrl+baseImageFile);
				}
			 	$.SaveForm({
					url : ctxPath+"/page/pageOCR?_" + $.now(),
					param: {"imagefile":baseImageFile,"ocrType":ocrType},
					json:true,
					success : function(result) {
						$("#ocrResult").html(result); 
						layer.msg('操作成功!', {icon: 1});
					}
				}); 
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/page.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				layer.msg('重置成功!', {icon: 1});
			});
			
			//iCheck样式加载
		  	$("input[name='ocrType']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
		  	
			//type类型更换时自动生成
		  	$("input[name='ocrType']").on('ifChecked', function(event){
		  		//alert($(event).text());
/* 		  		var ocrType = $("input[name='ocrType']:checked").val();
 		  		if(ocrType==1){
					baseImageFile =  "/statics/sourceimage/t4.bmp";
				}else if(ocrType==2){
					baseImageFile =  "/statics/sourceimage/page.png";
					$("#oldimg").attr("src",baseUrl+baseImageFile);
				} */
		  		$("#pageOCR").click();
		  	});
		});
		
		
	</script>
</head>
<body>

    			<div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:80%">类型</th>
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input type="radio" name="ocrType" value="1" checked="checked"/>方案1：使用Tesseract-OCR &nbsp;
                  		<input type="radio" name="ocrType" value="2"/>方案2：使用轮廓识别&nbsp;
                  		<input type="radio" name="ocrType" value="3"/>方案3：使用模板匹配&nbsp;
                  
                  </td>
                  <td><a class="btn btn-info"  id="pageOCR"><i class="fa fa-object-ungroup"></i>页码识别</a>
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
			          <h3 class="box-title">识别后的结果</h3>
			          <span class="label label-danger pull-right"><i class="fa fa-database"></i></span>
			        </div><!-- /.box-header -->
			        <div class="box-body">
			          <p>点击识别按钮后，将显示识别后的文件。</p>
						<div id="ocrResult"></div>
			        </div><!-- /.box-body -->
			      </div><!-- /.box -->
			    </div><!-- /.col -->
			  </div>
						
			
</body>
<script src="${ctxStatic}/plugins/bootstrap-slider/bootstrap-slider.js?t=${version}"></script>
<script src="${ctxStatic}/plugins/iCheck/icheck.js?t=${version}"></script>
</html>
