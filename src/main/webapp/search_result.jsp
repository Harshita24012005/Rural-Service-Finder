<%@ page import="java.util.*" %>

<%
ArrayList<String[]> list =
   (ArrayList<String[]>)request.getAttribute("data");
%>

<h2>Search Result</h2>

<table border="1" cellpadding="10">
<tr>
 <th>Name</th><th>Mobile</th><th>Village</th><th>Service</th>
</tr>

<%
for(String arr[] : list){
%>
<tr>
 <td><%=arr[0]%></td>
 <td><%=arr[1]%></td>
 <td><%=arr[2]%></td>
 <td><%=arr[3]%></td>
</tr>
<% } %>
</table>

<br>
<a href="dashboard.jsp">⬅ Back</a>