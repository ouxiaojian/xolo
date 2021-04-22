<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script>

//action="http://192.168.1.51:85/java_opencv/base/houghcircle"
 $('#fileupload-form').on('submit',(function(e) {
       e.preventDefault();
       //序列化表单
      var serializeData = $(this).serialize();

      // var formData = new FormData(this);
      $(this).ajaxSubmit({
           type:'POST',
           url: 'http://192.168.1.51:85/java_opencv/base/houghcircle',
           dataType: 'json',
           data: serializeData,
           // data: formData,
           contentType: false,
           cache: false,
           processData:false,
           beforeSubmit: function() {
                   //上传图片之前的处理
           },
           uploadProgress: function (event, position, total, percentComplete){
               //在这里控制进度条
           },
           success:function(data){
                alert(data);
           },
           error:function(data){
               alert('上传图片出错');
           }
       });
   }));

  //绑定文件选择事件，一选择了图片，就让`form`提交。
   $("#fileupload").on("change", function() {
       $(this).parent().submit();
});

</script>
<body>
    <form action="http://192.168.1.51:85/java_opencv/base/houghcircle" method="post" enctype="multipart/form-data">
  	图片<input type="file" name="file"/><br/>
   	<input type="submit" value="上传" />
   	</form>
</body>
