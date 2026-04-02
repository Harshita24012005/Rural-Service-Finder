package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.DBConnection;

@WebServlet("/ServiceServlet")
public class ServiceServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String type = req.getParameter("type");

        ArrayList<String[]> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM service_providers WHERE service=?");

            ps.setString(1, type);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String row[] = new String[4];
                row[0] = rs.getString("name");
                row[1] = rs.getString("mobile");
                row[2] = rs.getString("village");
                row[3] = rs.getString("service");
                list.add(row);
            }

            req.setAttribute("data", list);
            req.setAttribute("service", type);

            req.getRequestDispatcher("service_list.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}