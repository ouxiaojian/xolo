<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
    <script type="text/javascript">
		
		
		function execute(obj){
			var platForm = $(obj).attr("platForm");
// 			ajaxSimple(ctxPath+"/task/updateKn",{"platForm":platForm},function(data){
// 				if(data!=-3){
// 					alert("更新完成")
// 				 	var excel = "../file/"+data;
// 	            	window.location.href=excel;
// 				}
				
// 			})
			$.SaveForm({
				url : ctxPath+"/task/updateKn?_" + $.now(),
				param: {"platForm":platForm},
				json:true,
				success : function(result) {
					alert(result.code)
				}
			});
			
		}
		function createPdf(obj){
			var platForm = $(obj).attr("data-type");
			var status = $(obj).attr("data-status");
			$.SaveForm({
				url : ctxPath+"/paperFile/createPdf?_" + $.now(),
				param: {"platForm":platForm,"status":status},
				json:true,
				success : function(result) {
					alert(result.code)
				}
			});
		}
		function paperFile(subjectCode){
			$.SaveForm({
				url : ctxPath+"/paperFile/paperFile?_" + $.now(),
				param: {"subjectCode":subjectCode},
				json:true,
				success : function(result) {
					alert(result.code)
				}
			});
		}
	</script>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">介绍页</div>
		<div>
			<h3>&nbsp;&nbsp;&nbsp;基本信息</h3>
			<ul>
				
				<div class="panel panel-info">
					<div class="panel-heading">介绍页</div>
					<div class="panel-body">
						<button type="button" class="btn btn-primary" onclick="createPdf(this)" data-type="share" data-status="5">课外资源已开放五份试卷</button>
					</div>
				</div>
			</ul>
		</div>
	</div>
</body>
</html>
