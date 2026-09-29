package controller;

import dao.DonorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Donor;

@WebServlet("/RegisterDonorServlet")
public class RegisterDonorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String ageText = request.getParameter("age");
        String gender = request.getParameter("gender");
        String bloodGroup = request.getParameter("bloodGroup");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        try {

            int age = Integer.parseInt(ageText);

            Donor donor = new Donor(
                    name,
                    age,
                    gender,
                    bloodGroup,
                    phone,
                    email,
                    address,
                    password
            );

            DonorDAO dao = new DonorDAO();

            boolean result = dao.registerDonor(donor);

            if (result) {

                response.sendRedirect(
                        "login.jsp?message=Registration Successful"
                );

            } else {

                response.sendRedirect(
                        "register.jsp?error=Registration Failed"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "register.jsp?error=Invalid Data"
            );
        }
    }
}