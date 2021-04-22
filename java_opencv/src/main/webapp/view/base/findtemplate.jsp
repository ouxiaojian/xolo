<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
	<link rel="stylesheet" href="${ctxStatic}/plugins/bootstrap-slider/slider.css">
	<link rel="stylesheet" href="${ctxStatic}/plugins/iCheck/all.css?t=${version}">
	<link rel="stylesheet" href="${ctxStatic}/plugins/iCheck/minimal/blue.css?t=${version}">
	<link rel="stylesheet" href="${ctxStatic}/plugins/jcrop/Jcrop-0.9.12/css/jquery.Jcrop.min.css?t=${version}">
    <script type="text/javascript">
		$(function(){
			var baseImageFile = "/statics/sourceimage/lena.png"
			var newImagePath = "/statics/distimage/lena.png"
			var matchImagePath = "/statics/sourceimage/template.png"
			$("#oldimg").attr("src",baseUrl+baseImageFile);
			$("#match").attr("src",baseUrl+baseImageFile);
			//$("#newimg").attr("src",baseUrl+baseImageFile); 
			
			//缩放
			$("#findtemplate").click(function(){
				var method = $("input[name='method']:checked").val();
				var imageType = $("input[name='imageType']:checked").val();
				var imagefile = baseImageFile;
	 	        var x1= $("#x1").val();
	 	        var y1 = $("#y1").val();
		        var x2 = $("#x2").val();
		        var y2= $("#y2").val();
		        var width = $("#width").val();
		        var height = $("#height").val(); 
				var srcurl = ctxPath+"/base/findtemplate?_" + $.now()+"&method="+method+"&imageType="+imageType+"&imagefile="+baseImageFile
						+"&x1="+x1+"&y1="+y1+"&x2="+x2+"&y2="+y2+"&width="+width+"&height="+height;
				$("#newimg").attr("src",srcurl);
			});
			
			//重置
			$("#reset").click(function(){
				var baseImageFile = "/statics/sourceimage/lena.png";
				$("#oldimg").attr("src",baseUrl+baseImageFile);
				$("#newimg").attr("src",'');
				layer.msg('重置成功!', {icon: 1});
			});
			
 			
			//iCheck样式加载
		  	$("input[name='imageType']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
		  	
			//type类型更换时自动生成
		  	$("input[name='imageType']").on('ifChecked', function(event){
		  		$("#findtemplate").click();
		  	 	 //alert($(event).text());
		  	});
			
			//iCheck样式加载
		  	$("input[name='method']").iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			 });
		  	
			//type类型更换时自动生成
		  	$("input[name='method']").on('ifChecked', function(event){
		  		$("#findtemplate").click();
		  	 	 //alert($(event).text());
		  	});
 			
		  	//begin jcrop
		    var jcrop_api,
	        boundx,
	        boundy,

	        // Grab some information about the preview pane
	        $preview = $("#preview-pane"),
	        $pcnt = $("#preview-pane .preview-container"),
	        $pimg = $("#preview-pane .preview-container img"),

	        xsize = $pcnt.width(),
	        ysize = $pcnt.height();
	    
		    console.log("init",[xsize,ysize]);
		    $("#oldimg").Jcrop({
		      maxSize:[100,100],
		      onChange: updatePreview,
		      onSelect: updatePreview,
		      aspectRatio: xsize / ysize
		    },function(){
		      // Use the API to get the real image size
		      var bounds = this.getBounds();
		      boundx = bounds[0];
		      boundy = bounds[1];
		      // Store the API in the jcrop_api variable
		      jcrop_api = this;
	
		      // Move the preview into the jcrop container for css positioning
		      $preview.appendTo(jcrop_api.ui.holder);
		    });
	
		    function updatePreview(c){
		    	console.log(c.x+"_"+c.y+"_"+c.x2+"_"+c.y2+"_"+c.w+"_"+c.h);
			      if (parseInt(c.w) > 0){
		 	        $('#x1').val(c.x);
			        $('#y1').val(c.y);
			        $('#x2').val(c.x2);
			        $('#y2').val(c.y2);
			        $('#width').val(c.w);
			        $('#height').val(c.h); 
			      /*   var rx = xsize / c.w;
			        var ry = ysize / c.h; */
			        //此处不是放大镜效果，只是想截取1：1的比例图片
			          var rx = 1;
			        var ry = 1;
			        console.log(Math.round(rx * c.w)+"_"+Math.round(ry * c.h)+"_"+Math.round(rx * c.x)+"_"+Math.round(ry * c.y));
			        $preview.css({//控制截图样式，让其紧贴原图
			        	right :-20 -c.w+"px"
			        });
			        $pcnt.css({//控制图片宽高，让其在小于截图区域时缩小
			        	 width:c.w+"px",
			       		 height:c.h+"px",
			        })
			        $pimg.css({
			          width: Math.round(rx * boundx) + "px",
			          height: Math.round(ry * boundy) + "px",
			          marginLeft: "-" + Math.round(rx * c.x) + "px",
			          marginTop: "-" + Math.round(ry * c.y) + "px"
			        });
			      }
		    };
	    	//end jcrop
		});
		
		
		
	</script>
	<style type="text/css">

/* Apply these styles only when #preview-pane has
   been placed within the Jcrop widget */
.jcrop-holder #preview-pane {
  display: block;
  position: absolute;
  z-index: 2000;
  top: 0px;
  right: -120px;
  padding: 6px;
  border: 1px rgba(0,0,0,.4) solid;
  background-color: white;

  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;

  -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
}

/* The Javascript code will set the aspect ratio of the crop
   area based on the size of the thumbnail preview,
   specified here */
#preview-pane .preview-container {
/*   width: 250px;
  height: 170px; */
  width: 100px;
  height: 100px; 
  overflow: hidden;
}

</style>
</head>
<body>

              <div class="box-group" id="accordion">
                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                <div class="panel box box-primary">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                        模板匹配方法说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in"><!--class="panel-collapse collapse in"中的 in 控制展开 -->
                    <div class="box-body">
                    <h4>
                    参考资料:<br>
                    <a href="http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/imgproc/histograms/template_matching/template_matching.html#template-matching">http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/imgproc/histograms/template_matching/template_matching.html#template-matching</a><br>
                    <a href="https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/object_detection.html#matchtemplate">https://docs.opencv.org/2.4.13.6/modules/imgproc/doc/object_detection.html#matchtemplate</a><br>
                      		public static void matchTemplate(Mat image, Mat templ, Mat result, int method); 各参数说明：</h4>
                      		<table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 20%">参数</th>
				                  <th>说明</th>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>Mat src</td>
				                  <td>源文件Mat对象8bit或32bit float单通道，彩色也可以</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>Mat templ</td>
				                  <td>寻找的区域，不能超过源图像大小</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td> Mat result</td>
				                  <td>查找的结果，必须是单通道32bit float，且尺寸规定为：(image.width-templ.width+1)*(image.height-templ.height+1)</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>int method</td>
				                  <td>平方差匹配：Imgproc.TM_SQDIFF=0;标准平方差匹配：Imgproc.TM_SQDIFF_NORMED=1；相关性匹配：Imgproc.TM_CCORR=2；
				                  标准相关匹配：Imgproc.TM_CCORR_NORMED=3；相关性系数匹配：Imgproc.TM_CCOEFF=4；标准相关性系数匹配：Imgproc.TM_CCOEFF_NORMED=5</td>
				                </tr>
				              </tbody></table>
              
              
                      </div>
                  </div>
                </div>
                
                
                <div class="panel box box-success">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                        模板匹配算法说明
                      </a>
                    </h4>
                  </div>
                  <div id="collapseTwo" class="panel-collapse collapse in">
                    <div class="box-body">
                    <h4>模板匹配方法是利用原图与模板图之间重叠的部分进行对比，来得出最近似的结果集。具体的匹配算法如下Method参数所示。Imgproc.TM_SQDIFF=0;标准平方差匹配：Imgproc.TM_SQDIFF_NORMED=1；相关性匹配：Imgproc.TM_CCORR=2；
				                  标准相关匹配：Imgproc.TM_CCORR_NORMED=3；相关性系数匹配：Imgproc.TM_CCOEFF=4；标准相关性系数匹配：Imgproc.TM_CCOEFF_NORMED=5<br>
				                  当完成对比后，最佳匹配结果将通过 minMaxLoc()函数获取，当TM_SQDIFF时最佳匹配结果取函数获取到的最小值minimums；当为CV_TM_CCORR 或 CV_TM_CCOEFF时，最佳匹配结果取函数获取到的最大值maximums
				                  当为彩色图像时，分子和分母中的每一个总和都是在所有通道上完成的，每个通道使用单独的平均值。也就是说虽然函数可以接受彩色模板和彩色图像。但结果仍然是一个单通道图像，因为这样更容易分析</h4>
							 <table class="table table-bordered">
				                <tbody><tr>
				                  <th style="width: 10px">#</th>
				                  <th style="width: 10%">匹配算法</th>
				                  <th>公式</th>
				                  <th>解释说明</th>
				                </tr>
				                <tr>
				                  <td>0.</td>
				                  <td>TM_SQDIFF</td>
				                  <td><img alt="" src ="${ctxStatic}/images/TM_SQDIFF.png"></td>
				                  <td>该方法使用平方差进行匹配，因此最佳的匹配结果在结果为0处，值越大匹配结果越差。图中最黑的部分表示最好的匹配</td>
				                </tr>
				                <tr>
				                  <td>1.</td>
				                  <td>TM_SQDIFF_NORMED</td>
				                  <td><img alt="" src ="${ctxStatic}/images/TM_SQDIFF_NORMED.png"></td>
				                  <td>该方法使用归一化的平方差进行匹配，最佳匹配也在结果为0处.图中最黑的部分表示最好的匹配</td>
				                </tr>
				                <tr>
				                  <td>2.</td>
				                  <td>TM_CCORR</td>
				                  <td><img alt="" src ="${ctxStatic}/images/TM_CCORR.png"></td>
				                  <td>该方法使用源图像与模板图像的卷积结果进行匹配，因此，最佳匹配位置在值最大处，值越小匹配结果越差。图中最白的部分表示最好的匹配</td>
				                </tr>
				                <tr>
				                  <td>3.</td>
				                  <td>TM_CCORR_NORMED</td>
				                  <td><img alt="" src ="${ctxStatic}/images/TM_CCORR_NORMED.png"></td>
				                  <td>归一化的相关性匹配方法，与相关性匹配方法类似，最佳匹配位置也是在值最大处。图中最白的部分表示最好的匹配</td>
				                </tr>
				                <tr>
				                  <td>4.</td>
				                  <td>TM_CCOEFF</td>
				                  <td><img alt="" src ="${ctxStatic}/images/TM_CCOEFF_1.png"><img alt="" src ="${ctxStatic}/images/TM_CCOEFF_2.png"></td>
				                  <td>相关性系数匹配方法，该方法使用源图像与其均值的差、模板与其均值的差二者之间的相关性进行匹配，最佳匹配结果在值等于1处，最差匹配结果在值等于-1处，值等于0直接表示二者不相关。图中最白的部分表示最好的匹配</td>
				                </tr>
				                <tr>
				                  <td>5.</td>
				                  <td>TM_CCOEFF_NORMED</td>
				                  <td><img alt="" src ="${ctxStatic}/images/TM_CCOEFF_NORMED.png"></td>
				                  <td>归一化的相关性系数匹配方法，正值表示匹配的结果较好，负值则表示匹配的效果较差，也是值越大，匹配效果越好。图中最白的部分表示最好的匹配</td>
				                </tr>
				              </tbody>
				             </table>
                    </div>
                  </div>
                </div>   
                
                
                
            </div>
            <!-- /.box-body -->
            
            <h4>&nbsp;&nbsp;模板匹配测试</h4>	
    			 <div class="box-body">
    			<table class="table table-bordered">
                <tbody><tr>
                  <th style="width:50%">匹配算法</th>
                  <th style="width:20%">显示过程|结果</th>
                  <th style="">操作</th>
                </tr>
                <tr>
                  <td>
                   		<input type="radio" name="method" value="0" checked="checked"/>&nbsp;TM_SQDIFF=0 &nbsp;<br> 
                  		<input type="radio" name="method" value="1"/>&nbsp;TM_SQDIFF_NORMED=1 &nbsp;<br>
                  		<input type="radio" name="method" value="2"/>&nbsp;TM_CCORR=2&nbsp;<br>
                  		<input type="radio" name="method" value="3"/>&nbsp;TM_CCORR_NORMED=3&nbsp;<br>
                  		<input type="radio" name="method" value="4"/>&nbsp;TM_CCOEFF=4&nbsp;<br>
                  		<input type="radio" name="method" value="5"/>&nbsp;TM_CCOEFF_NORMED=5&nbsp;
                  </td>
                  <td>
                   		<input type="radio" name="imageType" value="0" checked="checked"/>&nbsp;显示匹配过程 &nbsp;<br> 
                  		<input type="radio" name="imageType" value="1"/>&nbsp;显示匹配结果 &nbsp;<br>
                  </td>
                  <td>
                  	   <a class="btn btn-info" id="findtemplate"><i class="fa fa-object-ungroup"></i>模板匹配</a>
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
		          		  <div id="preview-pane">
							    <div class="preview-container">
		          						<img id="match" src="" class="jcrop-preview" alt="匹配的模板图片" />
							    </div>
						   </div>
						   
			        </div><!-- /.box-body -->
			       <div class="inline-labels">
				    <label>X1 <input type="text" size="4" id="x1" name="x1" value="0"/></label>
				    <label>Y1 <input type="text" size="4" id="y1" name="y1" value="0"/></label>
				    <label>X2 <input type="text" size="4" id="x2" name="x2" value="100"/></label>
				    <label>Y2 <input type="text" size="4" id="y2" name="y2" value="62"/></label>
				    <label>W <input type="text" size="4" id="width" name="width" value="100"/></label>
				    <label>H <input type="text" size="4" id="height" name="height" value="62"/></label>
				    </div>
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
<script src="${ctxStatic}/plugins/jcrop/Jcrop-0.9.12/js/jquery.Jcrop.min.js?t=${version}"></script>
</html>
