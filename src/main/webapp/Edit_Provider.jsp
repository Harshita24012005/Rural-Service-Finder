<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<%
String id = request.getParameter("id");
Connection con = DBConnection.getConnection();

PreparedStatement ps =
   con.prepareStatement("SELECT * FROM service_providers WHERE id=?");
ps.setString(1, id);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<h2>Edit Provider</h2>

<form action="UpdateProviderServlet" method="post">

<input type="hidden" name="id" value="<%=id%>">

Name: <input type="text" name="name" value="<%=rs.getString("name")%>"><br><br>

Service:
<select name="service">
  <option><%=rs.getString("service")%></option>
  <option>Electrician</option>
  <option>Plumber</option>
  <option>Doctor</option>
  <option>Mechanic</option>
</select><br><br>

Mobile: <input type="text" name="mobile" value="<%=rs.getString("mobile")%>"><br><br>
Village: <input type="text" name="village" value="<%=rs.getString("village")%>"><br><br>

<button>Update</button>

</form>