<%@ page session="true" %>
<%
    if(session.getAttribute("admin") == null){
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>

<h2>Welcome Admin</h2>

<div class="dashboard">

    <a href="add_provider.jsp">Add Service Provider</a><br><br>

    <a href="ViewProviderServlet">View / Delete Providers</a><br><br>

    <a href="admin_logout.jsp">Logout</a>

</div>

</body>
</html>