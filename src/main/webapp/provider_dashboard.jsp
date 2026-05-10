<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String error = request.getParameter("error");
    if ("wrongpass".equals(error)) {
%>

<div style="
    background:#ffebee;
    color:#c62828;
    padding:10px;
    border-radius:8px;
    text-align:center;
    margin-bottom:15px;
">
    Incorrect password ❌ Try again
</div>

<%
    }

    String user = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role");

    if (user == null || role == null || !"provider".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    String service = (String) session.getAttribute("service");
    String mobile = (String) session.getAttribute("mobile");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Provider Dashboard</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
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
    <a class="logo" href="provider_dashboard.jsp">
        <img src="<%= request.getContextPath() %>/images/logo.png">
        <div class="logo-text">RSF <span>Provider Dashboard</span></div>
    </a>

    <nav>
        <a href="<%= request.getContextPath() %>/home.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/service_list.jsp">Services</a>
        <a href="<%= request.getContextPath() %>/logout.jsp" class="nav-login">Logout</a>
        <div id="google_translate_element" style="margin-left:15px;"></div>
    </nav>
</header>

<!-- HERO -->
<div class="page-hero">
    <h1>Welcome, <%= user %></h1>
    <p>Manage your service profile and grow your business</p>
</div>

<!-- DASHBOARD CONTENT -->
<section class="services-section">

    <div class="service-grid">

        <!-- PROFILE CARD -->
        <div class="card">
            <div class="card-body">
                <h3>Your Profile</h3>
                <p><b>Name:</b> <%= user %></p>
                <p><b>Mobile:</b> <%= mobile %></p>
                <p><b>Service:</b> <%= service %></p>
                <p><b>Status:</b> Active Provider</p>

                <br>

                <!-- EDIT PROFILE BUTTON -->
                <a href="editProvider.jsp"
                   style="
                      display:inline-block;
                      padding:10px 18px;
                      background:#1565c0;
                      color:white;
                      text-decoration:none;
                      border-radius:8px;
                   ">
                   Edit My Details ✏️
                </a>
            </div>
        </div>

        <!-- STATS CARD -->
        <div class="card">
            <div class="card-body">
                <h3>Quick Stats</h3>
                <p>👁 Profile Views: 120</p>
                <p>📞 Calls Received: 15</p>
                <p>📍 Village Reach: High</p>
                <p>⭐ Rating: 4.5/5</p>
            </div>
        </div>

        <!-- EARNINGS CARD -->
        <div class="card">
            <div class="card-body">
                <h3>Earnings</h3>
                <p>💰 This Month: ₹5,000</p>
                <p>💰 Last Month: ₹4,200</p>
                <p>📈 Growth: +18%</p>
            </div>
        </div>

        <!-- DELETE ACCOUNT CARD -->
        <div class="card">
            <div class="card-body">
                <h3>Delete Account</h3>

                <form action="deleteAccount" method="post">

                    <div class="form-group">
                        <label>Confirm Password</label>
                        <input type="password" name="password"
                               placeholder="Enter password to delete account"
                               required>
                    </div>

                    <button style="
                        margin-top:15px;
                        background:#c62828;
                        color:white;
                        padding:10px 20px;
                        border:none;
                        border-radius:8px;
                        cursor:pointer;
                    ">
                        Delete My Account ❌
                    </button>

                </form>
            </div>
        </div>

    </div>

</section>

<!-- FOOTER -->
<footer>
    &copy; 2025 <strong>Rural Service Finder</strong> — Provider Panel
</footer>

</body>
</html>