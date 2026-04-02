<%@ page import="java.util.*" %>
<%
    ArrayList<String[]> list =
        (ArrayList<String[]>)request.getAttribute("data");

    String service = (String)request.getAttribute("service");
%>

<!DOCTYPE html>
<html>
<head>
    <title><%=service%> List</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>

<h2><%= service %> Available Near You</h2>

<table border="1" cellpadding="10">
<tr>
    <th>Name</th>
    <th>Mobile</th>
    <th>Village</th>
</tr>

<%
    for(String arr[] : list){
%>
<tr>
    <td><%= arr[0] %></td>
    <td><%= arr[1] %></td>
    <td><%= arr[2] %></td>
</tr>
<%
    }
%>

</table>

<br>
<a href="dashboard.jsp">⬅ Back to Dashboard</a>

</body>
</html>