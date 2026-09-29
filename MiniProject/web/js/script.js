function validateRegistration() {

    let name =
        document.getElementById("name").value.trim();

    let age =
        document.getElementById("age").value;

    let phone =
        document.getElementById("phone").value.trim();

    let email =
        document.getElementById("email").value.trim();

    let password =
        document.getElementById("password").value;

    let confirmPassword =
        document.getElementById("confirmPassword").value;


    if (name.length < 3) {

        alert("Please enter a valid name.");

        return false;
    }


    if (age < 18 || age > 65) {

        alert("Age must be between 18 and 65.");

        return false;
    }


    let phonePattern = /^[0-9]{10}$/;

    if (!phonePattern.test(phone)) {

        alert("Please enter a valid 10 digit phone number.");

        return false;
    }


    let emailPattern =
        /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailPattern.test(email)) {

        alert("Please enter a valid email address.");

        return false;
    }


    if (password.length < 4) {

        alert("Password must contain at least 4 characters.");

        return false;
    }


    if (password !== confirmPassword) {

        alert("Passwords do not match.");

        return false;
    }


    return true;
}


function confirmDelete() {

    return confirm(
        "Are you sure you want to delete this donor?"
    );
}