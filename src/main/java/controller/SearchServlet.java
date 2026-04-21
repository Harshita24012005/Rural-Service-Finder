package controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get village from input
        String village = request.getParameter("village");

        System.out.println("Village entered: " + village); // DEBUG

        // 2. Call DAO
        ProviderDAO dao = new ProviderDAO();
        List<Provider> providers = dao.getProvidersByVillage(village);

        System.out.println("Records found: " + providers.size()); // DEBUG

        // 3. Send data to JSP
        request.setAttribute("providers", providers);

        // 4. Forward to result page
        request.getRequestDispatcher("showProviders.jsp").forward(request, response);
    }
}