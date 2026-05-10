<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
String from = request.getParameter("from");
if(from == null) from = "normal";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register – Rural Service Finder</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>

<body>

<div id="google_translate_element" style="margin-left:15px;"></div>

<div style="padding:15px 20px;">
    <a href="home.jsp" style="
        text-decoration:none;
        color:#2e7d32;
        font-weight:500;
        font-size:14px;
    ">
        ← Back to Home
    </a>
</div>

<div class="register-container">

    <div class="register-card">

        <h2>Create Account</h2>

        <p class="subtitle">
            Join Rural Service Finder as a provider or user
        </p>

        <!-- FORM START -->
        <form action="${pageContext.request.contextPath}/register"
              method="post"
              enctype="multipart/form-data">

            <!-- FLOW TRACKING (IMPORTANT) -->
            <input type="hidden" name="from" value="<%= from %>">

            <!-- NAME -->
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" placeholder="Enter your full name" required>
            </div>

            <!-- MOBILE -->
            <div class="form-group">
                <label>Mobile Number</label>
                <input type="text" name="mobile" placeholder="10-digit mobile number" required maxlength="10">
            </div>

            <!-- VILLAGE -->
            <div class="form-group">
                <label>Village / Town</label>
                <input type="text" name="village" placeholder="Enter your village name" required>
            </div>

            <!-- ROLE -->
            <div class="form-group">
                <label>Register As</label>
                <select name="role" id="role" required onchange="toggleService()">
                    <option value="">Select</option>
                    <option value="user">User</option>
                    <option value="provider">Service Provider</option>
                </select>
            </div>

            <!-- SERVICE -->
            <div class="form-group" id="serviceField" style="display:none;">
                <label>Service Type</label>
                <select name="service">
                    <option value="">Select your service</option>
                    <option value="Plumber">Plumber</option>
                    <option value="Electrician">Electrician</option>
                    <option value="Doctor">Doctor</option>
                    <option value="Carpenter">Carpenter</option>
                </select>
            </div>

            <!-- EXPERIENCE -->
            <div class="form-group" id="experienceField" style="display:none;">
                <label>Experience</label>
                <input type="text" name="experience" placeholder="Example: 5 years">
            </div>

            <!-- ABOUT -->
            <div class="form-group" id="aboutField" style="display:none;">
                <label>About Your Work</label>
                <textarea name="about" placeholder="Describe your services..." rows="4"></textarea>
            </div>

            <!-- IMAGE -->
            <div class="form-group" id="imageField" style="display:none;">
                <label>Profile Photo</label>
                <input type="file" name="image" accept="image/*">
            </div>

            <!-- PASSWORD -->
            <div class="form-group">
                <label>Password</label>

                <div style="position:relative;">
                    <input type="password" id="password" name="password"
                           placeholder="Enter password" required
                           style="width:100%; padding-right:40px;">

                    <span onclick="togglePassword()"
                          style="position:absolute; right:10px; top:50%; transform:translateY(-50%); cursor:pointer;">
                        👁️
                    </span>
                </div>
            </div>

            <!-- SUBMIT -->
            <button type="submit" class="btn-primary">
                Create Account →
            </button>

        </form>

        <p class="switch-link">
            Already have an account?
            <a href="login.jsp">Login here</a>
        </p>

    </div>

</div>

<!-- SERVICE TOGGLE -->
<script>
function toggleService() {

    var role = document.getElementById("role").value;

    var serviceField = document.getElementById("serviceField");
    var imageField = document.getElementById("imageField");
    var experienceField = document.getElementById("experienceField");
    var aboutField = document.getElementById("aboutField");

    if(role === "provider") {

        serviceField.style.display = "block";
        imageField.style.display = "block";
        experienceField.style.display = "block";
        aboutField.style.display = "block";

    } else {

        serviceField.style.display = "none";
        imageField.style.display = "none";
        experienceField.style.display = "none";
        aboutField.style.display = "none";
    }
}
</script>

<!-- PASSWORD TOGGLE -->
<script>
function togglePassword() {
    var pass = document.getElementById("password");
    pass.type = (pass.type === "password") ? "text" : "password";
}
</script>

</body>
</html>