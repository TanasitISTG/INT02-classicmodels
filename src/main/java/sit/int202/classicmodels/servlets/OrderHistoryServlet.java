package sit.int202.classicmodels.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.entities.Order;
import sit.int202.classicmodels.repositories.OrderRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderHistoryServlet", value = "/order-history")
public class OrderHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer user = (Customer) session.getAttribute("user");

        OrderRepository orderRepository = new OrderRepository();
        List<Order> orderList = orderRepository.findByCustomerNumber(user.getCustomerNumber());
        session.setAttribute("orders", orderList);
        getServletContext().getRequestDispatcher("/order-history.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
