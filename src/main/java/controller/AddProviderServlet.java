package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnection;

@WebServlet("/AddProviderServlet")
public class AddProviderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        System.out.println("AddProviderServlet called");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO service_providers(name,service,mobile,village) VALUES(?,?,?,?)");

            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("service"));
            ps.setString(3, req.getParameter("mobile"));
            ps.setString(4, req.getParameter("village"));

            int x = ps.executeUpdate();
            System.out.println("Rows inserted = " + x);

            res.sendRedirect("admin_dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();   // CONSOLE me error dikhegi
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }
}