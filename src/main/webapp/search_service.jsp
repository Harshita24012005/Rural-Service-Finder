<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Services</title>

<style>
body{
    font-family: Arial;
    background:#f0f2f5;
}
.box{
    width:400px;
    background:white;
    margin:80px auto;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}
input,select,button{
    width:100%;
    padding:10px;
    margin-top:10px;
}
button{
    background:#2196F3;
    color:white;
    border:none;
    font-size:16px;
}
</style>

</head>
<body>

<div class="box">
<h2>Search Service Provider</h2>

<form action="SearchProviderServlet" method="post">

<label>Village:</label>
<input type="text" name="village" required>

<label>Service Type:</label>
<select name="service">
    <option value="Doctor">Doctor</option>
    <option value="Plumber">Plumber</option>
    <option value="Electrician">Electrician</option>
    <option value="Carpenter">Carpenter</option>
    <option value="Mechanic">Mechanic</option>
</select>

<button type="submit">Search</button>

</form>
</div>

</body>
</html>