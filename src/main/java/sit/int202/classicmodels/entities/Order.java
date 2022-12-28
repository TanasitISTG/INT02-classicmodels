package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "orders")
@NamedQueries({
//        @NamedQuery(name = "Order.FIND_BY_CUSTOMER_NUMBER",
//                query = "select o from Order o join fetch o.orderDetailList od where o.customerNumber = :customerNumber")
        @NamedQuery(name = "Order.FIND_BY_CUSTOMER_NUMBER",
                query = "select o from Order o join fetch o.orderDetailList od join fetch od.product p where o.customerNumber = :customerNumber")
})
public class Order {
    @Id
    private Integer orderNumber;
    private Date orderDate;
    private Date shippedDate;
    private String status;
    private Integer customerNumber;
    private String comments;

    @OneToMany(mappedBy = "orderNumber")
    private List<OrderDetail> orderDetailList;
}