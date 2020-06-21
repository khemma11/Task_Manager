package servlet;

import lombok.SneakyThrows;
import manager.TaskManager;
import model.Task;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/userHome")
public class UserHomeServlet extends HttpServlet {
    TaskManager taskManager = new TaskManager();
    //@Override
//    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
//        User user = (User)session.getAttribute("user");
//        if (user==null) {
//            resp.sendRedirect("/index.jsp");
//
//        } else {
//            req.setAttribute("tasks",taskManager.getAll());
//            req.getRequestDispatcher("/userHome.jsp").forward(req,resp);
//        }
//    }

    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<Task> tasks = taskManager.getAllTasksByUserId((int) user.getId());
        session.setAttribute("tasks", tasks);
        req.getRequestDispatcher("/userHome.jsp").forward(req, resp);
    }
}
