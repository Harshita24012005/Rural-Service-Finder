<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rural Service Finder – Helping Hands Near You</title>
   <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({
    pageLanguage: 'en',
    includedLanguages: 'hi,en',
    layout: google.translate.TranslateElement.InlineLayout.SIMPLE
  }, 'google_translate_element');
}
</script>

<script type="text/javascript" 
src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
</script>
<body>
<%
    String deleted = request.getParameter("deleted");
    if (deleted != null) {
%>

<div style="
    background:#ffebee;
    color:#c62828;
    padding:12px;
    border-radius:10px;
    text-align:center;
    margin:15px;
">
    Your account has been deleted successfully ❌
</div>

<%
    }
%>

<header>
    <a class="logo" href="home.jsp">
        <img src="<%= request.getContextPath() %>/images/logo.png" alt="RSF Logo">
        <div class="logo-text">RSF <span>Helping Hands Near You</span></div>
    </a>
   
    <nav>
        <a href="home.jsp" class="active">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="service_list.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
        <a href="register.jsp">Register</a>
        <a href="login.jsp" class="nav-login">Login</a>
        <div id="google_translate_element" style="margin-left:15px;"></div>
    </nav>
</header>

<div class="home-bg">
    <div class="overlay">
        <span class="eyebrow">Serving Rural India</span>
        <h1>Find Trusted Local<br><em>Service Providers</em></h1>
        <p>Connecting villages with skilled plumbers, electricians, doctors &amp; more — right at your doorstep.</p>
        <div class="cta-group">
            <a href="service_list.jsp" class="cta-btn">Explore Services</a>
            <a href="register.jsp" class="cta-btn-outline">Join as Provider</a>
        </div>
    </div>
</div>

<div class="stats-strip">
    <div class="stat-item">
        <div class="num">50+</div>
        <div class="label">Service Providers</div>
    </div>
    <div class="stat-item">
        <div class="num">20+</div>
        <div class="label">Villages Covered</div>
    </div>
    <div class="stat-item">
        <div class="num">4</div>
        <div class="label">Service Categories</div>
    </div>
    <div class="stat-item">
        <div class="num">10+</div>
        <div class="label">Happy Families</div>
    </div>
</div>
<style>
.logo img {
    width: 60px;
}
</style>

<footer>
    &copy; 2025 <strong>Rural Service Finder</strong> &mdash; Empowering Rural Communities
</footer>

</body>
</html>
