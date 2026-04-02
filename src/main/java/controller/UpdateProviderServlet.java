package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.DBConnection;

@WebServlet("/UpdateProviderServlet")
public class UpdateProviderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
              "UPDATE service_providers SET name=?, service=?, mobile=?, village=? WHERE id=?");

            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("service"));
            ps.setString(3, req.getParameter("mobile"));
            ps.setString(4, req.getParameter("village"));
            ps.setString(5, req.getParameter("id"));

            ps.executeUpdate();

            res.sendRedirect("ViewProviderServlet");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}