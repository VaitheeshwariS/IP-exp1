package controller;

import dao.DonorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Donor;

@WebServlet("/UpdateDonorServlet")
public class UpdateDonorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            String name =
                    request.getParameter("name");

            int age = Integer.parseInt(
                    request.getParameter("age")
            );

            String gender =
                    request.getParameter("gender");

            String bloodGroup =
                    request.getParameter("bloodGroup");

            String phone =
                    request.getParameter("phone");

            String email =
                    request.getParameter("email");

            String address =
                    request.getParameter("address");

            Donor donor = new Donor();

            donor.setId(id);
            donor.setName(name);
            donor.setAge(age);
            donor.setGender(gender);
            donor.setBloodGroup(bloodGroup);
            donor.setPhone(phone);
            donor.setEmail(email);
            donor.setAddress(address);

            DonorDAO dao = new DonorDAO();

            boolean result = dao.updateDonor(donor);

            if (result) {

                response.sendRedirect(
                        "dashboard.jsp?message=Profile Updated"
                );

            } else {

                response.sendRedirect(
                        "update.jsp?error=Update Failed&id=" + id
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "dashboard.jsp?error=Invalid Data"
            );
        }
    }
}