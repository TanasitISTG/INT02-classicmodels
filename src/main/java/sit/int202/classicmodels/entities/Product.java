package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "products", indexes = {
        @Index(name = "productLine", columnList = "productLine")
})
@Getter
@Setter
@NamedQueries({
        @NamedQuery(name = "Product.FindAll", query = "SELECT p FROM Product p"),
        @NamedQuery(name = "Product.count", query = "SELECT count(p) as count FROM Product p")
})
public class Product {
    @Id
    private String productCode;
    private String productName;
    private String productLine;
    private String productScale;
    private String productVendor;
    private String productDescription;
    @Column(name = "quantityInStock")
    private String quantity;
    private Double buyPrice;
    private Double msrp;
}
