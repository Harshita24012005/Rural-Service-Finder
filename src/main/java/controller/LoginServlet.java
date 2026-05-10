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

         // ... baaki code same rahega ...

            if (rs.next()) {
                String role = rs.getString("role");
                String name = rs.getString("full_name");
                int id = rs.getInt("id");

                HttpSession session = request.getSession();
                session.setAttribute("user", name);
                session.setAttribute("role", role);
                session.setAttribute("mobile", mobile);
                session.setAttribute("userId", id);
                session.setAttribute("flow", "booking");
                response.sendRedirect("payment.jsp");

                // 1. JSP se hidden fields wale parameters uthao
                String redirect = request.getParameter("redirect");
                String price = request.getParameter("price");
                String providerId = request.getParameter("providerId");

                // 2. Redirection Logic with Parameters
                if (redirect != null && !redirect.trim().isEmpty() && !redirect.equals("null")) {
                    // Agar redirect payment.jsp hai, toh price aur providerId bhi bhejo
                    if (redirect.contains("payment.jsp")) {
                        response.sendRedirect(redirect + "?price=" + price + "&providerId=" + providerId);
                    } else {
                        response.sendRedirect(redirect);
                    }
                } 
                else if ("provider".equals(role)) {
                    response.sendRedirect("provider_dashboard.jsp");
                } 
                else {
                    response.sendRedirect("service_list.jsp");
                }
            }
                
// ... baaki redirection logic same rahega ...

               
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}