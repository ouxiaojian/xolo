<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>OPENCV - 学习</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="statics/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="statics/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="statics/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="statics/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="statics/css/skins/skin-blue.min.css">
  <link rel="stylesheet" href="statics/css/common.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<a href="javascript:void(0);" class="logo"> 
				<span class="logo-mini">
					<b>OCL</b>
				</span> 
				<span class="logo-lg">
					<b>OpenCV</b>_Learn
				</span>
			</a>
			<nav class="navbar navbar-static-top" role="navigation">
				<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
			        <span class="sr-only">Toggle navigation</span>
		      	</a>
				<div style="float: left; color: #fff; padding: 15px 10px;">欢迎ADMIN</div>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp"><i class="fa fa-home"></i> &nbsp;首页</a></li>
						<!-- <li><a href="javascript:;"><i class="fa fa-lock"></i> &nbsp;修改密码</a></li>
						<li><a href="javascript:;"><i class="fa fa-sign-out"></i> &nbsp;退出系统</a></li> -->
					</ul>
				</div>
			</nav>
		</header>
  
  		<!-- Left side column. contains the logo and sidebar -->
  		<!-- 导航菜单 -->
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar Menu -->
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">导航菜单</li>
					<!-- Optionally, you can add icons to the links -->
					
					<!-- <li class="treeview">
			          <a href="#index" class="menu1">
			            <i class="fa fa-question-circle"></i><span>初识OpenCV</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/index/introduce.jsp"><i class="fa fa-circle-o"></i>OpenCV介绍</a></li>
			            <li><a href="#view/index/setting.jsp"><i class="fa fa-circle-o"></i>JAVA集成OpenCV</a></li>
			          </ul>
			        </li>	 -->	
					<!-- <li class="treeview">
			          <a href="#demo" class="menu1">
			            <i class="fa fa-calendar-o"></i> <span>简单DEMO</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/demo/helloword.jsp"><i class="fa fa-circle-o"></i>Hello Word</a></li>
			            <li><a href="#view/demo/mat.jsp"><i class="fa fa-circle-o"></i>Mat对象</a></li>
			          </ul>
			        </li> -->
			        
					<li class="treeview">
			          <a href="#base" class="menu1">
			            <i class="fa fa-list"></i> <span>基础功能</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/base/houghcircle.jsp"><i class="fa fa-circle-o"></i>检测圆+指针(上传图片识别)</a></li>
			          </ul>
			        </li>
			        
					<!-- <li class="treeview">
			          <a href="#card" class="menu1">
			            <i class="fa fa-picture-o"></i><span>答题卡demo</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/card/recognition.jsp"><i class="fa fa-circle-o"></i>检测填涂</a></li>
			            <li><a href="#view/card/cardPlus.jsp"><i class="fa fa-circle-o"></i>答题卡识别</a></li>
			            <li><a href="#view/card/pagecheck.jsp"><i class="fa fa-circle-o"></i>页码识别</a></li>
			            <li><a href="#view/card/marktest.jsp"><i class="fa fa-circle-o"></i>定位点优化</a></li>
			            <li><a href="#view/card/rectification.jsp"><i class="fa fa-circle-o"></i>图像矫正</a></li>
			            <li><a href="#view/card/realTest.jsp"><i class="fa fa-circle-o"></i>校正真实测试</a></li>
			            <li><a href="#view/card/card2.jsp"><i class="fa fa-circle-o"></i>无定位点答题卡识别</a></li>
			          </ul>
			        </li>
					
					<li>
						<a href="#view/index/todo.jsp"><i class="fa fa-hand-peace-o"></i><span>持续更新中</span></a>
					</li> -->
			        
			        
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>
		<!-- 路径导航 -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
		    <section class="content-header">
		      <h1 id = "currentpage">介绍</h1>
		      <ol class="breadcrumb">
		        <li><a href="index.jsp"><i class="fa fa-dashboard"></i>首页</a></li>
		        <li id = "pagehead2">首页</li>
		        <li class="active"  id = "pagehead3">介绍</li>
		      </ol>
		    </section>
		    
			<!-- Main content -->
			<section class="content">
				<iframe scrolling="yes" frameborder="0"
					style="width: 100%; min-height: 200px; overflow: visible; background: #fff;"
					src="main.jsp" id="mainFrame" name="mainFrame"></iframe>
				<!--------------------------
        		| Your Page Content Here |
        		-------------------------->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
	  <footer class="main-footer">
	    <div class="pull-right hidden-xs">
	      <b>Version</b> 1.0.0
	    </div>
	    <strong>Copyright &copy; 2017 <a href="#">ACTS Songer</a>.</strong> All rights reserved.
	  </footer>
</div>
<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="statics/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="statics/js/bootstrap.min.js"></script>
<script src="statics/plugins/layer/layer.js"></script>
<!-- AdminLTE App -->
<script src="statics/js/adminlte.min.js"></script>
<script src="statics/js/index.js?t=${version}"></script>
<script src="statics/js/common.js"></script>
<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
</html>