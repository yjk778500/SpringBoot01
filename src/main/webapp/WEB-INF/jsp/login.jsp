<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", path);
%>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>权限管理</title>
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!-- <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" /> -->
        <meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" href="static/layui/css/layui.css">
		<link rel="stylesheet" href="static/css/font.css">
        <link rel="stylesheet" href="static/css/xadmin.css">
       <!--  <link rel="stylesheet" href="./css/theme5.css">-->
        <script src="static/layui/layui.js" charset="utf-8"></script> 
        <script type="text/javascript" src="static/js/xadmin.js"></script>
        
        <script>
            //是否开启刷新记忆tab功能
             var is_remember = false;
        </script>
        	<style type="text/css">
        	
         tr{
         	height: 30px;
         	align:center;
         }
         td{
         	width: 80px;
         	text-align:center;
         }
        </style>
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a>用户信息管理</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item" style="margin-right: 30px;">
                 	欢迎您! 康少
                </li>
                <li class="layui-nav-item to-index">
                    <a href="index">退出</a></li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                 <li>
					<a href="javascript:;" > 
						<i class="iconfont left-nav-li" lay-tips="系统基础管理">&#xe6b8;</i>
						<cite>管理</cite> 
						<i class="iconfont nav_right">&#xe697;</i>
					</a>
				<ul class="sub-menu">
				
                        <li>
                            <a onclick="cha()">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>查询用户</cite></a>
                        </li>
                   </ul>
				</li>
			
                  </ul>
            </div>
        </div>
         <div class="page-contents" align="center" id="aa" style="margin-top:50px">
         <h1>SpringBoot练习</h1>
        </div>
    
     <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
     <script src="${path}/statics/js/ui.js"></script>
     <script>
     //查询用户所有的信息,异步刷新
     function cha(){
     		$.ajax({
     		url	:"getlist",
     		type	:"post",
     		data	:{
     			"user_name":"",
     			"zu_id"	:""
     		},
     		success	:function(data){
     			$("#aa").html(data);
     		}
     	});
     	}
     	
     </script>
     </body>
</html>