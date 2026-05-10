<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Optional" %>
<%
    // 1. Session start karein
    HttpSession session1 = request.getSession(true);

    // 2. URL se data lene ki koshish karein
    String urlPrice = request.getParameter("price");
    String urlProviderId = request.getParameter("providerId");

    // 3. AGAR URL mein data hai, toh use Session mein save kar lein (Tijori mein rakh dein)
    if (urlPrice != null && !urlPrice.trim().isEmpty() && !urlPrice.equals("0")) {
        session1.setAttribute("savedPrice", urlPrice);
    }
    if (urlProviderId != null && !urlProviderId.trim().isEmpty()) {
        session1.setAttribute("savedProviderId", urlProviderId);
    }

    // 4. Login Check: Agar user login nahi hai, toh login page par bhej dein
    if (session1.getAttribute("user") == null) {
        // Redirect karte waqt humara data ab Session mein surakshit hai
        response.sendRedirect("login.jsp");
        return;
    }

    // 5. Final Display ke liye data Session se uthayein (URL se nahi)
    String cleanPrice = (session1.getAttribute("savedPrice") != null) 
                        ? session1.getAttribute("savedPrice").toString() 
                        : "0";
    String providerId = (session1.getAttribute("savedProviderId") != null) 
                        ? session1.getAttribute("savedProviderId").toString() 
                        : "0";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Booking | Village Services</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --green-dark: #1a4731; --green-main: #2e7d32; --green-mid: #4caf50;
            --green-pale: #e8f5e9; --cream: #faf8f3; --white: #ffffff;
            --text-dark: #1c1c1c; --shadow-md: 0 8px 24px rgba(0,0,0,0.12);
            --radius-lg: 20px; --transition: all 0.3s ease;
        }
        body { font-family: 'DM Sans', sans-serif; background: var(--cream); margin: 0; color: var(--text-dark); }
        
        header { 
            display: flex; justify-content: space-between; align-items: center; 
            padding: 0 48px; height: 70px; background: var(--green-dark); 
            box-shadow: 0 4px 15px rgba(0,0,0,0.2); 
        }
        .logo-text { font-family: 'Playfair Display', serif; font-size: 20px; color: white; text-decoration: none; font-weight: 700; }
        nav a { color: white; text-decoration: none; margin-left: 20px; font-size: 14px; }

        .payment-wrapper { display: flex; justify-content: center; align-items: center; min-height: 85vh; padding: 20px; }
        
        .payment-card { 
            background: var(--white); width: 100%; max-width: 450px; 
            padding: 40px; border-radius: var(--radius-lg); 
            box-shadow: var(--shadow-md); text-align: center;
        }

        .amount-box { 
            background: var(--green-pale); padding: 25px; border-radius: 15px; 
            margin: 25px 0; border: 2px dashed var(--green-main); 
        }
        .amount-box span { font-size: 13px; color: var(--green-main); font-weight: 600; text-transform: uppercase; }
        .amount-box strong { display: block; font-size: 42px; color: var(--green-dark); font-family: 'Playfair Display', serif; margin-top: 5px; }

        .info-text { color: #666; font-size: 15px; margin-bottom: 30px; line-height: 1.6; }

        .confirm-btn { 
            width: 100%; padding: 18px; background: var(--green-main); 
            color: white; border: none; border-radius: 12px; 
            font-weight: 600; font-size: 18px; cursor: pointer; 
            transition: var(--transition); box-shadow: 0 6px 20px rgba(46,125,50,0.25); 
        }
        .confirm-btn:hover { background: var(--green-dark); transform: translateY(-3px); }
        
        .error-msg { color: #d32f2f; background: #ffebee; padding: 10px; border-radius: 8px; margin-top: 15px; font-size: 13px; }
    </style>
</head>
<body>

<header>
    <a href="index.jsp" class="logo-text">VILLAGE SERVICES</a>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="service_list.jsp">Back to Services</a>
    </nav>
</header>

<div class="payment-wrapper">
    <div class="payment-card">
        <h2 style="font-family:'Playfair Display'; color:var(--green-dark); margin:0;">Final Step</h2>
        <p style="color:#777; margin-top:10px;">Please review your booking amount</p>

        <div class="amount-box">
            <span>Booking Charges</span>
            <strong>₹<%= cleanPrice %></strong>
        </div>

        <p class="info-text">
            Your service request will be sent to the provider. 
            You can manage your bookings in the dashboard.
        </p>

        <form action="ConfirmBookingServlet" method="post">
            <!-- Hidden data backup -->
            <input type="hidden" name="price" value="<%= cleanPrice %>">
            <input type="hidden" name="providerId" value="<%= providerId %>">

            <button type="submit" class="confirm-btn">Confirm & Book Now</button>
        </form>

        <%-- Agar UserID nahi hai toh warning --%>
        <% if(session1.getAttribute("userId") == null) { %>
            <div class="error-msg">
                <strong>Error:</strong> Session expired. Please <a href="login.jsp">Login</a> again.
            </div>
        <% } %>
    </div>
</div>

</body>
</html>