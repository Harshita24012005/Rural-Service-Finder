<%@ page import="java.sql.*" %>
<%
    ResultSet rs = (ResultSet) request.getAttribute("providers");
%>

<h2>Available Providers</h2>

<table border="1">
    <tr>
        <th>Name</th>
        <th>Mobile</th>
        <th>Service Type</th>
        <th>Village</th>
    </tr>

<%
    while(rs != null && rs.next()) {
%>
    <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("mobile") %></td>
        <td><%= rs.getString("service_type") %></td>
        <td><%= rs.getString("village") %></td>
    </tr>
<%
    }
%>
</table>

<a href="dashboard.jsp">Back</a>