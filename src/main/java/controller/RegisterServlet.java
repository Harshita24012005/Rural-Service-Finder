package controller;

import util.DBConnection;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String village = request.getParameter("village");
        String service = request.getParameter("service");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        String experience = request.getParameter("experience");
        String about = request.getParameter("about");

        // 🔥 NEW: FLOW PARAMETER (IMPORTANT)
        String from = request.getParameter("from");
        if(from == null) {
            from = "normal";
        }

        if ("login".equals(from)) {
            response.sendRedirect("payment.jsp");
        }

        String fileName = null;

        // USER ke liye service NA
        if ("user".equals(role)) {
            service = "NA";
            experience = "NA";
            about = "NA";
            fileName = "default.jpg";
        }

        // PROVIDER image upload
        if ("provider".equals(role)) {
            Part filePart = request.getPart("image");

            if (filePart != null && filePart.getSize() > 0) {
                fileName = filePart.getSubmittedFileName();

                String uploadPath = getServletContext().getRealPath("") + "uploads";
                File uploadDir = new File(uploadPath);

                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                filePart.write(uploadPath + File.separator + fileName);
            }
        }

        try {
            Connection con = DBConnection.getConnection();

            // CHECK MOBILE EXISTS
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

            // INSERT QUERY
            String sql = "INSERT INTO providers(full_name, mobile, village, service, password, role, image, experience, about) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, mobile);
            ps.setString(3, village);
            ps.setString(4, service);
            ps.setString(5, password);
            ps.setString(6, role);
            ps.setString(7, fileName);
            ps.setString(8, experience);
            ps.setString(9, about);

            int i = ps.executeUpdate();

            if (i > 0) {

                HttpSession session = request.getSession();
                session.setAttribute("user", name);
                session.setAttribute("mobile", mobile);
                session.setAttribute("role", role);

                // 🔥 NEW FLOW LOGIC
                if ("booking".equals(from)) {
                    response.sendRedirect("payment.jsp");
                }
                else {
                    if ("provider".equals(role)) {
                        response.sendRedirect("provider_dashboard.jsp");
                    } else {
                        response.sendRedirect("registerSuccess.jsp"); 
                    }
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