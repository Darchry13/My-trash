<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="theUsers" class="userdata.Users" scope="session"/>
<jsp:useBean id="lst" class="userdata.UserList" scope="session"/>

<style>
p {
	color: #80ffff;
}
input {
	width: 180px;height: 20px;margin: 5px;
	font-size: 16px;font-family: "宋体";
	}
#tip {
	background-color:rgb(153, 153, 255,0.5);color: #ccffe6;
	padding: 15px;margin: 200px auto 0px;width: 600px;
	text-align: center;
	font-family: "宋体";font-weight: bold;
	box-shadow: 5px 5px 10px #b3e6ff;
}
#anniu {
	width: 120px;height: 40px;
	background-color: rgb(153, 51, 255,0.7);border: 0px;color: black;
	margin: 10px;
	font-size: 18px;font-family: "宋体";font-weight: bold;
}
</style>
<html>
<body background="image/1.jpg" style="background-size:100% 100%">
<div id="tip">
<%
	int panduan = theUsers.getTag();
	if(panduan == 0) {
%>
<p>该用户不存在！</p>
<%
	} 
	else if(panduan == -1) {
%>
<p>请检查账号密码是否正确！</p>
<%
	}
%>
<h1>用户登录页面</h1>
	<hr/>
	<form action="check" method=post>
		<label>用户名：<input type="text" name="UserName" placeholder="请输入用户名" required/><br></label>
		<label>密&nbsp;码：<input type="password" name="PassWord" placeholder="请输入密码" required><br></label>
		<label><input type="submit" id="anniu" value="登录"/></label>
		<label><input type="button" id="anniu" value="注册" onclick="javascript:window.location.href='register.jsp'"/></label>
	</form>
</div>
<%
	theUsers.setMid(-1);
%>
</body>
</html>