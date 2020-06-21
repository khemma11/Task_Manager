<%@ page import="model.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Aka
  Date: 17.06.2020
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Home</title>
</head>
<body>

<a href="logout">Logout</a><br><br>
<%
    User user = (User)session.getAttribute("user");
    List<Task> tasks = (List<Task>)session.getAttribute("tasks");
%>

<p>Welcome to <%=user.getName() %> <%=" "+user.getSurName()%></p>

<p>My Tasks</p>

<table border="1">

    <tr>
        <td>Name </td>
        <td>Description</td>
        <td>Deadline</td>
        <td>Status</td>
        <td>UserID</td>
    </tr>
    <%
        for (Task task : tasks) {%>
    <tr>
        <td><%=task.getName()%></td>
        <td><%=task.getDescription()%></td>
        <td><%=task.getDeadline()%></td>
        <td><%=task.getStatus()%></td>
        <td><%=task.getUserId()%></td>
    </tr>
    <%}%>

</table>
</body>
</html>
