package controller;

import dao.DonorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteDonorServlet")
public class DeleteDonorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            DonorDAO dao = new DonorDAO();

            dao.deleteDonor(id);

            response.sendRedirect("admin.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("admin.jsp");
        }
    }
}