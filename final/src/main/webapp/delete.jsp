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
	color: rgb(255, 0, 85,0.7);
	box-shadow: 0 2px 5px white;
}
input {
	width: 180px;height: 20px;margin: 5px;
	font-size: 16px;font-family: "宋体";
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
<body background="image/2.jpg" style="background-size:100% 100%">
<%
	String tmp = request.getParameter("userId");
	int i = Integer.parseInt(tmp);
	String x1 = lst.getUserlist(i).getUsername();
	String x2 = lst.getUserlist(i).getPassword();
	String x3 = lst.getUserlist(i).getPhonenumber();
	String x4 = lst.getUserlist(i).getEmail();
	String x5 = lst.getUserlist(i).getSex();
	theUsers.setCaozuo(2);
%>
<div id="tip">
	<h1>删除用户!</h1>
	用户名：<%= x1 %><br>
	密码：<%= x2 %><br>
	手机号：<%= x3 %><br>
	电子邮箱：<%= x4 %><br>
	性别：<%= x5 %><br><br>
	<form action="update?UserName=<%= x1 %>" method="post">
		<p>是否确认要删除第<%= i+1 %>位用户<%= x1 %>？</p><br>
		<label><input type="submit" id="anniu" value="确定"/></label>
		<label><input type="button" id="anniu" value="取消" onclick="javascript:window.location.href='userlist.jsp'"/></label>
	</form>
</div>
</body>
</html>