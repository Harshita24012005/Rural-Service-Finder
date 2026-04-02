package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBConnection;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String u = req.getParameter("username");
        String p = req.getParameter("password");

        System.out.println("FORM USERNAME = " + u);
        System.out.println("FORM PASSWORD = " + p);

        try {
            Connection con = DBConnection.getConnection();
            System.out.println("DB Connected");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM admin WHERE username=? AND password=?");

            ps.setString(1, u.trim());
            ps.setString(2, p.trim());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("admin", u);

                System.out.println("Admin Login Successful");

                res.sendRedirect("admin_dashboard.jsp");

            } else {
                System.out.println("Invalid Admin Login");
                res.getWriter().println("Invalid Admin Login");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }
}