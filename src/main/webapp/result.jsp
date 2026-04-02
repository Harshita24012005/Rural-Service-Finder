<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Results</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<h2>Search Results</h2>

<%
ArrayList<String> list = (ArrayList<String>) request.getAttribute("data");

if(list != null && !list.isEmpty()){
    for(String s : list){
        String arr[] = s.split(",");
%>

<div class="provider-card">
    <div class="provider-info">
        <h3><%= arr[0] %></h3>
        <p><%= arr[1] %> • ⭐ <%= arr[2] %></p>
    </div>
</div>

<%
    }
}else{
%>

<h3>No results found ❌</h3>

<%
}
%>

</body>
</html>