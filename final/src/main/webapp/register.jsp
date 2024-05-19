<%@ page contentType = "text/html" %>
<%@ page pageEncoding = "utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="theUsers" class="userdata.Users" scope="session"/>
<jsp:useBean id="lst" class="userdata.UserList" scope="session"/>

<style>
input {
	width: 180px;height: 20px;margin: 5px;
	font-size: 16px;font-family: "宋体";
}
#input1 {
	width: 40px;height: 20px;
}
#tip {
	background-color:rgb(153, 153, 255,0.5);color: #ccffe6;
	padding: 15px;margin: 100px auto 0px;width: 600px;
	text-align: center;font-family: "宋体";font-weight: bold;
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
	<h1>用户注册页面</h1>
	<hr/>
	<form action="register" method=post>
		<label>用户名:&nbsp;<input type="text" name="UserName" placeholder="请输入用户名" required/><br/></label>
		<label>密&nbsp;码:&nbsp;<input type="password" name="PassWord" placeholder="请输入密码" required><br/></label>
		<label>手机号:&nbsp;<input type="text" name="PhoneNumber" placeholder="请输入手机号" required/><br/></label>
		<label>电子邮箱:<input type="email" name="Email" placeholder="请输入电子邮箱" required/><br/></label>
		<label>性&nbsp;别:&nbsp;
			<input type="radio" id="input1" name="Type" value="Male" required>男
			<input type="radio" id="input1" name="Type" value="Female" required/>女&nbsp;&nbsp;<br/></label>
		<label><input id="anniu" type="submit" value="提交"/></label>
<%
	if(theUsers.getMid()==-1){
%>
		<label><input id="anniu" type="button" value="返回登录" onclick="javascript:window.location.href='Login.jsp'"/></label>
<%
	}
	else{
%>
		<label><input id="anniu" type="button" value="返回操作界面" onclick="javascript:window.location.href='userlist.jsp'"/></label>
<%
	}
%>
	</form>
</div>
</body>
</html>