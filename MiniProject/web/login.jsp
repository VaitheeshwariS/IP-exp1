<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Donor Login</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

<header class="navbar">

    <div class="logo">
         Blood Donor
    </div>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="register.jsp">Register</a>
        <a href="search.jsp">Find Blood</a>
        <a href="login.jsp">Login</a>
    </nav>

</header>

<div class="form-container">

    <div class="form-card login-card">

        <h2>Donor Login</h2>

        <p class="form-description">
            Login to access your donor dashboard.
        </p>

        <% if (request.getParameter("message") != null) { %>

            <div class="success-message">
                <%= request.getParameter("message") %>
            </div>

        <% } %>

        <% if (request.getParameter("error") != null) { %>

            <div class="error-message">
                <%= request.getParameter("error") %>
            </div>

        <% } %>

        <form action="LoginServlet" method="post">

            <label>Email</label>

            <input type="email"
                   name="email"
                   placeholder="Enter email"
                   required>

            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Enter password"
                   required>

            <button type="submit" class="btn full">
                Login
            </button>

        </form>

        <p class="bottom-text">

            New donor?

            <a href="register.jsp">
                Register Now
            </a>

        </p>

    </div>

</div>

</body>
</html>