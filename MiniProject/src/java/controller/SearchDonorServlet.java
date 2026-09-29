package controller;

import dao.DonorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Donor;

@WebServlet("/SearchDonorServlet")
public class SearchDonorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String bloodGroup =
                request.getParameter("bloodGroup");

        DonorDAO dao = new DonorDAO();

        List<Donor> donors =
                dao.searchByBloodGroup(bloodGroup);

        request.setAttribute("donors", donors);
        request.setAttribute("selectedBloodGroup", bloodGroup);

        request.getRequestDispatcher("search.jsp")
                .forward(request, response);
    }
}