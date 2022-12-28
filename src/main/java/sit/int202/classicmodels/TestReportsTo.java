package sit.int202.classicmodels;

import sit.int202.classicmodels.entities.Employee;
import sit.int202.classicmodels.repositories.EmployeeRepository;

public class TestReportsTo {
    public static void main(String[] args) {
        EmployeeRepository employeeRepository = new EmployeeRepository();
        Employee employee = employeeRepository.findByEmail("ljennings@classicmodelcars.com");
        Employee reportsTo = employeeRepository.findReportsTo(employee);
        System.out.println("Employee: " + employee.getFirstName() + " " + employee.getLastName() + " reports to: " + employee.getReportsTo());
        System.out.println("Reports to: " + reportsTo.getEmployeeNumber() + ", " + reportsTo.getFirstName() + " " + reportsTo.getLastName());
    }
}
