<%@ page import="java.util.List" %>
<%@ page import="model.Donor" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Find Blood Donor</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

<header class="navbar">

    <div class="logo">
         Blood Donor
    </div>

    <nav>

        <a href="index.jsp">Home</a>

        <a href="register.jsp">
            Register
        </a>

        <a href="search.jsp">
            Find Blood
        </a>

        <a href="login.jsp">
            Login
        </a>

    </nav>

</header>

<div class="search-page">

    <div class="search-box">

        <h1>Find a Blood Donor</h1>

        <p>
            Select a blood group to find available donors.
        </p>

        <form action="SearchDonorServlet"
              method="post">

            <select name="bloodGroup" required>

                <option value="">
                    Select Blood Group
                </option>

                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>

            </select>

            <button type="submit" class="btn">
                Search Donors
            </button>

        </form>

    </div>

    <%
        List<Donor> donors =
                (List<Donor>) request.getAttribute("donors");

        if (donors != null) {
    %>

    <div class="results">

        <h2>
            Available
            <%= request.getAttribute("selectedBloodGroup") %>
            Donors
        </h2>

        <% if (donors.isEmpty()) { %>

            <div class="no-result">
                No donors found for this blood group.
            </div>

        <% } else { %>

            <div class="table-container">

                <table>

                    <thead>

                        <tr>
                            <th>Name</th>
                            <th>Blood Group</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Address</th>
                        </tr>

                    </thead>

                    <tbody>

                    <% for (Donor donor : donors) { %>

                        <tr>

                            <td>
                                <%= donor.getName() %>
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

                        </tr>

                    <% } %>

                    </tbody>

                </table>

            </div>

        <% } %>

    </div>

    <% } %>

</div>

</body>
</html>