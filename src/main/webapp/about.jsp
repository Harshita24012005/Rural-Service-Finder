<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us – Rural Service Finder</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
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

<header>
    <a class="logo" href="home.jsp">
        <img src="<%= request.getContextPath() %>/images/logo.png" alt="RSF Logo">
        <div class="logo-text">RSF <span>Helping Hands Near You</span></div>
    </a>
    
    <nav>
        <a href="home.jsp">Home</a>
        <a href="about.jsp" class="active">About Us</a>
        <a href="service_list.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
        <a href="register.jsp">Register</a>
        <div id="google_translate_element" style="margin-left:15px;"></div>
    </nav>
</header>

<div class="page-hero">
    <h1>About Rural Service Finder</h1>
    <p>Bridging the gap between rural communities and skilled local professionals.</p>
</div>

<section class="about-section">

    <div class="about-wrapper">

        <!-- LEFT — IMAGE GRID -->
        <div class="about-images">
            <div class="img-box">
                <img src="<%= request.getContextPath() %>/images/plumber.jpg" alt="Plumber">
                <span>Plumber</span>
            </div>
            <div class="img-box">
                <img src="<%= request.getContextPath() %>/images/electrician.jpg" alt="Electrician">
                <span>Electrician</span>
            </div>
            <div class="img-box">
                <img src="<%= request.getContextPath() %>/images/doctor.jpg" alt="Doctor">
                <span>Doctor</span>
            </div>
            <div class="img-box">
                <img src="<%= request.getContextPath() %>/images/carpenter.jpg" alt="Carpenter">
                <span>Carpenter</span>
            </div>
        </div>

        <!-- RIGHT — CONTENT -->
        <div class="about-content">

            <h2>Empowering Villages with Accessible Services</h2>

            <p>
                Rural Service Finder was built to solve a real problem faced by millions of villagers —
                difficulty finding trusted local service providers. Whether it's a burst pipe, an electrical
                fault, or a health concern, we connect you with verified professionals in your area quickly
                and easily.
            </p>

            <div class="about-cards">
                <div class="box">
                    <h3>Our Vision</h3>
                    <p>Every village deserves easy access to essential skilled services, anytime.</p>
                </div>
                <div class="box">
                    <h3>Our Team</h3>
                    <p>A passionate group of students working to support rural communities across India.</p>
                </div>
                <div class="box">
                    <h3>Our Mission</h3>
                    <p>Quick, reliable &amp; affordable service solutions for every household.</p>
                </div>
                <div class="box">
                    <h3>Join Us</h3>
                    <p>Register as a provider and reach hundreds of customers in your area.</p>
                </div>
            </div>

            <div class="owner-info">
                <h3>Project Developer</h3>
                <p><strong>Name:</strong> Isha Khan And Harshita Sohner</p>
                <p><strong>Email:</strong> <a href="mailto:ishafatima476@gmail.com">ishafatima476@gmail.com</a></p>
                <p><strong>Email:</strong> <a href="mailto:harshitasohner@gmail.com">harshitasohner@gmail.com</a></p>
            </div>

        </div>
    </div>

</section>
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
