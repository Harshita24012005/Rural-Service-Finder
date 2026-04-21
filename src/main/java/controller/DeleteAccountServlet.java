package controller;

import util.DBConnection;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/deleteAccount")
public class DeleteAccountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String mobile = (String) session.getAttribute("mobile");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            // 🔍 STEP 1: VERIFY PASSWORD
            String checkSql = "SELECT * FROM providers WHERE mobile=? AND password=?";
            PreparedStatement checkPs = con.prepareStatement(checkSql);
            checkPs.setString(1, mobile);
            checkPs.setString(2, password);

            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {

                // ✅ STEP 2: DELETE ACCOUNT
                String deleteSql = "DELETE FROM providers WHERE mobile=?";
                PreparedStatement deletePs = con.prepareStatement(deleteSql);
                deletePs.setString(1, mobile);

                int i = deletePs.executeUpdate();

                if (i > 0) {
                    session.invalidate();
                    response.sendRedirect("home.jsp?deleted=1");
                }

            } else {
                // ❌ WRONG PASSWORD
                response.sendRedirect("provider_dashboard.jsp?error=wrongpass");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}