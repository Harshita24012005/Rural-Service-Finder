package controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.DBConnection;

@WebServlet("/ViewProviderServlet")
public class ViewProviderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        ArrayList<String[]> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement("SELECT * FROM service_providers");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String arr[] = new String[5];
                arr[0] = rs.getString("id");
                arr[1] = rs.getString("name");
                arr[2] = rs.getString("service");
                arr[3] = rs.getString("mobile");
                arr[4] = rs.getString("village");

                list.add(arr);
            }

            req.setAttribute("list", list);
            req.getRequestDispatcher("view_provider.jsp")
               .forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}