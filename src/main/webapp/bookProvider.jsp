<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    // URL se provider id lo
    String id = request.getParameter("id");

    // Agar Book Now se aaye ho, to session me save karo
    if(id != null){
        session.setAttribute("providerId", id);
    }

    String user = (String) session.getAttribute("user");
    String providerId = (String) session.getAttribute("providerId");

    // Agar login nahi hai to login page
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Booking confirm hone ke baad providerId hata do
    session.removeAttribute("providerId");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmed – Rural Service Finder</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<!-- HEADER -->
<header>
    <a class="logo" href="home.jsp">
        <img src="<%= request.getContextPath() %>/images/logo.png">
        <div class="logo-text">
            RSF
            <span>Helping Hands Near You</span>
        </div>
    </a>

    <nav>
        <a href="home.jsp">Home</a>
        <a href="service_list.jsp">Services</a>
    </nav>
</header>

<!-- HERO -->
<div class="page-hero">
    <h1>Booking Confirmed ✅</h1>
    <p>Your provider has been booked successfully.</p>
</div>

<!-- MAIN -->
<div class="details-container">
    <div class="details-card" style="text-align:center;">

        <h2 style="margin-bottom:15px; color:#2e7d32;">
            Thank You for Booking
        </h2>

        <p style="font-size:16px; color:#444; margin-bottom:10px;">
            Your request has been sent successfully.
        </p>

        <p style="margin:20px 0;">
            Provider ID: <strong><%= providerId %></strong>
        </p>

        <a href="service_list.jsp" class="call-btn">
            Back to Services
        </a>

    </div>
</div>

<!-- FOOTER -->
<footer>
    &copy; 2025 <strong>Rural Service Finder</strong>
</footer>

</body>
</html>