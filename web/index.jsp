<%--
  Created by IntelliJ IDEA.
  User: Aka
  Date: 21.06.2020
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Main page</title>
</head>
<body>
Welcome
<%
  String msg = "";
  if (session.getAttribute("msg")!= null){
    msg = (String)session.getAttribute("msg");
    session.removeAttribute("msg");
  }
%>
<p style="color: red">
  <%=msg%>
</p>
Login Form:<br>
<form action="/login" method="post">
  <p>Email</p>
  <input type="text" name="email" placeholder="please input your email"><br>
  <p>password</p>
  <input type="password" name="password"placeholder="please input your password"><br><br>
  <input type="submit" value="Login"style="margin-left: 10%">
</form>
<br>
<br>
<br>
Register Form:<br>
<form action="/register" method="post">
  <p >Name</p>
  <input type="text" name="name"placeholder="please input your email">
  <p >Surname</p>
  <input type="text" name="surName"placeholder="please input your surName">
  <p >Email</p>
  <input type="text" name="email"placeholder="please input your email">
  <p >Password</p>
  <input type="password" name="password"placeholder="please input your password"><br><br>
  <input type="submit" value="Register" style="margin-left: 10%"><br><br>
</form>
</body>
</html>
