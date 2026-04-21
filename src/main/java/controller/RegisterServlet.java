package controller;

import util.DBConnection;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");   // FIXED
        String mobile = request.getParameter("mobile");
        String village = request.getParameter("village");
        String service = request.getParameter("service");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (service == null || service.equals("")) {
            service = "NA";
        }

        try {
            Connection con = DBConnection.getConnection();

            // check mobile already exists
            String checkSql = "SELECT * FROM providers WHERE mobile=?";
            PreparedStatement checkPs = con.prepareStatement(checkSql);
            checkPs.setString(1, mobile);

            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {
                request.setAttribute("error", "Mobile already registered ❌");
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.forward(request, response);
                return;
            }

            // INSERT
            String sql = "INSERT INTO providers (full_name, mobile, village, service, password, role) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1,name);
            ps.setString(2, mobile);
            ps.setString(3, village);
            ps.setString(4, service);
            ps.setString(5, password);
            ps.setString(6, role);

            int i = ps.executeUpdate();

            if (i > 0) {

                // 1. CREATE SESSION (AUTO LOGIN)
                HttpSession session = request.getSession();
                session.setAttribute("user", name);
                session.setAttribute("mobile", mobile);
                session.setAttribute("role", role);

                // 2. ROLE BASED REDIRECT
                if ("provider".equals(role)) {
                    response.sendRedirect("provider_dashboard.jsp");
                } else {
                    response.sendRedirect("service_list.jsp");
                }

            } else {
                response.getWriter().println("Registration Failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}