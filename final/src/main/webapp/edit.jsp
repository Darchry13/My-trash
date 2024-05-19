<%@ page contentType = "text/html" %>
<%@ page pageEncoding = "utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="theUsers" class="userdata.Users" scope="session"/>
<jsp:useBean id="lst" class="userdata.UserList" scope="session"/>

<style>
h1 {
	color: #80ffff;
}
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
<body background="image/2.jpg" style="background-size:100% 100%">
<%
	String tmp = request.getParameter("userId");
	int i = Integer.parseInt(tmp);
	String x1 = lst.getUserlist(i).getUsername();
	String x2 = lst.getUserlist(i).getPassword();
	String x3 = lst.getUserlist(i).getPhonenumber();
	String x4 = lst.getUserlist(i).getEmail();
	String x5 = lst.getUserlist(i).getSex();
	theUsers.setCaozuo(1);
%>
<div id="tip">
	<h1>编辑用户</h1><br>
	<form action="update?firstUsername=<%= x1 %>" method="post">
		<label>用户名：<input type="text" name="UserName" value=<%= x1 %> required><br></label>
		<label>密&nbsp;码：<input type="text" name="PassWord" value=<%= x2 %> required><br></label>
		<label>电&nbsp;话：<input type="text" name="PhoneNumber" value=<%= x3 %> required><br></label>
		<label>邮&nbsp;箱：<input type="email" name="Email" value=<%= x4 %> required><br></label>
<%
	if(x5 != null && x5.equals("女")) {
%>
		<label>性&nbsp;别：
			<input type="radio" id="input1" name="Type" value="Male" required>男
			<input type="radio" id="input1" name="Type" value="Female" checked required/>女<br>
		</label>
<%
	} 
	else {
%>
		<label>性&nbsp;别：
			<input type="radio" id="input1" name="Type" value="Male" checked required>男
			<input type="radio" id="input1" name="Type" value="Female" required/>女&nbsp;&nbsp;<br>
		</label>
<%
	}
%>
		<br><label><input type="submit" id="anniu" value="确定"/></label>
		<label><input type="button" id="anniu" value="取消" onclick="javascript:window.location.href='userlist.jsp'"/></label>
	</form>
</div>
</body>
</html>