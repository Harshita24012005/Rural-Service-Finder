<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<%
    String id = request.getParameter("id");
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM providers WHERE id=?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();

    if(rs.next()){
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= rs.getString("full_name") %> - Details</title>
    <link rel="stylesheet" href="css/style.css">
    
    <style>
        /* Tumhare premium colors */
        :root {
            --green-dark: #1a4731;
            --green-main: #2e7d32;
            --green-pale: #e8f5e9;
            --text-dark: #1c1c1c;
        }

        body { font-family: 'DM Sans', sans-serif; background-color: #faf8f3; margin: 0; }
        
        .details-container { padding: 40px 20px; display: flex; justify-content: center; }
        
        .details-card { 
            background: white; padding: 30px; border-radius: 20px; 
            box-shadow: 0 8px 24px rgba(0,0,0,0.1); max-width: 500px; width: 100%; 
        }

        .details-image { 
            width: 130px; height: 130px; border-radius: 50%; object-fit: cover;
            border: 4px solid var(--green-main); margin: 0 auto 20px; display: block;
        }

        h2 { text-align: center; color: var(--green-dark); font-family: 'Playfair Display', serif; margin-bottom: 5px; }
        .service-tag { text-align: center; color: var(--green-main); font-weight: 600; margin-bottom: 20px; display: block; }

        /* Price Table Styling */
        .price-table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        .price-table td { padding: 12px; border-bottom: 1px solid #eee; font-size: 14px; }
        .price-table td:last-child { text-align: right; font-weight: bold; color: var(--green-dark); }

        /* Selection Box */
        .selection-area { background: var(--green-pale); padding: 20px; border-radius: 15px; }
        
        .check-item { 
            display: flex; justify-content: space-between; align-items: center;
            background: white; padding: 12px; border-radius: 10px; margin-bottom: 10px;
            cursor: pointer; border: 1px solid transparent; transition: 0.3s;
        }
        .check-item:hover { border-color: var(--green-main); }
        .check-item input { margin-right: 10px; accent-color: var(--green-main); }

        .total-display { 
            margin-top: 15px; padding: 15px; background: var(--green-dark); 
            color: white; border-radius: 10px; display: flex; justify-content: space-between;
            font-size: 18px; font-weight: bold;
        }

        .btn-book { 
            width: 100%; padding: 15px; background: var(--green-main); 
            color: white; border: none; border-radius: 12px; font-size: 16px; 
            font-weight: 600; cursor: pointer; margin-top: 20px; transition: 0.3s;
        }
        .btn-book:hover { background: var(--green-dark); transform: translateY(-2px); }
    </style>
</head>
<body>

<div class="details-container">
    <div class="details-card">
        <img src="uploads/<%= rs.getString("image") %>" class="details-image">
        <h2><%= rs.getString("full_name") %></h2>
        <span class="service-tag"><%= rs.getString("service") %></span>

        <p style="font-size: 14px; color: #555;">
            <strong>Experience:</strong> <%= rs.getString("experience") %><br>
            <strong>Village:</strong> <%= rs.getString("village") %>
        </p>

        <hr style="border: 0; border-top: 1px solid #eee;">

        <div class="selection-area">
            <h4 style="margin-top:0;">Select Services:</h4>
            
            <%-- Loop to show only valid services --%>
            <% for(int i=1; i<=3; i++) { 
                String work = rs.getString("work"+i);
                String price = rs.getString("price"+i);
                if(work != null && !work.trim().isEmpty()) { %>
                <%-- Loop ke andar jahan price dikha rahe hain --%>
<label class="check-item">
    <span>
        <% 
            // Data saaf kar rahe hain: agar price mein pehle se ₹ hai toh use hatayein
            String cleanPriceValue = price.replace("₹", "").replace(",", "").trim(); 
        %>
        <input type="checkbox" class="service-check" value="<%= cleanPriceValue %>" onchange="calcTotal()">
        <%= work %>
    </span>
    <strong>₹<%= cleanPriceValue %></strong> <%-- Yahan sirf ek baar ₹ aayega --%>
</label>
            <% } } %>

            <div class="total-display">
                <span>Total Amount:</span>
                <span>₹<span id="finalPrice">0</span></span>
            </div>
        </div>

        <button class="btn-book" onclick="goToPayment()">Login/Sign up tp Proceed</button>
    </div>
</div>

<script>
function calcTotal() {
    let sum = 0;
    document.querySelectorAll('.service-check').forEach(cb => {
        if(cb.checked) sum += parseInt(cb.value);
    });
    document.getElementById('finalPrice').innerText = sum;
}

function goToPayment() {
    let total = document.getElementById('finalPrice').innerText;
    let pId = "<%= rs.getInt("id") %>";
    
    if(total == "0" || total == "") {
        alert("Please select at least one service!");
        return;
    }

    // Is URL ko dhyan se dekho. Hum parameters bhej rahe hain taaki login page inhe pakad sake.
    window.location.href = "login.jsp?redirect=payment.jsp&price=" + total + "&providerId=" + pId;
}
</script>

</body>
</html>

<%
    }
    if(con != null) con.close();
%>