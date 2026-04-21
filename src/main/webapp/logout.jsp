<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    // destroy session
    session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logout – Rural Service Finder</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>

<body>

<!-- HEADER -->
<header>
    <a class="logo" href="<%= request.getContextPath() %>/home.jsp">
        <img src="<%= request.getContextPath() %>/images/logo.png" alt="RSF Logo">
        <div class="logo-text">RSF <span>Rural Service Finder</span></div>
    </a>

    <nav>
        <a href="<%= request.getContextPath() %>/home.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/about.jsp">About</a>
        <a href="<%= request.getContextPath() %>/service_list.jsp">Services</a>
        <a href="<%= request.getContextPath() %>/login.jsp" class="nav-login">Login Again</a>
    </nav>
</header>

<!-- HERO -->
<div class="page-hero">
    <h1>You have been logged out</h1>
    <p>Thank you for using Rural Service Finder</p>
</div>

<!-- CONTENT -->
<section class="services-section">

    <div class="service-grid">

        <!-- INFO CARD -->
        <div class="card">
            <div class="card-body" style="text-align:center;">
                <h3>Logout Successful</h3>
                <p>You have safely exited your session.</p>
                <p>Please login again to continue using services.</p>

                <br>

                <a href="<%= request.getContextPath() %>/login.jsp" 
                   style="
                        display:inline-block;
                        padding:10px 20px;
                        background:#2e7d32;
                        color:white;
                        border-radius:8px;
                        text-decoration:none;
                   ">
                    Go to Login
                </a>
            </div>
        </div>

    </div>

</section>

<!-- FOOTER -->
<footer>
    &copy; 2025 <strong>Rural Service Finder</strong> — All Rights Reserved
</footer>

</body>
</html>