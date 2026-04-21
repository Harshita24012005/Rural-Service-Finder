<%@ page import="java.util.*" %>
<%@ page import="controller.Provider" %>
<%
    String user = (String) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Providers</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<!-- NAVBAR -->
<header>

    <a class="logo" href="home.jsp">
        <img src="<%= request.getContextPath() %>/images/logo.png">
        <div class="logo-text">RSF <span>Helping Hands Near You</span></div>
    </a>

    <nav>
        <a href="service_list.jsp" class="active">← Back</a>
    </nav>

</header>

<!-- HERO -->
<div class="page-hero">
    <h1>Available Providers</h1>
    <p>Find trusted professionals in your village</p>
</div>

<!-- MAIN SECTION -->
<div class="providers-section">

<%
    List<Provider> list = (List<Provider>) request.getAttribute("providers");

    if (list == null || list.isEmpty()) {
%>

    <p class="sub">No providers found for your search</p>

<%
    } else {
%>

<table class="provider-table">

    <thead>
        <tr>
            <th>Name</th>
            <th>Village</th>
            <th>Service</th>
            <th>Mobile</th>
            <th>Action</th>
        </tr>
    </thead>

    <tbody>

<%
    for (Provider p : list) {
%>

        <tr>
            <td class="name-cell"><%= p.getName() %></td>
            <td><%= p.getVillage() %></td>

            <td>
                <span class="service-badge">
                    <%= p.getService() %>
                </span>
            </td>

            <td><%= p.getMobile() %></td>

            <td>

                <!-- CALL BUTTON -->
                <a href="tel:<%= p.getMobile() %>" 
                   style="
                       display:inline-block;
                       padding:6px 12px;
                       background:#2e7d32;
                       color:white;
                       border-radius:6px;
                       text-decoration:none;
                       font-size:13px;
                       margin-right:6px;
                   ">
                   Call
                </a>

                <!-- WHATSAPP BUTTON -->
                <a href="https://wa.me/91<%= p.getMobile() %>?text=Hello%20I%20found%20you%20on%20Rural%20Service%20Finder" 
                   target="_blank"
                   style="
                       display:inline-block;
                       padding:6px 12px;
                       background:#25D366;
                       color:white;
                       border-radius:6px;
                       text-decoration:none;
                       font-size:13px;
                   ">
                   WhatsApp
                </a>

            </td>
        </tr>

<%
    }
%>

    </tbody>

</table>

<%
    }
%>

</div>

<!-- FOOTER -->
<footer>
    &copy; 2025 <strong>Rural Service Finder</strong> — Empowering Rural Communities
</footer>

</body>
</html>