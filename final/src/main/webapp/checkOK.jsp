<%@ page contentType = "text/html" %>
<%@ page pageEncoding = "utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="theUsers" class="userdata.Users" scope="session"/>
<jsp:useBean id="lst" class="userdata.UserList" scope="session"/>

<style>
a {
	color: #80ffff;
}
#tip {
	background-color:rgb(153, 153, 255,0.5);color: #ccffe6;
	padding: 15px;margin: 100px auto 0px;width: 600px;
	text-align: center;
	font-family: "宋体";font-weight: bold;
	box-shadow: 5px 5px 10px #b3e6ff;
}
</style>
<html>
<body background="image/1.jpg" style="background-size:100% 100%">
<div id="tip">
	<h1>用户<%= theUsers.getUsername() %>，恭喜你登录成功！</h1>
	<br>
	<h2><a href="search">进入用户管理系统</a></h2>
</div>
<%
	theUsers.setMid(1);
%>
</body>
</html>