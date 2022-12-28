package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Customer;

import java.util.List;
public class CustomerRepository {
    private EntityManager entityManager;

    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }

    public Customer find(Integer customerId) {
        return getEntityManager().find(Customer.class, customerId);
    }

    public Customer findByName(String name) {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("Customer.FIND_USER");
        query.setParameter("user_account", name);
        List<Customer> customers = query.getResultList();
        em.close();
        return customers.size()==0? null : customers.get(0);
    }
}
