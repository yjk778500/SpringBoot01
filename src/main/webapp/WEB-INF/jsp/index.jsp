<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.layui-table{
    width:1200px;
	}
		h3{
    		color:green;
    	}
	
	</style>
  </head>
  
  <body>
  <div class="bb" id="bb">
  	<c:if test="${list==null }">
  		<script type="text/javascript"> 
             location.href="<%=path%>/getlist";
   </script>    
  	</c:if>
  	<div>
  		<span>玩家名称</span>
  		<input type="text" name="user_name" id="user_name" >
  		
  		<span>玩家大区</span>
  		<select id="zu_id" name="zu_id">
  			<option value="0">请选择</option>
  			<option value="1">安徽一区</option>
  			<option value="2">浙江一区</option>
  			<option value="3">电信一区</option>
  			<option value="4">移动一区</option>
  			<option value="5">山东一区</option>
  		</select>
  		<input type="button" value="查询" id="btn" class="layui-btn layui-btn-lg"  onclick="cha()">
  	</div>
    <div>
    	<table border="1" class="layui-table" align="center" >
    	<tr>
    		<td><h3>玩家名称</h3></td>
    		
    		<td><h3>玩家住址</h3></td>
    		<td><h3>玩家电话</h3></td>
    		<td><h3>玩家大区</h3></td>
    		<td colspan="2"><h3>操作</h3></td>
    	</tr>
    	<c:forEach items="${list }" var="user">
    		<tr>
    			<td>${user.user_name }</td>
    			<td>${user.user_address }</td>
    			<td>${user.user_tel }</td>
    			<td>${user.wana.zname }</td>
    			<td><input type="button" class="btn btn-info" onclick="dele(${user.id})" value="删除" /></td>
				<td><input type="button" class="btn btn-warning" onclick="update(${user.id})" value="修改" /></td>
    		</tr>
    
    	
    	</c:forEach>
    	
    	
    	</table>
    	<input type="button" class="btn btn-warning" style="color: blue;" id="add" onclick="tiao()" value="添加用户">
    
    </div>
    </div>
  </body>
<script type="text/javascript" src="<%=path%>/static/js/jquery-1.12.4.js"></script>
 <script type="text/javascript">
 
 //跳转添加页面
 function tiao(){
 	$.ajax({
     		url	:"addtiao",
     		type	:"post",
     		
     		success	:function(data){
     			$("#aa").html(data);
     		}
     	});
 }
 
 //跳转修改页面
 function update(id){
 	$.ajax({
 		url:"uptiao",
 		type:"post",
 		data:"id="+id,
 		success:function(data){
 			$("#aa").html(data);
 		}
 	
 	
 	});
 
 }
  function dele(ceid){
  	var falg=window.confirm("是否删除该玩家?")
  	if(falg){
  		$.ajax({
  			url	:"deluser",
  			type:"post",
  			data:"id="+ceid,
  			success:function(data){
  				if(data.type=="success"){
  					alert(data.msg);
  						$(".bb").removeClass();
					 	$("#bb").load("getlist .bb");
  				}else{
  					alert(data.msg);
  				}
  			},
  			error:function(data){
  				alert("请求失败!");
  			}
  		
  		
  		});
  	
  	}else{
  		return false;
  	}
  }
  
  //模糊查询
  function cha(){
  	var user_name=$("#user_name").val();
  	var zu_id=$("#zu_id").val();
  	
  		$.ajax({
     		url	:"getlist",
     		type	:"post",
     		data	:{
     			"user_name":user_name,
     			"zu_id"	:zu_id
     		},
     		success	:function(data){
     			$("#aa").html(data);
     		}
     	});
     	}

  
  
  </script>
  
  
</html>
