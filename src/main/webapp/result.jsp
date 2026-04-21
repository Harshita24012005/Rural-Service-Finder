<%@ page import="java.util.*" %>

<h2>Search Results</h2>

<%
List<Map<String, String>> list =
    (List<Map<String, String>>) request.getAttribute("data");

if (list == null || list.isEmpty()) {
%>
    <h3>No providers found 😢</h3>
<%
} else {
    for (Map<String, String> row : list) {
%>

<div style="border:1px solid #ccc; padding:10px; margin:10px;">
    <h3><%= row.get("name") %></h3>
    <p>Service: <%= row.get("service") %></p>
    <p>Village: <%= row.get("village") %></p>
    <p>Phone: <%= row.get("phone") %></p>
</div>

<%
    }
}
%>