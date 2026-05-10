<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login – Rural Service Finder</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>

<body>
<%
    // URL se data nikalna taaki hidden fields mein daal sakein
    String redirect = request.getParameter("redirect");
    String price = request.getParameter("price");
    String providerId = request.getParameter("providerId");
%>

<div style="padding:15px 20px;">
    <a href="home.jsp" style="text-decoration:none; color:#2e7d32; font-weight:500; font-size:14px;">
        ← Back to Home
    </a>
</div>

<div class="auth-container">
    <div class="auth-card">

        <!-- LOGO -->
        <div class="auth-logo">
            <div class="icon">🌿</div>
        </div>

        <h2>Welcome Back</h2>
        <p class="subtitle">Login to access Rural Service Finder</p>

        <!-- SUCCESS & ERROR MESSAGES (Mene Clean kar diye hain) -->
        <% if (request.getParameter("success") != null) { %>
            <div style="background:#e8f5e9; color:#2e7d32; padding:10px; border-radius:8px; text-align:center; margin-bottom:15px;">
                Registration successful ✅ Please login
            </div>
        <% } %>

        <% if (request.getParameter("deleted") != null) { %>
            <div style="background:#ffebee; color:#c62828; padding:10px; border-radius:8px; text-align:center; margin-bottom:15px;">
                Account deleted successfully ❌
            </div>
        <% } %>

        <% if (request.getParameter("error") != null) { %>
            <div style="background:#ffebee; color:#c62828; padding:10px; border-radius:8px; text-align:center; margin-bottom:15px;">
                Invalid mobile number or password ❌
            </div>
        <% } %>
        
        <!-- LOGIN FORM -->
        <form action="login" method="post">
            <!-- YE TEEN HIDDEN FIELDS DATA KO SERVLET TAK LE JAYENGE -->
            <input type="hidden" name="redirect" value="<%= (redirect != null) ? redirect : "" %>">
            <input type="hidden" name="price" value="<%= (price != null) ? price : "" %>">
            <input type="hidden" name="providerId" value="<%= (providerId != null) ? providerId : "" %>">

            <div class="form-group">
                <label>Mobile Number</label>
                <input type="text" name="mobile" placeholder="Enter 10-digit mobile number" required maxlength="10">
            </div>

            <div class="form-group">
                <label>Password</label>
                <div style="position:relative;">
                    <input type="password" id="password" name="password" placeholder="Enter password" required style="width:100%; padding-right:40px;">
                    <span onclick="togglePassword()" style="position:absolute; right:10px; top:50%; transform:translateY(-50%); cursor:pointer;">
                        👁️
                    </span>
                </div>
            </div>

            <button type="submit" class="btn-primary">Login →</button>
        </form>

        <p class="switch-link">
            New user? <a href="register.jsp">Create an account</a>
        </p>

    </div>
</div>

<script>
function togglePassword(){
    var pass = document.getElementById("password");
    pass.type = (pass.type === "password") ? "text" : "password";
}
</script>

</body>
</html>