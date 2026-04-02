<%@ page session="true" %>
<%
    // ✅ Session check
    String userMobile = (String) session.getAttribute("userMobile");
    if(userMobile == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<h2>Welcome, <%= userMobile %>!</h2>

<!-- Logout Button -->
<form action="LogoutServlet" method="post">
    <button type="submit">Logout</button>
</form>
<br><br>

<!-- Search Service Form -->
<form action="SearchServlet" method="get">
    Village: <input type="text" name="village" required><br><br>
    Service Type:
    <select name="service_type" required>
        <option value="Electrician">Electrician</option>
        <option value="Plumber">Plumber</option>
        <option value="Carpenter">Carpenter</option>
    </select><br><br>
    <button type="submit">Search Providers</button>
</form>