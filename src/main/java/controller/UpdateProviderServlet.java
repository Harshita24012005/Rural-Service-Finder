package controller;

import util.DBConnection;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/UpdateProviderServlet")
public class UpdateProviderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String experience = request.getParameter("experience");
        String about = request.getParameter("about");

        HttpSession session = request.getSession();
        String mobile = (String) session.getAttribute("mobile");

        try {
            Connection con = DBConnection.getConnection();

            String sql =
              "UPDATE providers SET full_name=?, experience=?, about=? WHERE mobile=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, experience);
            ps.setString(3, about);
            ps.setString(4, mobile);

            int i = ps.executeUpdate();

            if(i > 0){
                session.setAttribute("user", name);  
                response.sendRedirect("provider_dashboard.jsp");
            } else {
                response.getWriter().println("Update failed");
            }

        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println(e.getMessage());
        }
    }
}