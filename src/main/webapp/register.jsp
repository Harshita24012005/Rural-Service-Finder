<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
        <p class="subtitle">Join Rural Service Finder as a provider or user</p>
<form action="${pageContext.request.contextPath}/register" method="post">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label>Mobile Number</label>
                <input type="text" name="mobile" placeholder="10-digit mobile number" required maxlength="10">
            </div>

            <div class="form-group">
                <label>Village / Town</label>
                <input type="text" name="village" placeholder="Enter your village name" required>
            </div>
     <div class="form-group">
    <label>Register As</label>
   <select name="role" id="role" required onchange="toggleService()">
    <option value="">Select</option>
    <option value="user">User</option>
    <option value="provider">Service Provider</option>
</select>
</div>
   <div class="form-group" id="serviceField" style="display: none;">
    <label>Service Type</label>
    <select name="service">
        <option value="">Select your service</option>
        <option value="Plumber">Plumber</option>
        <option value="Electrician">Electrician</option>
        <option value="Doctor">Doctor</option>
        <option value="Carpenter">Carpenter</option>
    </select>
</div>

            <div class="form-group">
                <label>Password</label>
                <div style="position:relative;">
    <input type="password" id="password" name="password" placeholder="Enter password" required style="width:100%; padding-right:40px;">

    <span onclick="togglePassword()" 
          style="
            position:absolute;
            right:10px;
            top:50%;
            transform:translateY(-50%);
            cursor:pointer;
          ">
        👁️
    </span>
</div>
            </div>

            <button type="submit" class="btn-primary">Create Account →</button>
        </form>

        <p class="switch-link">Already have an account? <a href="login.jsp">Login here</a></p>

    </div>
</div>
<script id="8t1yxz">
function toggleService() {
    var role = document.getElementById("role").value;
    var serviceField = document.getElementById("serviceField");

    if (role === "provider") {
        serviceField.style.display = "block";
    } else {
        serviceField.style.display = "none";
    }
}
</script>
<script>
function togglePassword(){
    var pass = document.getElementById("password");

    if(pass.type === "password"){
        pass.type = "text";
    } else {
        pass.type = "password";
    }
}
</script>

</body>
</html>
