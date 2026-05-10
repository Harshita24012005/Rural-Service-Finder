<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us – Rural Service Finder</title>

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

<!-- HEADER -->
<header>
    <a class="logo" href="home.jsp">
        <img src="<%= request.getContextPath() %>/images/logo.png" alt="RSF Logo">
        <div class="logo-text">RSF <span>Helping Hands Near You</span></div>
    </a>
   

    <nav>
        <a href="home.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="service_list.jsp">Services</a>
        <a href="contact.jsp" class="active">Contact</a>
        <a href="register.jsp">Register</a>
        <div id="google_translate_element" style="margin-left:15px;"></div>
    </nav>
</header>

<!-- HERO -->
<div class="page-hero">
    <h1>Contact Us</h1>
    <p>Have a question or suggestion? We'd love to hear from you.</p>
</div>

<!-- CONTACT SECTION -->
<section class="contact-section">

    <!-- FORM -->
    <div class="contact-form-box">
        <h2>Send a Message</h2>
        <p class="subtitle">Fill in the form below and we'll get back to you shortly.</p>

        <% if (request.getParameter("sent") != null) { %>
        <div style="background:#f0faf0; color:#2e7d32; padding:12px; border-radius:8px; margin-bottom:15px;">
            ✓ Message sent successfully!
        </div>
        <% } %>

        <!-- ✅ FORM -->
        <form onsubmit="sendMail(event)">

            <div class="form-group">
                <label>Your Name</label>
                <input type="text" id="name" placeholder="Enter your name" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" id="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label>Message</label>
                <textarea id="message" placeholder="Write your message..." required></textarea>
            </div>

            <button type="submit" class="btn-primary">Send Message →</button>
        </form>
    </div>

    <!-- INFO -->
    <div class="contact-info-box">
        <h3>Get in Touch</h3>

        <div class="info-card">
            <div class="info-label">Developer</div>
            <div class="info-value">Harshita Sohner & Isha Khan</div>
        </div>

        <div class="info-card">
            <div class="info-label">Email</div>
            <div class="info-value">harshitasohner@gmail.com</div>
            <div class="info-value">ishafatima476@gmail.com</div>
        </div>

        <div class="info-card">
            <div class="info-label">Response Time</div>
            <div class="info-value">Within 24 hours</div>
        </div>
    </div>

</section>

<!-- FOOTER -->
<footer>
    &copy; 2025 <strong>Rural Service Finder</strong>
</footer>

<!-- ✅ EMAILJS SCRIPT (IMPORTANT) -->
<script src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>

<script>
(function(){
  emailjs.init("_58V-0We2WgZzfWrM"); // 🔥 replace this
})();

function sendMail(e){
  e.preventDefault();

  emailjs.send("service_c2iawvd", "template_ike4k7x", {
    name: document.getElementById("name").value,
    email: document.getElementById("email").value,
    message: document.getElementById("message").value
  }).then(function(response) {

     // ✅ redirect to show success message
     window.location.href = "contact.jsp?sent=1";

  }, function(error) {
     alert("Failed to send ❌");
  });
}
</script>

</body>
</html>