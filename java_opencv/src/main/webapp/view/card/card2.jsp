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
			var baseImageFile = "/statics/sourceimage/card2_1.jpg";
			$("#cardResult_0").attr("src",baseUrl+"/statics/sourceimage/card2_1.jpg?t="+ $.now());
			//答题卡识别
			$("#cardMarking").click(function(){
				var picno = $("input[name='picno']:checked").val();
				if(picno!=null && picno !=""&&picno!=undefined){
					$("#cardResult_"+picno).attr("src",baseUrl+"/statics/sourceimage/card2_"+picno+".jpg?t="+ $.now());
					baseImageFile =  "/statics/sourceimage/card2_"+picno+".jpg";
				}
			 	$.SaveForm({
					url : ctxPath+"/card2/cardMarking?_" + $.now(),
					param: {"imagefile":baseImageFile},
					json:true,
					success : function(result) {
						$("#cardResult").html(result); 
						for(var i=1;i<=5;i++){
                            $("#cardResult_"+i).attr("src",baseUrl+"/statics/destimage/cardResult_"+i+".png?t="+ $.now());
                        }
						layer.msg('操作成功!', {icon: 1});
					}
				}); 
			});
			
 			
            $("input[name='picno']").iCheck({
                checkboxClass: 'icheckbox_flat',
                radioClass: 'iradio_flat'
             });
            
            $("input[name='picno']").on('ifChecked', function(event){
            	 var picno = $("input[name='picno']:checked").val();
            	  //alert(picno);
            	  //alert(event.type + ' callback');
                     if(picno!=null && picno !=""&&picno!=undefined){
                      $("#cardResult_0").attr("src",baseUrl+"/statics/sourceimage/card2_"+picno+".jpg?t="+ $.now());
                  }
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
                    <img src="../../statics/sourceimage/card2_1.jpg" style="width:auto; height:auto; max-width:20%; max-height:20%">图1
                    <img src="../../statics/sourceimage/card2_2.jpg" style="width:auto; height:auto; max-width:20%; max-height:20%">图2
                    <img src="../../statics/sourceimage/card2_3.jpg" style="width:auto; height:auto; max-width:20%; max-height:20%">图3
                    <img src="../../statics/sourceimage/card2_4.jpg" style="width:auto; height:auto; max-width:20%; max-height:20%">图4<br>
                    		网上有朋友咨询答题卡识别方案，趁国庆前帮忙做了个demo，如上图。要求只进行客观题部分的识别，主观题先不用考虑。图片是拍摄的一张常规答题卡，无定位点的圆形填图框答题卡。识别思路如下：<br>
                    		1、图形预处理，找到识别区域，即图中的矩形黑框，结合腐蚀膨胀进阶教程中的形态学梯度算法更好的检测边缘。<br>
                    		2、对找到的矩形框进行校正，得到较为正规的答题卡识别区域，减少误差。<br>
                    		3、对识别区域进行边缘检测，同第1步操作，主要是检测圆形边缘。<br>
                    		4、逻辑识别过程，根据规则前2列5个选项后2列4个选项，同时第4列又分为准考证上半部分和下半部分填涂部分，进行切割。<br>
                    		5、对切图进行轮廓识别，根据轮廓内填图部分来验证是否填图涂。<br>
                    		6、程序判断输出结果。<br>
                    		参考资料：<br>
                    		https://blog.csdn.net/zhaoxfxy/article/details/74999695<br>
                    		https://www.cnblogs.com/josephkim/p/8319069.html<br>
              
                      </div>
                  </div>
                </div>
                
                
              </div>
            </div>
            <!-- /.box-body -->
            
    			 <div class="box-body">
              		
	    			<table class="table table-bordered">
	                <tbody><tr>
	                  <th style="width:100%">选择识别的图片</th>
	                </tr>
	                <tr>
	                  <td>
	                        <input type="radio" name="picno" value="1" checked="checked"/>图片1 &nbsp;
                            <input type="radio" name="picno" value="2"/>图片2&nbsp;
                            <input type="radio" name="picno" value="3"/>图片3&nbsp;
                            <input type="radio" name="picno" value="4"/>图片4&nbsp;
	                  </td>
	                </tr>
	              </tbody></table>
              		
              		
              		
              			<ul class="timeline">
			    <!-- timeline time label -->
			    <li class="time-label">
			        <span class="bg-blue">
			            <button type="button" class="btn btn-block btn-primary" id="cardMarking">点击进行答题卡识别</button>
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
				                  <th style="width: 40%">识别过程</th>
				                  <th style="width: 60%">过程图片</th>
				                </tr>
				                <tr>
				                  <td>原图</td>
				                  <td><img style="width:auto; height:auto; max-width:100%; max-height:100%" id="cardResult_0" alt="此处展现识别过程图，请先执行"  src=""/></td>
				                </tr>
				                <tr>
				                  <td>1.形态学梯度算法（保留边缘效果很棒）+大律法OTSU二值化图片进行图片边缘处理</td>
				                  <td><img style="width:auto; height:auto; max-width:100%; max-height:100%" id="cardResult_1" alt="此处展现识别过程图，请先执行"  src=""/></td>
				                </tr>
				                <tr>
				                  <td>2.利用多边形拟合凸包输出检测出来外矩形边框</td>
				                  <td><img style="width:auto; height:auto; max-width:100%; max-height:100%" id="cardResult_2" alt="此处展现识别过程图，请先执行"  src=""/></td>
				                </tr>
				                <tr>
				                  <td>3.根据矩形边框切图并进行校正，得到校正后的图像</td>
				                  <td><img style="width:auto; height:auto; max-width:100%; max-height:100%" id="cardResult_3" alt="此处展现识别过程图，请先执行"  src=""/></td>
				                </tr>
				                <tr>
				                  <td>4.对校正后的图像进行边缘检测，方法同1，保留圆形填涂框的外边缘方便轮廓识别</td>
				                  <td><img style="width:auto; height:auto; max-width:100%; max-height:100%" id="cardResult_4" alt="此处展现识别过程图，请先执行"  src=""/></td>
				                </tr>
				                <tr>
				                  <td>5.图片按规则切片，轮廓识别，掩模按顺序取出各选项轮廓，根据面积计算填涂百分比判定是否填涂。此步骤输出了学号的第一个掩模处理后提取的图片样张</td>
				                  <td><img style="width:auto; height:auto; max-width:100%; max-height:100%" id="cardResult_5" alt="此处展现识别过程图，请先执行"  src=""/></td>
				                </tr>
				                <tr>
				                  <td>6.图片按规则切片，轮廓识别，根据面积计算填涂百分比判定是否填涂。得出结果</td>
				                  <td><span id = "cardResult"></span></td>
				                </tr>
				                </tbody>
				              </table>
			            
				                

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
