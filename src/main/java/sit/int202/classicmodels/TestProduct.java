package sit.int202.classicmodels;

import sit.int202.classicmodels.entities.Product;
import sit.int202.classicmodels.repositories.ProductRepository;

public class TestProduct {
    public static void main(String[] args) {
        ProductRepository repository = new ProductRepository();
        for (Product product : repository.findAll(1, 10)) {
            System.out.println(product.getProductCode());
        }
    }
}
