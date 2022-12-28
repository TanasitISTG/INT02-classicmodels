package sit.int202.classicmodels;

import sit.int202.classicmodels.entities.Employee;
import sit.int202.classicmodels.entities.Office;
import sit.int202.classicmodels.repositories.OfficeRepository;

import java.util.List;
import java.util.Scanner;

public class TestJpa {
    private static final Scanner scanner = new Scanner(System.in);
    private static final OfficeRepository repository = new OfficeRepository();

    public static void main(String[] args) {
        int choice = 0;
        do {
            choice = menu();
            switch (choice) {
                case 1:
                    addNewOffice();
                    break;
                case 2:
                    updateOffice();
                    break;
                case 3:
                    deleteOffice();
                    break;
                case 4:
                    searchOffice();
                    break;
                case 5:
                    listAllOffice();
                    break;
            }
        } while (choice > 0);
    }

    private static void searchOffice() {
        System.out.print("Enter country or city to find: ");
        String cityOrCoutry = scanner.next();
        List<Office> offices = repository.findByCityOrCountry(cityOrCoutry);
        if (!offices.isEmpty()) {
            System.out.printf("Office search by %s*\n", cityOrCoutry);
            System.out.println("-------------------------");
            offices.forEach(office -> printOffice(office));
        } else {
            System.out.printf("Office search by %s* does not exist !!!\n", cityOrCoutry);
        }
    }

    private static void listAllOffice() {
        repository.findAll().forEach(o -> printOffice(o));
    }

    private static void printOffice(Office o) {
        System.out.print("Office Code: " + o.getOfficeCode());
        System.out.print(", City: " + o.getCity());
        System.out.println(", Country: " + o.getCountry());
        System.out.println("-------------");
        for (Employee employee : o.getEmployeeList()) {
            System.out.println(employee.getEmployeeNumber() + ": "+ employee.getFirstName()+
                    " "+ employee.getLastName());
        }
        System.out.println("");
    }

    private static int menu() {
        System.out.println("\n\n");
        System.out.println("M E N U");
        System.out.println("====================");
        System.out.println("1) Add New Office");
        System.out.println("2) Edit Office");
        System.out.println("3) Delete Office");
        System.out.println("4) Search Office");
        System.out.println("5) List All Office");
        System.out.println("--------------------");
        System.out.println("0) Exit");
        System.out.print("\nSelect your choice: ");
        return scanner.nextInt();
    }

    private static void addNewOffice() {
        int x = (int) (Math.random() * 99 + 7);
        Office newOffice = new Office();
        newOffice.setOfficeCode(String.valueOf(x));
        newOffice.setAddressLine1("126 Pracha-Utit, Bangmod");
        newOffice.setAddressLine2("Thungkru");
        newOffice.setCity("Bangkok");
        newOffice.setCountry("Thailand");
        newOffice.setPostalCode("10140");
        newOffice.setPhone("+66 2 470 9872");
        newOffice.setState("");
        newOffice.setTerritory("SE-A");
        if (repository.insert(newOffice)) {
            System.out.println("Inserted New Office ::");
        } else {
            System.out.println("Can't insert Office ::");
        }
        printOffice(newOffice);
    }

    private static void updateOffice() {
        System.out.print("Enter office code to UPDATE: ");
        String officeCode = scanner.next();
        Office office = repository.find(officeCode);
        if (office != null) {
            System.out.println(":: Updating Offfice ::");
            printOffice(office);
            repository.getTransaction().begin();
            System.out.print("Enter new city: ");
            office.setCity(scanner.next());
            System.out.print("Enter new country: ");
            office.setCountry(scanner.next());
            repository.getTransaction().commit();
            System.out.printf("Office %s has been updated already !!", officeCode);
        }
    }

    private static void deleteOffice() {
        System.out.print("Enter office code to DELETE (by code): ");
        String officeCode = scanner.next();
        System.out.println(officeCode + (repository.delete(officeCode) ? " was deleted" : " does not exist !!!"));
        System.out.println("------------");
        System.out.print("Enter office code to DELETE (by Object): ");
        officeCode = scanner.next();
        Office office = repository.find(officeCode);
        if (repository.delete(office)) {
            System.out.printf("Office %s was deleted\n", officeCode);
        } else {
            System.out.printf("Office NOT FOUND or Error occurred while delete Office %s \n", officeCode);
        }
    }
}
