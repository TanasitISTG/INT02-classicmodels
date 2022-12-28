package sit.int202.classicmodels.servlets.secretServlet;

import at.favre.lib.crypto.bcrypt.BCrypt;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.entities.Employee;
import sit.int202.classicmodels.repositories.EmployeeRepository;

import java.io.IOException;

@WebServlet(name = "SecretAuthenticationServlet", value = "/secret-login")
public class SecretAuthenticationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        if (email == null || email.trim().length() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        EmployeeRepository employeeRepository = new EmployeeRepository();
        Employee employee = employeeRepository.findByEmail(email);
        if (employee == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
        } else {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), employee.getPassword());
            if (!result.verified) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            } else {
                request.getSession().setAttribute("secret_user", employee);
                request.getSession().setAttribute("reports_to", employeeRepository.findReportsTo(employee));
            }
        }

        getServletContext().getRequestDispatcher("/secret/dashboard.jsp").forward(request, response);
    }
}
