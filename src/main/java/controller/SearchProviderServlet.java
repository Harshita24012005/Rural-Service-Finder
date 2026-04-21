package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SearchProviderServlet")
public class SearchProviderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String village = request.getParameter("village");
        String service = request.getParameter("service");

        ProviderDAO dao = new ProviderDAO();
        List<Provider> providers = dao.getProviders(village, service);

        request.setAttribute("providers", providers);

        request.getRequestDispatcher("showProviders.jsp").forward(request, response);
    }
}