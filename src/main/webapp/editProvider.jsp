<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>
<%
    String mobile = (String) session.getAttribute("mobile");

    if(mobile == null){
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = DBConnection.getConnection();

    String sql = "SELECT * FROM providers WHERE mobile=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, mobile);

    ResultSet rs = ps.executeQuery();

    if(!rs.next()){
        out.println("Provider data not found");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>
    <a class="logo" href="provider_dashboard.jsp">
        <img src="<%= request.getContextPath() %>/images/logo.png">
        <div class="logo-text">RSF <span>Edit Profile</span></div>
    </a>
</header>

<div class="register-container">
<div class="register-card">

<h2>Edit Your Details</h2>

<form action="UpdateProviderServlet" method="post">

    <div class="form-group">
        <label>Name</label>
        <input type="text"
               name="name"
               value="<%= rs.getString("full_name") %>">
    </div>

    <div class="form-group">
        <label>Experience</label>
        <input type="text"
               name="experience"
               value="<%= rs.getString("experience") %>">
    </div>

    <div class="form-group">
        <label>About</label>
        <textarea name="about"><%= rs.getString("about") %></textarea>
    </div>

    <button class="btn-primary">
        Update Profile
    </button>

</form>

</div>
</div>

</body>
</html>