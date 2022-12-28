package sit.int202.classicmodels.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.models.Cart;
import sit.int202.classicmodels.models.ClassicModelLineItem;

import java.io.IOException;

@WebServlet(name = "UpdateNumberOfItemServlet", value = "/update-number-of-item")
public class UpdateNumberOfItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") != null) {
            Cart<String, ClassicModelLineItem> cart = (Cart) session.getAttribute("cart");
            response.getWriter().print(cart.getQuantity());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
