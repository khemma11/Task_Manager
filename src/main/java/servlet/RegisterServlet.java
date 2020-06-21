package servlet;

import manager.UserManager;
import model.User;
import model.UserType;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    private UserManager userManager = new UserManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        String name = req.getParameter("name");
        String surName = req.getParameter("surName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
     String userType = req.getParameter("userType");

        StringBuilder msg = new StringBuilder();

        if (name == null || name.length() == 0) {
            msg.append("Name field is required <br>");
        }
        if (surName == null || surName.length() == 0) {
            msg.append("surName field is required <br>");
        }
        if (email == null || email.length() == 0) {
            msg.append("email field is required <br>");
        }else if (userManager.getByEmail(email)!=null){
            msg.append("email already exists <br>");

        }
        if (password == null || password.length() == 0) {
            msg.append("password field is required <br>");
        }
        if (msg.toString().equals("")) {

            User user = new User();
            user.setName(name);
            user.setSurName(surName);
            user.setEmail(email);
            user.setPassword(password);
            user.setUserType((UserType.valueOf(userType)));
            userManager.addUser(user);
            msg.append("<span style=\"color:green\"> User register successfully. Please login</span>");

        }
        req.getSession().setAttribute("msg", msg.toString());
        resp.sendRedirect("/");


    }
}
