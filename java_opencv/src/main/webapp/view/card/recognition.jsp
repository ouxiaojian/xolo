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
			var baseImageFile = "/statics/sourceimage/card0.png";
			var step1 = "/statics/destimage/card1.png";
			var step2 = "/statics/destimage/card2.png";
			var step3 = "/statics/destimage/card3.png";
			var step4 = "/statics/destimage/card4.png";
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			$("#step1img").attr("src",baseUrl+step1);
			$("#step2img").attr("src",baseUrl+step2);
			$("#step3img").attr("src",baseUrl+step3);
			
			//高斯
			$("#step1").click(function(){
				var ksize = $("#step1ksize").val();
				//alert(binaryType+"|"+thresh+"|"+maxval);
				var imagefile = baseImageFile;
			 	$.SaveForm({
					url : ctxPath+"/card/step1?_" + $.now(),
					param: {"imagefile":imagefile,"ksize":ksize},
					json:true,
					success : function(result) {
						var srcurl = baseUrl+result+"?t="+ $.now();
						console.log(srcurl);
						$("#step1img").attr("src",srcurl); 
						layer.msg('操作成功!', {icon: 1});
					}
				}); 
			});
			//二值化
			$("#step2").click(function(){
				var thresh = $("#thresh").val();
			 	$.SaveForm({
					url : ctxPath+"/card/step2?_" + $.now(),
					param: {"imagefile":step1,"thresh":thresh},
					json:true,
					success : function(result) {
						var srcurl = baseUrl+result+"?t="+ $.now();
						console.log(srcurl);
						$("#step2img").attr("src",srcurl); 
						layer.msg('操作成功!', {icon: 1});
					}
				}); 
			});
			
			//开运算
			$("#step3").click(function(){
				var ksize = $("#step3ksize").val();
			 	$.SaveForm({
					url : ctxPath+"/card/step3?_" + $.now(),
					param: {"imagefile":step2,"ksize":ksize},
					json:true,
					success : function(result) {
						var srcurl = baseUrl+result+"?t="+ $.now();
						console.log(srcurl);
						$("#step3img").attr("src",srcurl); 
						layer.msg('操作成功!', {icon: 1});
					}
				}); 
			});
			
			//轮廓识别
			$("#step4").click(function(){
			 	$.SaveForm({
					url : ctxPath+"/card/step4?_" + $.now(),
					param: {"imagefile":step3},
					json:true,
					success : function(result) {
						$("#step5").html(result); 
						for(var i=1;i<=25;i++){
							$("#ch"+i).attr("src",baseUrl+"/statics/destimage/ch"+i+".png?t="+ $.now());
						}
						layer.msg('操作成功!', {icon: 1});
					}
				}); 
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/lena.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
			//滑动插件加载
			$("#step1ksize,#thresh,#step3ksize").slider({
				tooltip: 'always',
			});
 			$("#step1ksize").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#step1ksize").val(e.value.newValue)
			});
 			
 			$("#thresh").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#thresh").val(e.value.newValue)
			});
 			
 			$("#step3ksize").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#step3ksize").val(e.value.newValue)
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
                        答题卡填涂识别说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                    		本demo先进行填图区域的识别，之前肯定先需要坐标点定位，目前先写死。实际中应该提前利用定位点确定坐标位置。思路如下：<br>
							1、先进行图片预处理，由于是扫描的图片，像素渣，噪点很明显，所以先除噪。<br>
							2、为了提高识别效果，进行二值化处理增加对比。（注意要进行反向二值化所以对应第三步为开运算）<br>
							3、由于填图选项的干扰会影响识别，因此需要对其进行形态学变换，这里利用填图区域先腐蚀再膨胀，即开运算。达到去干扰效果<br>
							4、使用轮廓识别方式进行选项识别
              
                      </div>
                  </div>
                </div>
                
                
              </div>
            </div>
            <!-- /.box-body -->
            
    			 <div class="box-body">
              
              			<ul class="timeline">
			    <!-- timeline time label -->
			    <li class="time-label">
			        <span class="bg-blue">
			            识别步骤1-4
			        </span>
			    </li>
			    <!-- /.timeline-label -->
			
			    <!-- timeline item -->
			    <li>
			        <!-- timeline icon -->
			        <i class="fa fa-file-image-o bg-blue"></i>
			        <div class="timeline-item">
			            <span class="time"><i class="fa fa-file-image-o"></i>&nbsp;原图</span>
			
			            <h3 class="timeline-header">原图</h3>
			            <div class="timeline-body">
			                <img id="oldimg" alt="此处展现原图" src="" style="width:auto; height:auto; max-width:100%; max-height:100%"/>
			            </div>
					<div class="timeline-footer">
							<table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 20%"><a class="btn btn-primary btn-xs" id = "step1">点击-模糊处理</a></th>
				                  <th style="width: 30%"><br><input id="step1ksize" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="10" data-slider-step="1" data-slider-value="1"/></th>
				                  <th>滑动滑块设置模糊系数，2*ksize+1</th>
				                </tr>
				                </tbody>
				              </table>
						
					</div>
				</div>
			    </li>
			    <li>
			        <!-- timeline icon -->
			        <i class="fa fa-object-group bg-aqua"></i>
			        <div class="timeline-item">
			            <span class="time"><i class="fa fa-object-group"></i>&nbsp;高斯模糊</span>
			
			            <h3 class="timeline-header">1、模糊处理去噪点</h3>
			            <div class="timeline-body">
			                <img id="step1img" alt="此处高斯平滑后的图" src="" style="width:auto; height:auto; max-width:100%; max-height:100%"/>
			            </div>
			            <div class="timeline-footer">
			                  <table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 20%"><a class="btn btn-primary btn-xs" id="step2">点击-二值化处理</a></th>
				                  <th style="width: 30%"><br><input id="thresh" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="255" data-slider-step="1" data-slider-value="170"/></th>
				                  <th>二值化阈值，此处是反向二值化</th>
				                </tr>
				                </tbody>
				              </table>
			            </div>
			        </div>
			    </li>
			    <li>
			        <!-- timeline icon -->
			        <i class="fa fa-shield bg-yellow"></i>
			        <div class="timeline-item">
			            <span class="time"><i class="fa fa-shield"></i>&nbsp;二值化</span>
			
			            <h3 class="timeline-header">2、二值化去提高识别</h3>
			            <div class="timeline-body">
			                <img id="step2img" alt="此处展现二值化后的图" src="" style="width:auto; height:auto; max-width:100%; max-height:100%"/>
			            </div>
			            <div class="timeline-footer">
			                <table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 20%"><a class="btn btn-primary btn-xs" id = "step3">点击-开运算</a></th>
				                  <th style="width: 30%"><br><input id="step3ksize" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="10" data-slider-step="1" data-slider-value="1"/></th>
				                  <th>二值化阈值，此处是反向二值化</th>
				                </tr>
				                </tbody>
				              </table>
			            </div>
			        </div>
			    </li>
			    <li>
			        <!-- timeline icon -->
			        <i class="fa fa-picture-o bg-purple"></i>
			        <div class="timeline-item">
			            <span class="time"><i class="fa fa-picture-o"></i>&nbsp;形态学开运算</span>
			
			            <h3 class="timeline-header">3、形态学开运算去干扰</h3>
			            <div class="timeline-body">
			                <img id="step3img" alt="此处展现开运算之后的图" src="" style="width:auto; height:auto; max-width:100%; max-height:100%"/>
			            </div>
			            <div class="timeline-footer">
			                <a class="btn btn-primary btn-xs"  id = "step4">点击-轮廓识别</a>
			            </div>
			        </div>
			    </li>
			    <li>
			        <!-- timeline icon -->
			        <i class="fa fa-life-bouy bg-maroon"></i>
			        <div class="timeline-item">
			            <span class="time"><i class="fa fa-life-bouy"></i>&nbsp;轮廓识别</span>
			
			            <h3 class="timeline-header">4、轮廓识别得结果</h3>
			            <div class="timeline-body">
			            
			            	 <table class="table table-bordered">
				                <tbody>
				                <tr>
				                  <th style="width: 10%">序号</th>
				                  <th style="width: 30%">轮廓</th>
				                </tr>
				                <c:forEach var="chi" begin="1" end="25">
					                <tr>
					                  <td>${chi}</td>
					                  <td><img style="width:auto; height:auto; max-width:100%; max-height:100%" id="ch${chi}" alt="此处展现轮廓识别后的图"  src="<c:out value="${ctxStatic}/destimage/ch${chi}.png"/>"/></td>
					                </tr>
					              </c:forEach>
				                </tbody>
				              </table>
			            
			            	
				                
				                
				                

			            </div>
			            <div class="timeline-footer">
			                <a class="" id = "step5">最终结果：</a>
			            </div>
			        </div>
			    </li>
			    <!-- END timeline item -->
			
			</ul>
              
              
              </div>
    			
    			
	
			   

						
			
</body>
<script src="${ctxStatic}/plugins/bootstrap-slider/bootstrap-slider.js?t=${version}"></script>
<script src="${ctxStatic}/plugins/iCheck/icheck.js?t=${version}"></script>
</html>
