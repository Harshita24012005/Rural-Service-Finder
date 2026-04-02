<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Service Providers</title>

<style>
body{font-family:Arial;background:#f4f6f8;}
table{
    width:80%;
    margin:50px auto;
    border-collapse:collapse;
    background:white;
}
th,td{
    border:1px solid #ccc;
    padding:10px;
    text-align:center;
}
th{
    background:#4CAF50;
    color:white;
}
</style>

</head>
<body>

<h2 align="center">Available Service Providers</h2>

<table>
<tr>
    <th>Name</th>
    <th>Service</th>
    <th>Mobile</th>
    <th>Village</th>
</tr>

<%
ArrayList<String[]> list = (ArrayList<String[]>)session.getAttribute("providers");

if(list!=null && list.size()>0){
    for(String[] row : list){
%>
<tr>
    <td><%=row[0]%></td>
    <td><%=row[1]%></td>
    <td><%=row[2]%></td>
    <td><%=row[3]%></td>
</tr>
<%
    }
}else{
%>
<tr>
    <td colspan="4">No Service Provider Found</td>
</tr>
<% } %>

</table>

</body>
</html>