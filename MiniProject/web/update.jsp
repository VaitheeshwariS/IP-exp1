<%@ page import="model.Donor" %>
<%@ page import="dao.DonorDAO" %>

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

    <title>Update Profile</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

<header class="navbar">

    <div class="logo">
         Blood Donor
    </div>

    <nav>

        <a href="dashboard.jsp">
            Dashboard
        </a>

        <a href="search.jsp">
            Find Blood
        </a>

        <a href="LogoutServlet">
            Logout
        </a>

    </nav>

</header>

<div class="form-container">

    <div class="form-card">

        <h2>Update Profile</h2>

        <form action="UpdateDonorServlet"
              method="post">

            <input type="hidden"
                   name="id"
                   value="<%= donor.getId() %>">

            <label>Full Name</label>

            <input type="text"
                   name="name"
                   value="<%= donor.getName() %>"
                   required>

            <label>Age</label>

            <input type="number"
                   name="age"
                   value="<%= donor.getAge() %>"
                   min="18"
                   max="65"
                   required>

            <label>Gender</label>

            <select name="gender" required>

                <option value="Male"
                    <%= "Male".equals(donor.getGender())
                    ? "selected" : "" %>>
                    Male
                </option>

                <option value="Female"
                    <%= "Female".equals(donor.getGender())
                    ? "selected" : "" %>>
                    Female
                </option>

                <option value="Other"
                    <%= "Other".equals(donor.getGender())
                    ? "selected" : "" %>>
                    Other
                </option>

            </select>

            <label>Blood Group</label>

            <select name="bloodGroup" required>

                <option value="A+"
                    <%= "A+".equals(donor.getBloodGroup())
                    ? "selected" : "" %>>
                    A+
                </option>

                <option value="A-"
                    <%= "A-".equals(donor.getBloodGroup())
                    ? "selected" : "" %>>
                    A-
                </option>

                <option value="B+"
                    <%= "B+".equals(donor.getBloodGroup())
                    ? "selected" : "" %>>
                    B+
                </option>

                <option value="B-"
                    <%= "B-".equals(donor.getBloodGroup())
                    ? "selected" : "" %>>
                    B-
                </option>

                <option value="AB+"
                    <%= "AB+".equals(donor.getBloodGroup())
                    ? "selected" : "" %>>
                    AB+
                </option>

                <option value="AB-"
                    <%= "AB-".equals(donor.getBloodGroup())
                    ? "selected" : "" %>>
                    AB-
                </option>

                <option value="O+"
                    <%= "O+".equals(donor.getBloodGroup())
                    ? "selected" : "" %>>
                    O+
                </option>

                <option value="O-"
                    <%= "O-".equals(donor.getBloodGroup())
                    ? "selected" : "" %>>
                    O-
                </option>

            </select>

            <label>Phone</label>

            <input type="text"
                   name="phone"
                   value="<%= donor.getPhone() %>"
                   required>

            <label>Email</label>

            <input type="email"
                   name="email"
                   value="<%= donor.getEmail() %>"
                   required>

            <label>Address</label>

            <textarea name="address"
                      required><%= donor.getAddress() %></textarea>

            <button type="submit"
                    class="btn full">
                Update Profile
            </button>

        </form>

    </div>

</div>

</body>
</html>