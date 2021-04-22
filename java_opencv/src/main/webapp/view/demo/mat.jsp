<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
    <script type="text/javascript">
		$(function(){
			var baseImageFile = "/statics/sourceimage/lena.png"
			var newImageFile = "/statics/distimage/lena.png"
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


<div class="col-xs-12">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Mat对象相关介绍</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="box-group" id="accordion">
                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                <div class="panel box box-primary">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                        1.官网的介绍
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="box-body">
                    	<a href="http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/core/mat%20-%20the%20basic%20image%20container/mat%20-%20the%20basic%20image%20container.html">点击查看详情</a>
                    </div>
                  </div>
                </div>
                <div class="panel box box-danger">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                        2.Mat详细说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseTwo" class="panel-collapse collapse in">
                    <div class="box-body">
                      1222
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        
        						
			
</body>
</html>
