package servlet;

import manager.TaskManager;
import manager.UserManager;
import model.Task;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(urlPatterns = "/managerHome")

public class ManagerHomeServlet extends HttpServlet {

    TaskManager taskManager = new TaskManager();
    UserManager userManager = new UserManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = userManager.getAllUser();
        List<Task> tasks = taskManager.getAllTasks();

        req.setAttribute("users", users);
        req.setAttribute("tasks", tasks);
        req.getRequestDispatcher("/managerHome.jsp").forward(req, resp);
    }
}












