package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import util.DBConnection;

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 1. Session check: Agar user login nahi hai toh redirect
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 2. Data retrieve karna (Pehle Request se, phir Session se backup)
            String reqPrice = request.getParameter("price");
            String reqProviderId = request.getParameter("providerId");
            
            // Session se UserID uthana (Ye Login ke waqt set kiya tha)
            Object userIdObj = session.getAttribute("userId");

            int price = 0;
            int providerId = 0;
            int userId = 0;

            // --- Price Handling ---
            if (reqPrice != null && !reqPrice.isEmpty() && !reqPrice.equals("null")) {
                price = Integer.parseInt(reqPrice);
            } else if (session.getAttribute("price") != null) {
                price = Integer.parseInt(session.getAttribute("price").toString());
            }

            // --- Provider ID Handling ---
            if (reqProviderId != null && !reqProviderId.isEmpty() && !reqProviderId.equals("null")) {
                providerId = Integer.parseInt(reqProviderId);
            } else if (session.getAttribute("providerId") != null) {
                providerId = Integer.parseInt(session.getAttribute("providerId").toString());
            }

            // --- User ID Handling ---
            if (userIdObj != null) {
                userId = Integer.parseInt(userIdObj.toString());
            }

            // Debugging check: Agar abhi bhi 0 hai toh error return karein
            if (userId == 0 || providerId == 0) {
                response.getWriter().println("Error: Missing Data. UserID: " + userId + ", ProviderID: " + providerId);
                return;
            }

            // 3. Database Operation
            Connection con = DBConnection.getConnection();
            String query = "INSERT INTO bookings(user_id, provider_id, price, status) VALUES(?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, providerId);
            ps.setInt(3, price);
            ps.setString(4, "CONFIRMED");

            int result = ps.executeUpdate();
            ps.close();
            con.close();

            if (result > 0) {
                // Booking success: Session values clean kar dein taaki purana data na rahe
                session.removeAttribute("price");
                session.removeAttribute("providerId");
                
                response.sendRedirect("bookProvider.jsp?status=success");
            } else {
                response.getWriter().println("Booking failed in database.");
            }

        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
            response.getWriter().println("Error: Invalid number format (Price/ID is null or invalid)");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}