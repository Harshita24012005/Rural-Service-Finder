<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<style>
body{
    font-family: Arial;
    background:#f4f6f8;
}
.container{
    width:80%;
    margin:auto;
}
.card{
    background:white;
    padding:30px;
    margin-top:50px;
    text-align:center;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}
a{
    text-decoration:none;
}
.btn{
    padding:12px 25px;
    background:#4CAF50;
    color:white;
    border-radius:5px;
    font-size:18px;
}
</style>

</head>
<body>

<div class="container">
    <div class="card">
        <h1>Welcome to Rural Service Finder</h1>
        <p>Find trusted service providers near your village</p>
        <br>
        <a href="search_service.jsp" class="btn">Search Services</a>
    </div>
</div>

</body>
</html>