package sit.int202.classicmodels;

import sit.int202.classicmodels.entities.Order;
import sit.int202.classicmodels.repositories.OrderRepository;

import java.util.List;

public class TestKub {
    public static void main(String[] args) {
        OrderRepository orderRepository = new OrderRepository();
        List<Order> orders = orderRepository.findByCustomerNumber(103);
        for (Order order : orders) {
            System.out.println(order.getOrderDetailList());
        }
    }
}
