package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBConnection;

@WebServlet("/SearchProviderServlet")
public class SearchProviderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String village = req.getParameter("village");
        String service = req.getParameter("service");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM service_providers WHERE village=? AND service=?");

            ps.setString(1, village);
            ps.setString(2, service);

            ResultSet rs = ps.executeQuery();

            ArrayList<String[]> list = new ArrayList<>();

            while(rs.next()) {
                String[] data = new String[5];
                data[0] = rs.getString("name");
                data[1] = rs.getString("service");
                data[2] = rs.getString("mobile");
                data[3] = rs.getString("village");

                list.add(data);
            }

            HttpSession session = req.getSession();
            session.setAttribute("providers", list);

            res.sendRedirect("view_providers_user.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}