package controller;

import util.DBConnection;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM providers WHERE mobile=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, mobile);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String role = rs.getString("role");
                String name = rs.getString("full_name");

                HttpSession session = request.getSession();

                session.setAttribute("user", name);
                session.setAttribute("role", role);
                session.setAttribute("mobile", mobile);   // ✅ FIX

                // 🔥 REDIRECT
                if ("provider".equals(role)) {
                    response.sendRedirect("provider_dashboard.jsp");
                } else {
                    response.sendRedirect("service_list.jsp");
                }

            } else {
                response.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}