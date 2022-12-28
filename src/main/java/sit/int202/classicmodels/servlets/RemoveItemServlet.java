package sit.int202.classicmodels.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.models.Cart;
import sit.int202.classicmodels.models.ClassicModelLineItem;

import java.io.IOException;

@WebServlet(name = "RemoveItemServlet", value = "/removeItem")
public class RemoveItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productCode = request.getParameter("productCode");
        HttpSession session = request.getSession();
        Cart<String, ClassicModelLineItem> cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.removeItem(productCode);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
