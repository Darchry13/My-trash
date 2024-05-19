<%@ page contentType = "text/html" %>
<%@ page pageEncoding = "utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="theUsers" class="userdata.Users" scope="session"/>
<jsp:useBean id="lst" class="userdata.UserList" scope="session"/>

<style>
p {
	color: #80ffff;
}
h1 {
	color: red;
}
#tip {
	background-color:rgb(153, 153, 255,0.5);color: #ccffe6;
	padding: 15px;margin: 100px auto 0px;width: 600px;
	text-align: center;font-family: "宋体";font-weight: bold;
	box-shadow: 5px 5px 10px #b3e6ff;
}
</style>
<html>
<body background="image/1.jpg" style="background-size:100% 100%">
<%
	String x1 = theUsers.getUsername();
	String x2 = theUsers.getPassword();
	String x3 = theUsers.getPhonenumber();
	String x4 = theUsers.getEmail();
	String x5 = theUsers.getSex();
%>
<div id="tip">
	<h1>用户信息</h1>
	用户名：<%= x1 %><br>
	密码：<%= x2 %><br>
	手机号：<%= x3 %><br>
	电子邮箱：<%= x4 %><br>
	性别：<%= x5 %><br>
	<br><p>用户<%= x1 %>，恭喜你注册成功！</p>
	<br><a href="Login.jsp"><br>回到登录界面</a>
	<br><a href="search"><br>查看用户信息汇总</a>
</div>
</body>
</html>