package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Employee;

import java.util.List;

public class EmployeeRepository {
    private EntityManager entityManager;

    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }

    public Employee findByEmail(String email) {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("Employee.FIND_EMPLOYEE");
        query.setParameter("email", email);
        List<Employee> employees = query.getResultList();
        em.close();
        return employees.size()==0? null : employees.get(0);
    }

    public Employee findReportsTo(Employee employee) {
        EntityManager em = getEntityManager();
        Employee reportsTo = em.find(Employee.class, employee.getReportsTo());
        em.close();
        return reportsTo;
    }
}
