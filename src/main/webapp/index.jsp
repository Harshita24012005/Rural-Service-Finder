<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>   <!-- ✅ MUST BE AT TOP -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rural Service Finder</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

</head>
<body>

<div class="container">

    <!-- Header -->
    <div class="header">
        <div class="logo">🌿 Rural Service Finder</div>
    </div>

    <!-- Search -->
    <form action="SearchServlet" method="post">
        <div class="search-box">
            <input type="text" name="service" placeholder="Search plumber, electrician...">
            <button type="submit">Search</button>
        </div>
    </form>

    <!-- Services -->
    <div class="services">
        <h2>Popular Services</h2>

        <div class="service-grid">
            <div class="service-card">
                <img src="https://img.icons8.com/color/96/plumbing.png"/>
                <p>Plumber</p>
            </div>

            <div class="service-card">
                <img src="https://img.icons8.com/color/96/electricity.png"/>
                <p>Electrician</p>
            </div>

            <div class="service-card">
                <img src="https://img.icons8.com/color/96/tractor.png"/>
                <p>Farmer Help</p>
            </div>

            <div class="service-card">
                <img src="https://img.icons8.com/color/96/cleaning.png"/>
                <p>Cleaner</p>
            </div>
        </div>
    </div>

    <!-- Static Providers -->
    <div class="providers">
        <h2>Nearby Providers</h2>

        <div class="provider-card">
            <img src="https://randomuser.me/api/portraits/men/32.jpg">
            <div class="provider-info">
                <h3>Ramesh Plumber</h3>
                <p>Raipur • ⭐ 4.5</p>
            </div>
        </div>
    </div>
<div class="providers">
    <h2>Search Results</h2>

<%
java.util.ArrayList list = (java.util.ArrayList) request.getAttribute("data");

if(list != null){

    if(list.size() > 0){

        for(Object o : list){

            String s = (String) o;
            String arr[] = s.split(",");
%>

    <div class="provider-card">
        <div class="provider-info">
            <h3><%= arr[0] %></h3>
            <p><%= arr[1] %> • ⭐ <%= arr[2] %></p>
        </div>
    </div>

<%
        }

    } else {
%>
        <h3>No results found ❌</h3>
<%
    }

} else {
%>
    <h3>Search something 🔍</h3>
<%
}
%>

</div> <!-- ✅ container closed properly -->

<!-- Navbar -->
<div class="navbar">
    <a href="#" class="active">Home</a>
    <a href="#">Services</a>
    <a href="#">Profile</a>
</div>

</body>
</html>