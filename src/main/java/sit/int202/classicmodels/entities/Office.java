package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@NamedQueries({
        @NamedQuery(name = "Office.FIND_BY_CITY_OR_COUNTRY",
                query = "select o from Office o where lower(o.city) like :city or lower(o.country) like :country")
})
@Entity
@Table(name = "Offices")
@Getter
@Setter
@ToString(of = {"officeCode", "city", "country"})
public class Office {
    @Id
    private String officeCode;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String country;
    private String postalCode;
    private String phone;
    private String territory;
    @OneToMany(mappedBy = "officeCode")
    private List<Employee> employeeList;
}
