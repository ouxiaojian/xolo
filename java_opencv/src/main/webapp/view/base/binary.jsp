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
			var baseImageFile = "/statics/sourceimage/lena.png"
			//var baseImageFile = "/statics/sourceimage/ada.png"
			var newImagePath = "/statics/distimage/lena.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//二值化
			$("#binary").click(function(){
				var binaryType = $("input[name='thresh_type']:checked").val();
				var thresh = $("#thresh_value").val();
				var maxval = $("#maxval").val();
				//alert(binaryType+"|"+thresh+"|"+maxval);
				var imagefile = baseImageFile;
			//原方式1，采用的是后台生成图片，前端展现url的方式。但是会存在执行快，图片还未生成导致图片还是旧图片的问题		
			/* 	$.SaveForm({
					url : ctxPath+"/base/binary?_" + $.now(),
					param: {"imagefile":imagefile,"binaryType":binaryType,"thresh":thresh,"maxval":maxval},
					json:true,
					async:false,
					success : function(result) {
						//$("#newimg").attr("src",baseUrl+newImagePath+result+"?t="+ $.now()); 
						var srcurl = baseUrl+newImagePath+"?t="+ $.now();
						console.log(srcurl);
						$("#newimg").attr("src",srcurl); 
						layer.msg('操作成功!', {icon: 1});
					}
				});  */
				//方式2，实时传输图片流的方式
				var srcurl = ctxPath+"/base/binary?_" + $.now()+"&binaryType="+binaryType+"&thresh="+thresh+"&maxval="+maxval+"&imagefile="+baseImageFile;
				$("#newimg").attr("src",srcurl); 
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/lena.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
			//滑动插件加载
			$("#thresh_value").slider({
				tooltip: 'always',
			});
 			$("#thresh_value").on("slide", function(slideEvt) {
				console.log(slideEvt.value);
				//$("#binary").click();
			}).on("change", function (e) {  
			    //当值发生改变的时候触发  
			    //console.info(e);  
			    //获取旧值和新值  
			    console.info(e.value.oldValue + '--' + e.value.newValue);
			    $("#thresh_value").val(e.value.newValue)
			    $("#binary").click();
			});
			//iCheck样式加载
		  	$("input[name='thresh_type']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
		  	
			//type类型更换时自动生成
		  	$("input[name='thresh_type']").on('ifChecked', function(event){
		  		$("#binary").click();
		  	 	 //alert($(event).text());
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
                        1.threshold函数介绍
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                      		<h4>参考资料：<br>
                      		<a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/miscellaneous_transformations.html#threshold">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/miscellaneous_transformations.html#threshold</a> <br>
                      		<a href="http://blog.csdn.net/fengcs2010wd/article/details/8806389">http://blog.csdn.net/fengcs2010wd/article/details/8806389</a> <br>
                      		<br>
                      		public static double threshold(Mat src, Mat dst, double thresh, double maxval, int type); 各参数说明：</h4>
                      		<table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 20%">参数</th>
				                  <th>说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>Mat src</td>
				                  <td>源文件Mat对象，单通道, 8-bit or 32-bit</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>Mat dst</td>
				                  <td>目标文件Mat对象，将和源图片有着相同的大小和类型</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td>double thresh</td>
				                  <td>二值化阈值（影响因子）</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>double maxval</td>
				                  <td>二值化时的最大值</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>int type</td>
				                  <td>二值化类型</td>
				                </tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
                <div class="panel box box-success">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                        2.二值化类型说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="box-body">
							 <table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 10%">二值化类型</th>
				                  <th>公式</th>
				                  <th>效果图</th>
				                  <th>解释说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>THRESH_BINARY</td>
				                  <td><img alt="" src ="${ctxStatic}/images/THRESH_BINARY_1.png"></td>
				                  <td><img alt="" src="${ctxStatic}/images/THRESH_BINARY_2.png"></td>
				                  <td>在运用该阈值类型的时候，先要选定一个特定的阈值量，比如：125，这样，新的阈值产生规则可以解释为大于125的像素点的灰度值设定为最大值(如8位灰度值最大为255)，灰度值小于125的像素点的灰度值设定为0。</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>THRESH_BINARY_INV</td>
				                  <td><img alt="" src ="${ctxStatic}/images/THRESH_BINARY_INV_1.png"></td>
				                  <td><img alt="" src="${ctxStatic}/images/THRESH_BINARY_INV_2.png"></td>
				                  <td>该阈值化与二进制阈值化相似，先选定一个特定的灰度值作为阈值，不过最后的设定值相反。（在8位灰度图中，例如大于阈值的设定为0，而小于该阈值的设定为255）。</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td>THRESH_TRUNC</td>
				                  <td><img alt="" src ="${ctxStatic}/images/THRESH_TRUNC_1.png"></td>
				                  <td><img alt="" src="${ctxStatic}/images/THRESH_TRUNC_2.png"></td>
				                  <td>同样首先需要选定一个阈值，图像中大于该阈值的像素点被设定为该阈值，小于该阈值的保持不变。（例如：阈值选取为125，那小于125的阈值不改变，大于125的灰度值（230）的像素点就设定为该阈值）。</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>THRESH_TOZERO</td>
				                  <td><img alt="" src ="${ctxStatic}/images/THRESH_TOZERO_1.png"></td>
				                  <td><img alt="" src="${ctxStatic}/images/THRESH_TOZERO_2.png"></td>
				                  <td>先选定一个阈值，然后对图像做如下处理：1 像素点的灰度值大于该阈值的不进行任何改变；2 像素点的灰度值小于该阈值的，其灰度值全部变为0。</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>THRESH_TOZERO_INV</td>
				                  <td><img alt="" src ="${ctxStatic}/images/THRESH_TOZERO_INV_1.png"></td>
				                  <td><img alt="" src="${ctxStatic}/images/THRESH_TOZERO_INV_2.png"></td>
				                  <td>原理类似于0阈值，但是在对图像做处理的时候相反，即：像素点的灰度值小于该阈值的不进行任何改变，而大于该阈值的部分，其灰度值全部变为0</td>
				                </tr>
				              </tbody>
				             </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-body -->
            
            <h4>
    			&nbsp;&nbsp;二值化效果测试      </h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:20%">thresh</th>
                  <th style="width:10%">maxval</th>
                  <th style="width:40%">type</th>
                  <th style="width: 200px">操作</th>
                </tr>
                <tr>
                  <td>
                  		<input id="thresh_value" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="255" data-slider-step="1" data-slider-value="150"/>
				  </td>
                  <td><input id="maxval" type = "text" value="255"/></td>
                  <td>
                  		<input type="radio" name="thresh_type" value="0" checked="checked"/>THRESH_BINARY &nbsp;
                  		<input type="radio" name="thresh_type" value="1"/>THRESH_BINARY_INV&nbsp;
                  		<input type="radio" name="thresh_type" value="2"/>THRESH_TRUNC<br>
                  		<input type="radio" name="thresh_type" value="3"/>THRESH_TOZERO&nbsp;
                  		<input type="radio" name="thresh_type" value="4"/>THRESH_TOZERO_INV&nbsp;
                  
                  </td>
                  <td><a class="btn btn-info"  id="binary"><i class="fa fa-object-ungroup"></i>二值化</a>
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
