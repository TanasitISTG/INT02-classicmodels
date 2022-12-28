package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "customers")
@Getter
@Setter
@NamedQueries({
        @NamedQuery(name = "Customer.FIND_USER",
                query = "SELECT c FROM Customer c WHERE concat(trim(c.contactFirstName), ' ', trim(c.contactLastName)) = :user_account")
})
public class Customer {
    @Id
    private Integer customerNumber;
    private String customerName;
    private String contactFirstName;
    private String contactLastName;
    private String password;
    private String phone;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String postalCode;
    private String country;
    private Integer salesRepEmployeeNumber;
    private Double creditLimit;

    @OneToMany(mappedBy = "customerNumber")
    private List<Order> orderList;
}
