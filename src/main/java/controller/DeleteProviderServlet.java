package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.DBConnection;

@WebServlet("/DeleteProviderServlet")
public class DeleteProviderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String id = req.getParameter("id");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement("DELETE FROM service_providers WHERE id=?");

            ps.setString(1, id);
            ps.executeUpdate();

            res.sendRedirect("ViewProviderServlet");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}