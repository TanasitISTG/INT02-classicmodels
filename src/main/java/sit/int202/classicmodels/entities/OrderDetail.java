package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "orderdetails")
public class OrderDetail {
    @Id
    private Integer orderNumber;
    @Id
    private String productCode;
    private Integer quantityOrdered;
    private BigDecimal priceEach;
    private Integer orderLineNumber;
    @ManyToOne
    @JoinColumn(name = "productCode")
    private Product product;
}