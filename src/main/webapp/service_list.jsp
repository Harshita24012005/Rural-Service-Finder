<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String user = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role");

    if (user == null || role == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services – Rural Service Finder</title>
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
        <a href="about.jsp">About Us</a>
        <a href="service_list.jsp" class="active">Services</a>
        <a href="contact.jsp">Contact</a>
        <a href="register.jsp">Register</a>
        <a href="login.jsp" class="nav-login">Login</a>
        <div id="google_translate_element" style="margin-left:15px;"></div>
    </nav>
</header>

<div class="page-hero">
    <h1>Our Services</h1>
    <p>Find skilled professionals in your village — enter your location to get started.</p>
</div>

<section class="services-section">
    <div class="service-grid">

        <!-- PLUMBER -->
        <div class="card">
            <div class="card-img-wrap">
                <img src="<%= request.getContextPath() %>/images/plumber.jpg" alt="Plumber">
                <span class="badge">Available</span>
            </div>
            <div class="card-body">
                <h3>Plumbers</h3>
                <p>Water pipe repair, tap fixing &amp; drainage solutions</p>
                <form action="SearchProviderServlet" method="get"> ✅
                    <input type="hidden" name="service" value="plumber">
                    <div class="input-row">
                        <input type="text" name="village" placeholder="Enter village name" required>
                        <button type="submit">Find</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- ELECTRICIAN -->
        <div class="card">
            <div class="card-img-wrap">
                <img src="<%= request.getContextPath() %>/images/electrician.jpg" alt="Electrician">
                <span class="badge">Available</span>
            </div>
            <div class="card-body">
                <h3>Electricians</h3>
                <p>Wiring, meter issues &amp; electrical faults repaired fast</p>
                <form action="SearchProviderServlet" method="get"> ✅
                    <input type="hidden" name="service" value="electrician">
                    <div class="input-row">
                        <input type="text" name="village" placeholder="Enter village name" required>
                        <button type="submit">Find</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- DOCTOR -->
        <div class="card">
            <div class="card-img-wrap">
                <img src="<%= request.getContextPath() %>/images/doctor.jpg" alt="Doctor">
                <span class="badge">Available</span>
            </div>
            <div class="card-body">
                <h3>Doctors</h3>
                <p>General physicians &amp; health consultations nearby</p>
               <form action="SearchProviderServlet" method="get"> ✅
                    <input type="hidden" name="service" value="doctor">
                    <div class="input-row">
                        <input type="text" name="village" placeholder="Enter village name" required>
                        <button type="submit">Find</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- CARPENTER -->
        <div class="card">
            <div class="card-img-wrap">
                <img src="<%= request.getContextPath() %>/images/carpenter.jpg" alt="Carpenter">
                <span class="badge">Available</span>
            </div>
            <div class="card-body">
                <h3>Carpenters</h3>
                <p>Furniture making, door &amp; window repair at your home</p>
                <form action="SearchProviderServlet" method="get"> ✅
                    <input type="hidden" name="service" value="carpenter">
                    <div class="input-row">
                        <input type="text" name="village" placeholder="Enter village name" required>
                        <button type="submit">Find</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</section>

<footer>
    &copy; 2025 <strong>Rural Service Finder</strong> &mdash; Empowering Rural Communities
</footer>

</body>
</html>
