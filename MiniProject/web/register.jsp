<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Donor Registration</title>

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

    <div class="form-card">

        <h2>Donor Registration</h2>

        <p class="form-description">
            Register yourself as a blood donor.
        </p>

        <form action="RegisterDonorServlet"
              method="post"
              onsubmit="return validateRegistration()">

            <label>Full Name</label>

            <input type="text"
                   id="name"
                   name="name"
                   placeholder="Enter your full name"
                   required>

            <label>Age</label>

            <input type="number"
                   id="age"
                   name="age"
                   min="18"
                   max="65"
                   placeholder="Enter your age"
                   required>

            <label>Gender</label>

            <select name="gender" required>

                <option value="">Select Gender</option>

                <option value="Male">Male</option>

                <option value="Female">Female</option>

                <option value="Other">Other</option>

            </select>

            <label>Blood Group</label>

            <select name="bloodGroup" required>

                <option value="">Select Blood Group</option>

                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>

            </select>

            <label>Phone Number</label>

            <input type="text"
                   id="phone"
                   name="phone"
                   maxlength="10"
                   placeholder="Enter 10 digit phone number"
                   required>

            <label>Email</label>

            <input type="email"
                   id="email"
                   name="email"
                   placeholder="Enter email address"
                   required>

            <label>Address</label>

            <textarea name="address"
                      placeholder="Enter your address"
                      required></textarea>

            <label>Password</label>

            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Create password"
                   required>

            <label>Confirm Password</label>

            <input type="password"
                   id="confirmPassword"
                   placeholder="Confirm password"
                   required>

            <button type="submit" class="btn full">
                Register
            </button>

        </form>

        <p class="bottom-text">
            Already registered?
            <a href="login.jsp">Login here</a>
        </p>

    </div>

</div>

<script src="js/script.js"></script>

</body>
</html>