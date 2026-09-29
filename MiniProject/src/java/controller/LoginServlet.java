package controller;

import dao.DonorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Donor;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        DonorDAO dao = new DonorDAO();

        Donor donor = dao.login(email, password);

        if (donor != null) {

            HttpSession session = request.getSession();

            session.setAttribute("donor", donor);

            response.sendRedirect("dashboard.jsp");

        } else {

            response.sendRedirect(
                    "login.jsp?error=Invalid Email or Password"
            );
        }
    }
}