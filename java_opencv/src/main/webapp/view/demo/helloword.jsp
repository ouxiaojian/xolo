<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
    <script type="text/javascript">
		$(function(){
			var baseImageFile = "/statics/sourceimage/lena.png"
			var newImageFile = "/statics/destimage/lena.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//识别
			$("#detectFace").click(function(){
				var url = baseImageFile;
				$.SaveForm({
					url : ctxPath+"/demo/detectFace?_" + $.now(),
					param: {"url":url},
					json:true,
					success : function(result) {
						$("#newimg").attr("src",baseUrl+newImageFile); 
						layer.msg('操作成功!', {icon: 1});
					}
				}); 
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/lena.png";
				var newImageFile = "/statics/distimage/lena.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
		});
		
		
		
	</script>
</head>
<body>
<h3>
    人脸识别demo
			          <a class="btn btn-info"  id="detectFace"><i class="fa fa-object-ungroup"></i>识别</a>
			          <a class="btn btn-info" id="reset"><i class="fa fa-refresh"></i>重置</a>
  </h3>		
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
</html>
