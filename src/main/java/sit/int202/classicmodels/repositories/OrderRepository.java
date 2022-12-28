package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Order;

import java.util.List;

public class OrderRepository {
    private EntityManager entityManager;
    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }

    public Order find(Integer orderNumber) {
        return getEntityManager().find(Order.class, orderNumber);
    }

    public List<Order> findByCustomerNumber(Integer customerNumber) {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("Order.FIND_BY_CUSTOMER_NUMBER");
        query.setParameter("customerNumber", customerNumber);
        List<Order> orders = query.getResultList();
        em.close();
        return orders;
    }
}
