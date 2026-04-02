package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.DBConnection;   // ✅ IMPORTANT

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String service = request.getParameter("service");

	    java.util.ArrayList<String> list = new java.util.ArrayList<>();

	    try {
	        java.sql.Connection con = util.DBConnection.getConnection();

	        java.sql.PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM providers WHERE service LIKE ?"
	        );

	        ps.setString(1, "%" + service + "%");

	        java.sql.ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            list.add(
	                rs.getString("name") + "," +
	                rs.getString("location") + "," +
	                rs.getDouble("rating")
	            );
	        }

	        // 👉 send data to JSP
	        request.setAttribute("data", list);

	        // 👉 go back to same page
	        response.setContentType("text/html");
	        response.getWriter().println("<h1>Servlet Working</h1>");
	        response.getWriter().println("Results size: " + list.size());

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}