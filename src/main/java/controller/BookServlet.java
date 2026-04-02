package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBConnection;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            HttpSession session = req.getSession();
            int uid = (int) session.getAttribute("uid");

            int pid = Integer.parseInt(req.getParameter("pid"));
            String service = req.getParameter("service");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO bookings(user_id,provider_id,service,status) VALUES(?,?,?,?)");

            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ps.setString(3, service);
            ps.setString(4, "pending");

            ps.executeUpdate();

            res.sendRedirect("dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

