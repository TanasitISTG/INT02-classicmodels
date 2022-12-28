package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "employees")
@NamedQueries({
        @NamedQuery(name = "Employee.FIND_EMPLOYEE",
                    query = "SELECT e FROM Employee e WHERE e.email = :email")
})
public class Employee {
    @Id
    private Integer employeeNumber;
    private String firstName;
    private String lastName;
    private String extension;
    private String email;
    private String officeCode;
    private Integer reportsTo;
    private String jobTitle;
    private String password;

    @ManyToOne
    @JoinColumn(name = "officeCode", referencedColumnName = "officeCode", insertable = false, updatable = false)
    private Office office;
}

