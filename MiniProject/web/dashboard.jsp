<%@ page import="model.Donor" %>

<%
    Donor donor = (Donor) session.getAttribute("donor");

    if (donor == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Donor Dashboard</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

<header class="navbar">

    <div class="logo">
         Blood Donor
    </div>

    <nav>

        <a href="index.jsp">Home</a>

        <a href="search.jsp">
            Find Blood
        </a>

        <a href="update.jsp">
            Update Profile
        </a>

        <a href="LogoutServlet">
            Logout
        </a>

    </nav>

</header>

<div class="dashboard">

    <h1>
        Welcome, <%= donor.getName() %>!
    </h1>

    <% if (request.getParameter("message") != null) { %>

        <div class="success-message">
            <%= request.getParameter("message") %>
        </div>

    <% } %>

    <div class="profile-card">

        <h2>My Donor Profile</h2>

        <div class="profile-grid">

            <div>
                <strong>Name</strong>
                <p><%= donor.getName() %></p>
            </div>

            <div>
                <strong>Age</strong>
                <p><%= donor.getAge() %></p>
            </div>

            <div>
                <strong>Gender</strong>
                <p><%= donor.getGender() %></p>
            </div>

            <div>
                <strong>Blood Group</strong>
                <p class="blood">
                    <%= donor.getBloodGroup() %>
                </p>
            </div>

            <div>
                <strong>Phone</strong>
                <p><%= donor.getPhone() %></p>
            </div>

            <div>
                <strong>Email</strong>
                <p><%= donor.getEmail() %></p>
            </div>

            <div class="full-profile">
                <strong>Address</strong>
                <p><%= donor.getAddress() %></p>
            </div>

        </div>

        <a href="update.jsp" class="btn">
            Update Profile
        </a>

    </div>

</div>

</body>
</html>