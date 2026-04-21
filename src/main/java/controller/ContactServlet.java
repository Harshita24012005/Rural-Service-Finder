package controller;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Here you can save the contact info to database or send email
        // For now, just redirect to a success page
        response.sendRedirect("contact_success.jsp");
    }
}