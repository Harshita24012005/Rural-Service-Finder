<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Service Providers</title>

    <style>
        body{
            font-family: Arial;
            background: #f4f6f9;
        }

        h2{
            text-align: center;
            margin-top: 20px;
        }

        table{
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
        }

        th, td{
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th{
            background: #007bff;
            color: white;
        }

        a{
            text-decoration: none;
            font-weight: bold;
            margin: 0 5px;
        }

        .update{
            color: green;
        }

        .delete{
            color: red;
        }

        .back{
            margin: 20px;
            display: inline-block;
        }
    </style>
</head>

<body>

<h2>All Service Providers</h2>

<a href="admin_dashboard.jsp" class="back">← Back</a>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Service</th>
        <th>Mobile</th>
        <th>Village</th>
        <th>Action</th>
    </tr>

<%
    try{
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from service_providers");
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("service") %></td>
            <td><%= rs.getString("mobile") %></td>
            <td><%= rs.getString("village") %></td>

            <td>
                <a class="update" href="edit_provider.jsp?id=<%=rs.getInt("id")%>">Update</a>
                |
                <a class="delete" 
                   href="DeleteProviderServlet?id=<%=rs.getInt("id")%>"
                   onclick="return confirm('Are you sure to delete?')">
                   Delete
                </a>
            </td>
        </tr>
<%
        }
    }catch(Exception e){
        e.printStackTrace();
    }
%>

</table>

</body>
</html>