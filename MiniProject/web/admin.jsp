<%@ page import="java.util.List" %>
<%@ page import="dao.DonorDAO" %>
<%@ page import="model.Donor" %>

<%
    DonorDAO dao = new DonorDAO();

    List<Donor> donors = dao.getAllDonors();
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Admin Dashboard</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

<header class="navbar">

    <div class="logo">
         Blood Donor - Admin
    </div>

    <nav>

        <a href="index.jsp">
            Home
        </a>

        <a href="search.jsp">
            Find Blood
        </a>

    </nav>

</header>

<div class="admin-page">

    <h1>Donor Management</h1>

    <p>
        Total Donors:
        <strong><%= donors.size() %></strong>
    </p>

    <div class="table-container">

        <table>

            <thead>

                <tr>

                    <th>ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Blood Group</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Action</th>

                </tr>

            </thead>

            <tbody>

            <% for (Donor donor : donors) { %>

                <tr>

                    <td>
                        <%= donor.getId() %>
                    </td>

                    <td>
                        <%= donor.getName() %>
                    </td>

                    <td>
                        <%= donor.getAge() %>
                    </td>

                    <td>
                        <%= donor.getGender() %>
                    </td>

                    <td class="blood">
                        <%= donor.getBloodGroup() %>
                    </td>

                    <td>
                        <%= donor.getPhone() %>
                    </td>

                    <td>
                        <%= donor.getEmail() %>
                    </td>

                    <td>
                        <%= donor.getAddress() %>
                    </td>

                    <td>

                        <a class="delete-btn"
                           href="DeleteDonorServlet?id=<%= donor.getId() %>"
                           onclick="return confirmDelete();">
                            Delete
                        </a>

                    </td>

                </tr>

            <% } %>

            </tbody>

        </table>

    </div>

</div>

<script src="js/script.js"></script>

</body>
</html>