<%@ page import="model.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Aka
  Date: 17.06.2020
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manager Home</title>
</head>
<body>
<a href="index.jsp">Logout</a><br>
<%
    List<Task> tasks = (List<Task>)request.getAttribute("tasks");
    List<User>users = (List<User>)request.getAttribute("users");
    User user = (User)session.getAttribute("user");
    if (user!=null){
%>
Welcome to <%=user.getName() %><%="  " + user.getSurName()%>
<%} %>


<p>Add User</p>
<form action="/register" method="post">
    <p >Name</p>
    <input type="text" name="name"placeholder="please input your email">
    <p >Surname</p>
    <input type="text" name="surName"placeholder="please input your surName">
    <p >Email</p>
    <input type="text" name="email"placeholder="please input your email">
    <p >Password</p>
    <input type="password" name="password"placeholder="please input your password"><br><br>
    <select name="userType">
        <option value="USER">USER</option>
        <option value="MANAGER">MANAGER</option>
    </select><br><br>
    <input type="submit" value="OK" ><br><br>
</form>


All Users:

<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>SurName</td>
        <td>Email</td>
        <td>UserType</td>
        <td>Delete</td>
    </tr>
    <% for (User user1 : users) { %>

    <tr>
        <td><%=user1.getId()%></td>
        <td><%=user1.getName()%></td>
        <td><%=user1.getSurName()%></td>
        <td><%=user1.getEmail()%></td>
        <td><%=user1.getUserType()%></td>
        <td><a href="/deleteUsers?id=<%=user1.getId()%>">delete</a></td>
    </tr>
    <%  } %>
</table>



<p>All Tasks:</p>
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
    <%  } %>
</table>


<div style="margin-left:30%;margin-top: -42%">

<p>Add Tasks</p>

<form action="/addTasks" method="post">
    <p >Name</p>
    <input type="text" name="name"placeholder="please input your name">
    <p >Description</p>
    <input type="text" name="description"placeholder="please input your description">
    <p >Deadline</p>
    <input type="date" name="deadline">
    <p>Status</p>
    <select name="status">
        <option value="TODO">TODO</option>
        <option value="IN_PROGRESS">IN_PROGRESS</option>
        <option value="FINISHED">FINISHED</option>
    </select>
    <p >UserID</p>
    <select name="user_id">
        <%
            for (User user1 : users) {%>
        <option value="<%=user1.getId()%>"><%=user1.getName()%> <%=user1.getSurName()%>
        </option>

        <%
            }
        %>
    </select>

    <input type="submit" value="OK" style="margin-top: 10px"><br><br>
</form>
</div>
</body>
</html>
