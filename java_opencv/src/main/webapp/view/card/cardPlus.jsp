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
			var baseImageFile = "/statics/sourceimage/dtk0.png";
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			for(var i=0;i<=15;i++){
				$("#dtk"+i).attr("src",baseUrl+"/statics/destimage/dtk"+i+".png?t="+ $.now());
			}
			//答题卡识别
			$("#cardPlus").click(function(){
				var binary_thresh = $("#binary_thresh").val();
				var blue_red_thresh = $("#blue_red_thresh").val();
			 	$.SaveForm({
					url : ctxPath+"/cardPlus/answerSheet?_" + $.now(),
					param: {"imagefile":baseImageFile,"binary_thresh":binary_thresh,"blue_red_thresh":blue_red_thresh},
					json:true,
					success : function(result) {
						$("#dtkResult").html(result); 
						for(var i=0;i<=15;i++){
							$("#dtk"+i).attr("src",baseUrl+"/statics/destimage/dtk"+i+".png?t="+ $.now());
						}
						layer.msg('操作成功!', {icon: 1});
					}
				}); 
			});
			
			//滑动插件加载
			$("#binary_thresh").slider({
				tooltip: 'always',
			});
 			$("#binary_thresh").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#binary_thresh").val(e.value.newValue)
			});
 			
			//滑动插件加载
			$("#blue_red_thresh").slider({
				tooltip: 'always',
			});
 			$("#blue_red_thresh").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#blue_red_thresh").val(e.value.newValue)
			});
 			
 			
 			
		});
		

		
	</script>
	<style>
		#ex1Slider .slider-selection {
			background: #BABABA;
		}
	</style>
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
                    		图片是拍摄的一张常规答题卡，在此基础上进行了改进，增加了底部和侧边的标记块，用于定位答题卡各选项的坐标。识别思路如下：<br>
                    		1、图形预处理：腐蚀膨胀、二值化、高斯模糊等<br>
                    		2、侧边和底部裁剪并进行投影转换，获取到投影图，根据投影图获取跳变坐标<br>
                    		3、根据坐标点圈定选项的识别区域，获取识别区域中填图点占比（增加了红颜色剔除待优化）<br>
                    		4、根据占比情况输出各选项填涂情况
              
                      </div>
                  </div>
                </div>
                
                
              </div>
            </div>
            <!-- /.box-body -->
            
    			 <div class="box-body">
              		
	    			<table class="table table-bordered">
	                <tbody><tr>
	                  <th style="width:40%">二值化阈值</th>
	                  <th style="width:40%">识别阈值</th>
	                </tr>
	                <tr>
	                  <td>
	                  		<input id="binary_thresh" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="255" data-slider-step="1" data-slider-value="200"/>
					  </td>
	                  <td>
	                  		<input id="blue_red_thresh" type="text" class="span2" value="" data-slider-min="10" data-slider-max="100" data-slider-step="1" data-slider-value="[15,45]"/>
	                  </td>
	                </tr>
	              </tbody></table>
              		
              		
              		
              			<ul class="timeline">
			    <!-- timeline time label -->
			    <li class="time-label">
			        <span class="bg-blue">
			            <button type="button" class="btn btn-block btn-primary" id="cardPlus">点击进行答题卡识别</button>
			        </span>
			    </li>
			    <!-- /.timeline-label -->
			
			    <!-- timeline item -->
			    <li>
			        <!-- timeline icon -->
			        <i class="fa fa-life-bouy bg-maroon"></i>
			        <div class="timeline-item">
			            <span class="time"><i class="fa fa-life-bouy"></i>&nbsp;识别过程</span>
			
			            <h3 class="timeline-header">识别过程</h3>
			            <div class="timeline-body">
			            
			            	 <table class="table table-bordered">
				                <tbody>
				                <tr>
				                  <th style="width: 10%">序号</th>
				                  <th style="width: 30%">过程图片</th>
				                </tr>
				                <c:forEach var="no" begin="0" end="15">
					                <tr>
					                  <td>${no}</td>
					                  <td><img style="width:auto; height:auto; max-width:100%; max-height:100%" id="dtk${no}" alt="此处展现识别过程图，请先执行"  src=""/></td>
					                </tr>
					              </c:forEach>
				                </tbody>
				              </table>
			            
				                

			            </div>
			            <div class="timeline-footer">最终结果：<br>
			                <a class="" id = "dtkResult"></a>
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
