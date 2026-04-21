package controller;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import util.DBConnection;

public class AddProviderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String service = request.getParameter("service");
        String village = request.getParameter("village");
        String phone = request.getParameter("phone");

        try {
            Connection con = DBConnection.getConnection();
            String query = "INSERT INTO providers(name, service, village, phone, status) VALUES (?, ?, ?, ?, 'pending')";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, service);
            ps.setString(3, village);
            ps.setString(4, phone);

            ps.executeUpdate();
            response.sendRedirect("success.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}