package sit.int202.classicmodels.servlets;

import at.favre.lib.crypto.bcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.repositories.CustomerRepository;

import java.io.IOException;

@WebServlet(name = "AuthenticationServlet", value = "/login")
public class AuthenticationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //doPost(request, response);
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String userName = request.getParameter("userName");
        if (userName == null || userName.trim().length() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        CustomerRepository customerRepository = new CustomerRepository();
        Customer customer = customerRepository.findByName(userName);
        if (customer == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
        } else {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), customer.getPassword());
            if (!result.verified) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            } else {
                request.getSession().setAttribute("user", customer);
            }
        }
    }
}
