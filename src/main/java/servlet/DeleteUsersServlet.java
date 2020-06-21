package servlet;

import manager.TaskManager;
import manager.UserManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/deleteUsers")

public class DeleteUsersServlet extends HttpServlet {

UserManager userManager = new UserManager();
TaskManager taskManager = new TaskManager();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        int userId = Integer.parseInt(id);
        userManager.deleteUserById(userId);
        resp.sendRedirect("/managerHome");
    }
}
