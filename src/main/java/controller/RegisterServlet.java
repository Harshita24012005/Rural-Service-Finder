package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.DBConnection;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
	        throws ServletException, IOException {

	    res.sendRedirect("register.jsp");
	}

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name,mobile,village,password) VALUES(?,?,?,?)");

            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("mobile"));
            ps.setString(3, req.getParameter("village"));
            ps.setString(4, req.getParameter("password"));

            int x = ps.executeUpdate();

            if (x > 0) {
                res.sendRedirect("login.jsp");   // ✅ IMPORTANT LINE
            } else {
                res.getWriter().print("Registration Failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().print("Error : " + e.getMessage());
        }
    }
}