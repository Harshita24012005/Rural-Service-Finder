package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import util.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String mobile = req.getParameter("mobile");
        String password = req.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE mobile=? AND password=?"
            );
            ps.setString(1, mobile);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // ✅ Login Success → session create
                HttpSession session = req.getSession();
                session.setAttribute("userMobile", mobile);

                // Forward to dashboard (absolute safe path)
                req.getRequestDispatcher("/dashboard.jsp").forward(req, res);
                return;
            } else {
                // Invalid login
                res.setContentType("text/html");
                res.getWriter().println("<h2>Invalid mobile or password</h2>");
                res.getWriter().println("<a href='login.jsp'>Back to Login</a>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}