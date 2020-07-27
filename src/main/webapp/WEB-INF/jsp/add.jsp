<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/bootstrap.css"> --%>
    <title>My JSP 'add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>

		<div align="center" style="margin-top: 130px;" class="bb" id="bb">
		<form >
			<table border="1" align="center" style="margin-top: 150px">
				<tr>
					<th colspan="2" align="center" style="background-color: #999999"><h3>${user.id==null?'添加用户':'修改用户' }</h3></th>
				</tr>
				<tr>
					<td>&#160;&#160;&#160;&#160;玩家昵称：</td>
					<td><input type="text" name="user_name" id="user_name" value="${user.user_name}" /></td>
				</tr>

				<tr>
					<td>&#160;&#160;&#160;&#160;玩家住址：</td>
					<td><input type="text" name="user_address" id="user_address" value="${user.user_address }" /></td>
				</tr>
			
					<tr>
					<td>&#160;&#160;&#160;&#160;联系方式：</td>
					<td><input type="text" name="user_tel" id="user_tel" value="${user.user_tel }" /></td>
				</tr>
				<tr>
					<td>&#160;&#160;&#160;&#160;游戏大区：</td>
					<td><select id="zu_id" name="zu_id">
   				<option value="0">请选择</option>
   			
   				<c:forEach items="${wan }" var="b">
   					<option value="${b.zid}" ${b.zid == user.zu_id ?'selected':''}>${b.zname}</option>
   				</c:forEach>
				</select></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
					<input type="button" class="btn btn-info" onclick="baoc(${user.id})" value="保存" /> &#160;&#160;&#160;&#160;
						<input type="reset" class="btn btn-danger" value="重置" /></td>
				</tr>
			</table>
		</form>
		</div>
  </body>
    <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
<%--   <script src="${pageContext.request.contextPath}/static/js/bootstrap.js"></script> --%>
  <script type="text/javascript">
  	 //添加  修改
  	function baoc(id){
  		var user_name=$("#user_name").val();
  		var zu_id=$("#zu_id").val();
  		var user_address=$("#user_address").val();
  		var user_tel=$("#user_tel").val();
  		if(user_name ==null ||user_name== ""){
  			alert("请输入昵称!");
  			return false;
  		}else if(user_address==null ||user_address==""){
  			alert("请输入地址!");
			return false;  	
		}else if(user_tel==null ||user_tel == ""){
			alert("请输入联系方式!");
			return false;
		}else if(zu_id==null ||zu_id==0){
  			alert("请选择大区");
  			return false;	
  		}else{
  			
  			$.ajax({
  				url: "adduser",
  				type:"post",
  				data:{
  					"id"	   :id,
  					"user_name":user_name,
  					"user_address":user_address,
  					"user_tel"	:user_tel,
  					"zu_id"		:zu_id
  				},
  				success:function(data){
  					if(data.type=="success"){
  						alert(data.msg);
  						$(".bb").removeClass();
					 	$("#bb").load("getlist .bb");
  					}else {
  						alert(data.msg);
  					}
  				},
  				error:function(data){
  					alert("请求异常!")
  				}
  			});
  			
  		
  		}
  	}
  
  </script>
</html>
