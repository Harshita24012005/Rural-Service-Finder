<%@ page import="java.util.*" %>
<%@ page import="controller.Provider" %>

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
            <th>Photo</th>
            <th>Name</th>
            <th>Village</th>
            <th>Service</th>
            <th>Experience</th>
            <th>Mobile</th>
            <th>Action</th>
        </tr>
    </thead>

    <tbody>

<%
    for (Provider p : list) {
%>

        <tr>

            <!-- IMAGE -->
            <td>
                <img src="<%= request.getContextPath() %>/uploads/<%= p.getImage() %>"
                     class="provider-photo">
            </td>

            <!-- NAME -->
            <td class="name-cell">
                <%= p.getName() %>
            </td>

            <!-- VILLAGE -->
            <td>
                <%= p.getVillage() %>
            </td>

            <!-- SERVICE -->
            <td>
                <span class="service-badge">
                    <%= p.getService() %>
                </span>
            </td>

            <!-- EXPERIENCE -->
            <td>
                <%= p.getExperience() %>
            </td>

            <!-- MOBILE -->
            <td>
                <%= p.getMobile() %>
            </td>

            <!-- ACTION -->
            <!-- ACTION -->
<td style="white-space: nowrap;">


    <!-- VIEW DETAILS -->
    <a href="provider_details.jsp?id=<%= p.getId() %>"
       style="
           display:inline-block;
           padding:8px 14px;
           background:#1565c0;
           color:white;
           border-radius:6px;
           text-decoration:none;
           font-size:13px;
       ">
       View Details
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