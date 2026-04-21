<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    ResultSet rs = (ResultSet) request.getAttribute("providers");
    String service = request.getParameter("service");
    String village = request.getParameter("village");
    if (service == null) service = "";
    if (village == null) village = "";
    String serviceLabel = service.substring(0, 1).toUpperCase() + service.substring(1);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Providers – Rural Service Finder</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<header>
    <a class="logo" href="home.jsp">
        <img src="<%= request.getContextPath() %>/images/logo.png" alt="RSF Logo">
        <div class="logo-text">RSF <span>Helping Hands Near You</span></div>
    </a>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="service_list.jsp" class="active">Services</a>
        <a href="contact.jsp">Contact</a>
        <a href="register.jsp">Register</a>
        <a href="login.jsp" class="nav-login">Login</a>
    </nav>
</header>

<div class="page-hero">
    <h1><%= serviceLabel %> Providers</h1>
    <p>Available providers in <strong style="color:#a5d6a7;"><%= village %></strong></p>
</div>

<section class="providers-section">

    <% if (rs == null) { %>
    <div style="text-align:center; padding:60px 0; color:#777;">
        <p style="font-size:16px;">No providers found for <strong><%= serviceLabel %></strong> in <strong><%= village %></strong>.</p>
        <p style="margin-top:8px; font-size:14px;">Try searching a nearby village or a different service.</p>
    </div>
    <% } else { %>
    <table class="provider-table">
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Mobile</th>
                <th>Service</th>
                <th>Village</th>
            </tr>
        </thead>
        <tbody>
        <%
            int count = 1;
            while (rs != null && rs.next()) {
        %>
            <tr>
                <td style="color:#aaa; font-size:13px;"><%= count++ %></td>
                <td class="name-cell"><%= rs.getString("name") %></td>
                <td><a href="tel:<%= rs.getString("mobile") %>" style="color:#2e7d32; text-decoration:none; font-weight:500;"><%= rs.getString("mobile") %></a></td>
                <td><span class="service-badge"><%= rs.getString("service_type") %></span></td>
                <td><%= rs.getString("village") %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <% } %>

    <a href="service_list.jsp" class="back-link">← Back to Services</a>

</section>

<footer>
    &copy; 2025 <strong>Rural Service Finder</strong> &mdash; Empowering Rural Communities
</footer>

</body>
</html>
