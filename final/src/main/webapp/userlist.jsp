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
hr {
	border: 0;border-top: 2px solid rgb(92, 92, 214,0.7);
	border-bottom: 1px solid #adadeb;
}
p {
	font-size: 30px;font-family: "宋体";
	display: inline;
}
th {
	width: 200px;height: 20px;
}
tr {
	background-color: rgb(230, 230, 230,0.3);
}
#tr1 {
	background-color: rgb(153, 153, 255,0.7);
}
#tip {
	background-color:rgb(153, 153, 255,0.5);color: #ccffe6;
	padding: 15px;margin: 100px auto 0px;width: 1000px;
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
<div id="tip">
	<form action="register.jsp" method="post">
	<br>
	<p>用户管理系统</p>
	<br><br>
	<label><input type="submit" id="anniu" value="添加用户"/></label>
	<label><input type="button" id="anniu" value="退出系统" onclick="javascript:window.location.href='Login.jsp'"/></label>
	<br><br>
	<hr>
	<table border="1">
		<tr id="tr1">
			<th>序号</th>
			<th>用户名</th>
			<th>密码</th>
			<th>手机号</th>
			<th>性别</th>
			<th>邮箱</th>
			<th></th>
			<th></th>
		</tr>
<%
	int len = lst.getLength();
	for(int i=len-1; i>=0; i--) {
%>
		<tr>
			<th><%= len-i %></th>
			<th><%= lst.getUserlist(i).getUsername() %></th>
			<th><%= lst.getUserlist(i).getPassword() %></th>
			<th><%= lst.getUserlist(i).getPhonenumber() %></th>
			<th><%= lst.getUserlist(i).getSex() %></th>
			<th><%= lst.getUserlist(i).getEmail() %></th>
			<th><a href="delete.jsp?userId=<%= i %>">删除</a></th>
			<th><a href="edit.jsp?userId=<%= i %>">修改</a></th>
		</tr>
<%
	}
%>
	</table>
</form>
</div>
</body>
</html>