package sit.int202.classicmodels;

import at.favre.lib.crypto.bcrypt.BCrypt;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.repositories.CustomerRepository;

public class TestBcrypt {
    public static void main(String[] args) {
        CustomerRepository repository = new CustomerRepository();
        Customer c = repository.findByName("Jean King");
        System.out.println(c.getContactFirstName()+ " : "+ c.getPassword());
        BCrypt.Result result = BCrypt.verifyer().verify("1234xxx".toCharArray(), c.getPassword());
        System.out.println("Is the password correct? : "+ result.verified);

        result = BCrypt.verifyer().verify("god".toCharArray(), c.getPassword());
        System.out.println("Is the password correct? : "+ result.verified);
    }
}
